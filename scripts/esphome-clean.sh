#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/compose-common.bash"
require_compose_tools

# Compose parses the root dotenv file without executing it as shell code.
# Resolve the actual bind mount so cleanup follows the service's VOLUME_DIR.
model="$(compose --env-file "$COMPOSE_ROOT/.env" --profile disabled config --format json)"
config_dir="$(jq -er '[.services.esphome.volumes[]? |
    select(.type == "bind" and .target == "/config") | .source] |
    if length == 1 then .[0] else error("Expected one ESPHome /config bind mount") end' <<< "$model")"
if [[ "$config_dir" != /* || "$config_dir" == / || ! -d "$config_dir" ]]; then
    echo "ESPHome config directory must be an existing absolute directory: $config_dir" >&2
    exit 1
fi
cache_dir="${config_dir%/}/.esphome"
if [[ -L "$cache_dir" ]]; then
    echo "Refusing to clean a symlinked .esphome directory: $cache_dir" >&2
    exit 1
fi
if [[ ! -d "$cache_dir" ]]; then
    echo "No ESPHome caches found at $cache_dir"
    exit 0
fi
# No trailing slashes: a symlink at a cache entry is removed, never followed.
rm -rf -- "$cache_dir"/{build,external_components,idedata,packages,platformio}
echo "Cleaned ESPHome build caches in $cache_dir"
