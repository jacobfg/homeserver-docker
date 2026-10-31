#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/compose-common.bash"
require_compose_tools

# Validate all profiles so optional containers are known during orphan cleanup.
# Explicit service lists below keep those profiles from starting optional tools.
model="$(compose --profile '*' config --format json)"
selected="$(jq -er '[.services | to_entries[] |
    select((.value.profiles // []) | length == 0) | .key] |
    if length == 0 then error("No default services") else .[] end' <<< "$model")"
services=()
while IFS= read -r service; do services+=("$service"); done <<< "$selected"

# Local plugins are loaded at startup, but bind-mounted edits do not change
# Compose's service hash. Use resolved mount sources, including paths with spaces.
plugin_sources="$(jq -r '.services.traefik.volumes // [] | .[] |
    select(.type == "bind") |
    select(.target == "/plugins-local" or (.target | startswith("/plugins-local/"))) |
    .source' <<< "$model")"
plugin_dirs=()
while IFS= read -r source; do
    [[ -n "$source" ]] || continue
    plugin_dirs+=("$source")
done <<< "$plugin_sources"

# Registry credentials stay separate from Compose's root application environment.
# Read only these two dotenv keys; do not evaluate the file as shell code.
credentials="$(docker compose --project-directory "$SCRIPT_DIR" \
    --env-file "$SCRIPT_DIR/.env" -f - config --format json <<'COMPOSE'
services:
  registry-credentials:
    image: scratch
    environment:
      GITHUB_USERNAME: ${GITHUB_USERNAME:?Set GITHUB_USERNAME}
      GITHUB_TOKEN: ${GITHUB_TOKEN:?Set GITHUB_TOKEN}
COMPOSE
)"
username="$(jq -er '.services["registry-credentials"].environment.GITHUB_USERNAME' <<< "$credentials")"
jq -er '.services["registry-credentials"].environment.GITHUB_TOKEN' <<< "$credentials" |
    docker login ghcr.io -u "$username" --password-stdin
unset credentials

# Pull before pausing the scheduler or modifying containers.
compose --profile '*' pull "${services[@]}" libation

scheduler_id="$(compose ps --status running --quiet scheduler)"
scheduler_paused=false
restore_scheduler() {
    local status=$?
    trap - EXIT
    if [[ "$scheduler_paused" == true && -n "$scheduler_id" ]]; then
        # Restore only a scheduler that was running before this update.
        docker start "$scheduler_id" >/dev/null || \
            echo "Could not restore the scheduler; inspect it and restart scheduling manually." >&2
    fi
    exit "$status"
}
trap restore_scheduler EXIT
# Arm recovery before stopping: a failed stop may still have changed state.
scheduler_paused=true
compose stop --timeout 10 scheduler
job_id="$(compose --profile scheduled ps --all --quiet libation)"
if [[ -n "$job_id" ]]; then
    job_running="$(docker inspect --format '{{.State.Running}}' "$job_id")"
    if [[ "$job_running" == true ]]; then
        echo "Libation is running; deferring this update to avoid interrupting downloads." >&2
        exit 1
    fi
fi

# Create/update the one-shot job without executing it, before enabling scheduling.
compose --profile '*' up --no-start --no-deps libation
compose --profile '*' up -d --remove-orphans "${services[@]}"
scheduler_paused=false

# Inspect after up: an image/config update may already have reloaded the plugins.
# Recreate only Traefik, without touching its dependencies or optional profiles.
if (( ${#plugin_dirs[@]} )); then
    traefik_id="$(compose ps --status running --quiet traefik)"
    if [[ -z "$traefik_id" ]]; then
        echo "Traefik is not running after the update; cannot verify plugin loading." >&2
        exit 1
    fi
    traefik_started="$(docker inspect --format '{{.State.StartedAt}}' "$traefik_id")"
    # jq parses UTC timestamps without fractional seconds. stat's portable
    # formats have whole-second precision, so include the startup second to
    # avoid missing a plugin edit just after startup within that second.
    started_seconds="$(jq -ner --arg started "$traefik_started" '
        $started | sub("\\.[0-9]+Z$"; "Z") | fromdateiso8601')"
    if stat -c '%Y' / >/dev/null 2>&1; then
        stat_args=(-c '%Y') # GNU and BusyBox stat (Linux).
    else
        stat_args=(-f '%m') # BSD stat (macOS).
    fi
    # Include directories to detect deletions. Do not stop at the first match:
    # traversal/stat failures must fail the update rather than hide unread files.
    plugins_newer="$(find "${plugin_dirs[@]}" -exec stat "${stat_args[@]}" {} + |
        jq -s --argjson started "$started_seconds" 'any(.[]; . >= $started)')"
    if [[ "$plugins_newer" == true ]]; then
        echo "Local plugin files changed at or after Traefik's startup second; recreating Traefik."
        compose --profile '*' up -d --no-deps --force-recreate traefik
    fi
fi

# Keep human-readable image tags alongside the pinned digest references.
images="$(jq -r '.services | to_entries[] |
    select(((.value.profiles // []) | length == 0) or .key == "libation") |
    .value.image // empty | select(contains("@sha256:"))' <<< "$model" | sort -u)"
while IFS= read -r image; do
    [[ -n "$image" ]] || continue
    tagged="${image%@*}"
    # Only tag references with an explicit tag after the last slash.
    [[ "${tagged##*/}" == *:* ]] || continue
    repository="${tagged%:*}"
    docker tag "$repository@${image#*@}" "$tagged"
done <<< "$images"

docker image prune -f
printf '\nInspect host IPv4 ports (including loopback) with: bash %s/host-open-ipv4-ports.bash\n' "$SCRIPT_DIR"
