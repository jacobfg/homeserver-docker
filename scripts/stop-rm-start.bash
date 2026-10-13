#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/compose-common.bash"
require_compose_tools

if [[ $# -eq 0 ]] ; then
  echo "Specify Compose service(s)." >&2
  exit 1
fi

compose stop "$@"
compose rm -f "$@"
compose up -d "$@"
