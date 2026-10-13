#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/compose-common.bash"

if [[ $# -ne 1 || ( "$1" != start && "$1" != stop ) ]]; then
    echo "Usage: $0 {start|stop}" >&2
    exit 2
fi
require_compose_tools

# Resolve before taking action; do not silently accept failed/empty selection.
model="$(compose --profile '*' config --format json)"
selected="$(jq -er '[.services | to_entries[] |
    select((.value.profiles // []) | index("portainer")) | .key] |
    if length == 0 then error("No services in portainer profile") else .[] end' <<< "$model")"
services=()
while IFS= read -r service; do services+=("$service"); done <<< "$selected"

case "$1" in
    start) compose --profile portainer up -d "${services[@]}" ;;
    stop) compose --profile portainer stop "${services[@]}" ;;
esac
