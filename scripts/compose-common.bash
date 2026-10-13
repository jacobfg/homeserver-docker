#!/usr/bin/env bash
# Shared root-project invocation. Source this file from repository helpers.
COMPOSE_ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

compose() (
    cd -- "$COMPOSE_ROOT"
    # Helpers select services explicitly; ambient profiles must not expand them.
    COMPOSE_PROFILES= docker compose --project-directory "$COMPOSE_ROOT" \
        --file "$COMPOSE_ROOT/compose.yaml" "$@"
)

require_compose_tools() {
    command -v docker >/dev/null || { echo "Docker Compose 2.40.3+ is required." >&2; return 1; }
    command -v jq >/dev/null || { echo "jq is required." >&2; return 1; }
    local version major minor patch
    version="$(docker compose version --short)" || return 1
    if [[ ! "$version" =~ ^v?([0-9]+)\.([0-9]+)\.([0-9]+) ]]; then
        echo "Cannot determine Docker Compose version: $version" >&2
        return 1
    fi
    major="${BASH_REMATCH[1]}" minor="${BASH_REMATCH[2]}" patch="${BASH_REMATCH[3]}"
    if ! (( 10#$major > 2 || (10#$major == 2 && (10#$minor > 40 || (10#$minor == 40 && 10#$patch >= 3))) )); then
        echo "Docker Compose 2.40.3+ is required for reliable include environment handling (found $version)." >&2
        return 1
    fi
}
