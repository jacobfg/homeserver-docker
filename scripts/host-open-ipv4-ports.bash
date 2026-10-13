#!/bin/bash

get_process_command() {
  local pid="$1"
  local proc_root="${2:-/proc}"
  local command

  # BusyBox ps does not support procps' -p PID -o comm= syntax.
  # The process may exit between ss listing its socket and this read.
  if [[ "$pid" =~ ^[0-9]+$ ]] &&
     { IFS= read -r command < "$proc_root/$pid/comm"; } 2>/dev/null &&
     [[ -n "$command" ]]; then
    printf '%s\n' "$command"
  else
    printf '%s\n' '-'
  fi
}

load_container_data() {
  local proc_root="${1:-/proc}"
  local ids id snapshot kind name init_pid namespace
  local containers=()
  CONTAINER_PROCESSES=""
  CONTAINER_PORTS=""
  ids=$(docker ps --quiet --no-trunc) || return 1
  while IFS= read -r id; do
    [[ -n "$id" ]] && containers+=("$id")
  done <<< "$ids"
  [[ ${#containers[@]} -gt 0 ]] || return 0

  # Inspect once, and include every published binding, not just the first.
  snapshot=$(docker inspect --format '{{printf "container|%s|%s|%v\n" .Id .Name .State.Pid}}{{range $port, $bindings := .NetworkSettings.Ports}}{{range $bindings}}{{printf "port|%s|%s|%s:%s\n" $.Name $port .HostIp .HostPort}}{{end}}{{end}}' "${containers[@]}") || return 1
  while IFS='|' read -r kind id name init_pid; do
    case "$kind" in
      container)
        namespace=$(readlink "$proc_root/$init_pid/ns/pid" 2>/dev/null) || namespace=""
        CONTAINER_PROCESSES+="$id|${name#/}|$init_pid|$namespace"$'\n'
        ;;
      port)
        # These fields contain container name, container port/protocol, binding.
        CONTAINER_PORTS+="${name##*/}|$init_pid|${id#/}"$'\n'
        ;;
    esac
  done <<< "$snapshot"
}

get_docker_proxy() {
  local address="$1" proto="$2"
  local protocol binding name
  while IFS='|' read -r protocol binding name; do
    if [[ "$protocol" == "$proto" && "$binding" == "$address" ]]; then
      printf '%s\n' "$name"
      return
    fi
  done <<< "${CONTAINER_PORTS:-}"
  echo "-"
}

get_container_name() {
  local pid="$1" address="$2" proto="$3"
  local proc_root="${4:-/proc}"
  local cgroup id name init_pid namespace process_namespace host_namespace
  if [[ ! "$pid" =~ ^[0-9]+$ ]]; then
    echo "-"
    return
  fi
  if [[ "$(get_process_command "$pid" "$proc_root")" == docker-proxy ]]; then
    get_docker_proxy "$address" "$proto"
    return
  fi

  cgroup=$(cat "$proc_root/$pid/cgroup" 2>/dev/null) || cgroup=""
  process_namespace=$(readlink "$proc_root/$pid/ns/pid" 2>/dev/null) || process_namespace=""
  host_namespace=$(readlink "$proc_root/1/ns/pid" 2>/dev/null) || host_namespace=""
  while IFS='|' read -r id name init_pid namespace; do
    [[ -n "$id" ]] || continue
    # Covers cgroup v1/v2, systemd docker-ID.scope and cgroupfs /docker/ID.
    if [[ "$cgroup" == *"$id"* || "$pid" == "$init_pid" ]]; then
      printf '%s\n' "$name"
      return
    fi
    # Host-network containers still normally have their own PID namespace.
    # Never attribute all host processes to a container using --pid=host.
    if [[ -n "$process_namespace" && -n "$host_namespace" &&
          "$process_namespace" != "$host_namespace" &&
          "$process_namespace" == "$namespace" ]]; then
      printf '%s\n' "$name"
      return
    fi
  done <<< "${CONTAINER_PROCESSES:-}"
  echo "-"
}

get_ports_processes() {
  # Include loopback publications; UDP may have duplicate listening sockets.
  ss -utnlp4 | awk 'NR > 1 {
    pid = "-"
    if ($0 ~ /pid=[0-9]+/) {
      pid = $0
      sub(/^.*pid=/, "", pid)
      sub(/[^0-9].*$/, "", pid)
    }
    print $1, $5, pid
  }' | sort -t: -k2,2n | uniq
}

# Allow helpers to be sourced for tests without scanning the host.
if [[ "${BASH_SOURCE[0]}" != "$0" ]]; then
  return
fi

# if not root, exit
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 
  exit 1
fi

load_container_data || exit 1

printf "%-20s %-25s %-10s %-20s\n" "COMMAND" "ADDRESS" "PID" "CONTAINER"

get_ports_processes | while read -r proto address pid_info; do
  pid="${pid_info##pid=}"
  pid="${pid%,*}"
  container_name=$(get_container_name "$pid" "$address" "$proto")
  command=$(get_process_command "$pid")
  printf "%-20s %-25s %-10s %-20s\n" "$command" "$address/$proto" "$pid" "$container_name"
done
