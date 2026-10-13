#!/usr/bin/env bash
# Inspect live container network namespaces using the host's ss binary.

report_container_ports() {
  local ids snapshot id name pid mode addresses sockets proto address
  local failed=0
  local containers=()
  ids=$(docker ps --quiet --no-trunc) || return 1
  while IFS= read -r id; do
    [[ -n "$id" ]] && containers+=("$id")
  done <<< "$ids"

  printf '%-24s %-25s %-16s %s\n' 'CONTAINER' 'BIND ADDRESS/PROTO' 'NETWORK MODE' 'CONTAINER IPv4 (NETWORK=IP)'
  [[ ${#containers[@]} -gt 0 ]] || return 0
  snapshot=$(docker inspect --format '{{.Id}}|{{.Name}}|{{.State.Pid}}|{{.HostConfig.NetworkMode}}|{{range $network, $config := .NetworkSettings.Networks}}{{if $config.IPAddress}}{{$network}}={{$config.IPAddress}} {{end}}{{end}}' "${containers[@]}") || return 1

  while IFS='|' read -r id name pid mode addresses; do
    [[ -n "$id" ]] || continue
    name="${name#/}"
    if [[ "$mode" == host ]]; then
      # All host sockets share this namespace; do not attribute them to this container.
      printf '%-24s %-25s %-16s %s\n' "$name" '(see host port script)' "$mode" '(host IPs; no separate container IP)'
      continue
    fi
    if [[ ! "$pid" =~ ^[1-9][0-9]*$ ]]; then
      echo "Skipping $name: no running container process." >&2
      failed=1
      continue
    fi
    # Enter only the network namespace: use host binaries, not tools in the image.
    if ! sockets=$(nsenter -t "$pid" -n -- ss -H -lntu4); then
      echo "Could not inspect $name; it may have stopped during the scan." >&2
      failed=1
      continue
    fi
    addresses="${addresses% }"
    if [[ -z "$addresses" ]]; then
      addresses='-'
      [[ "$mode" != container:* ]] || addresses="(shared with ${mode#container:})"
    fi
    # Numeric TCP listeners and UDP bound sockets, including container loopback.
    sockets=$(printf '%s\n' "$sockets" | awk 'NF >= 5 { print $1, $5 }' | sort -u)
    if [[ -z "$sockets" ]]; then
      printf '%-24s %-25s %-16s %s\n' "$name" '-' "$mode" "$addresses"
      continue
    fi
    while read -r proto address; do
      printf '%-24s %-25s %-16s %s\n' "$name" "$address/$proto" "$mode" "$addresses"
    done <<< "$sockets"
  done <<< "$snapshot"
  return "$failed"
}

if [[ "${BASH_SOURCE[0]}" != "$0" ]]; then
  return
fi

if [[ $EUID -ne 0 ]]; then
  echo 'This script must be run as root on the Docker host.' >&2
  exit 1
fi
for tool in docker nsenter ss; do
  command -v "$tool" >/dev/null || { echo "Required host tool missing: $tool" >&2; exit 1; }
done
report_container_ports
