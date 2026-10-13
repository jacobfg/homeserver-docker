#!/usr/bin/env bash
# Inspect live container IPv4 sockets through Linux procfs, without nsenter.

read_container_sockets() {
  local pid="$1" proc_root="${2:-/proc}"
  local tcp="$proc_root/$pid/net/tcp" udp="$proc_root/$pid/net/udp"
  [[ -r "$tcp" && -r "$udp" ]] || return 1
  # Portable awk: BusyBox awk has no strtonum(). Linux on Lightwhale stores
  # IPv4 addresses as little-endian hexadecimal words in these socket tables.
  awk '
    function hex(s, result, i) {
      result = 0
      s = toupper(s)
      for (i = 1; i <= length(s); i++)
        result = result * 16 + index("0123456789ABCDEF", substr(s, i, 1)) - 1
      return result
    }
    FNR == 1 { next }
    {
      proto = (FILENAME ~ /\/tcp$/) ? "tcp" : "udp"
      # TCP_LISTEN=0A, unconnected UDP=07; exclude established connections.
      if ((proto == "tcp" && $4 != "0A") || (proto == "udp" && $4 != "07")) next
      split($2, endpoint, ":")
      ip = endpoint[1]
      if (length(ip) != 8 || length(endpoint[2]) != 4) next
      printf "%s %d.%d.%d.%d:%d\n", proto, hex(substr(ip,7,2)), hex(substr(ip,5,2)), hex(substr(ip,3,2)), hex(substr(ip,1,2)), hex(endpoint[2])
    }
  ' "$tcp" "$udp"
}

report_container_ports() {
  local proc_root="${1:-/proc}"
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
    # /proc/PID/net exposes that process's entire network namespace.
    if ! sockets=$(read_container_sockets "$pid" "$proc_root"); then
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
    sockets=$(printf '%s\n' "$sockets" | sort -u)
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
for tool in docker awk sort; do
  command -v "$tool" >/dev/null || { echo "Required host tool missing: $tool" >&2; exit 1; }
done
report_container_ports
