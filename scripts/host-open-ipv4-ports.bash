#!/bin/bash

get_container_name() {
  local pid="$1"
  local address="$2"
  local proto="$3"

  CGROUP=$(cat /proc/$pid/cgroup)
  if [[ "$CGROUP" =~ ^0::/system.slice/docker- ]] ; then
    CONTAINER_ID=$(echo $CGROUP | sed 's~^.*/docker-\([a-z0-9]\+\)\.scope~\1~')
    docker inspect --format '{{.Name}}' "${CONTAINER_ID}" | sed 's/^\///'
    return
  elif [[ "$CGROUP" =~ ^0::/system.slice/docker.service$ ]] ; then
    # echo "docker system"
    get_docker_proxy "$address" "$proto"
    return
  fi
  echo "-"
}

get_docker_proxy() {
  local address="$1"
  local proto="$2"
  CONTAINER=$(docker inspect --format '{{range $p, $conf := .NetworkSettings.Ports}}{{if $conf}}{{ $p }} {{(index $conf 0).HostIP}}:{{(index $conf 0).HostPort}} {{$.Name}}{{"\n"}}{{end}}{{end}}' $(sudo docker ps -aq --no-trunc) | grep -v '127.0.0.1' | sed 's~^[0-9]\+/~~ ; s~ /~ ~' | grep "$proto $address" | awk '{print $3}')
  if [[ ! -z "$CONTAINER" ]] ; then
    echo "$CONTAINER"
    return
  fi
  echo "-"
}

get_ports_processes() {
  ss -utnlp4 '! src 127.0.0.0/8' | awk '{print $1, $5, $7}' | sed 's~^\(.*\) users:.*,pid=\([0-9]\+\),.*$~\1 \2~' | tail -n +2 |  sort -t: -k2,2n
}

printf "%-20s %-25s %-10s %-20s\n" "COMMAND" "ADDRESS" "PID" "CONTAINER"

get_ports_processes | while read -r proto address pid_info; do
  pid="${pid_info##pid=}"
  pid="${pid%,*}"
  container_name=$(get_container_name "$pid" "$address" "$proto")
  command=$(ps -p "$pid" -o comm=)
  printf "%-20s %-25s %-10s %-20s\n" "$command" "$address/$proto" "$pid" "$container_name"
done
