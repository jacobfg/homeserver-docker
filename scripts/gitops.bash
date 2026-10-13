#!/usr/bin/env bash
# Run on the persistent Terraform runner with direct or SSH-tunneled API access.
set -euo pipefail
umask 077

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
export TF_IN_AUTOMATION=1
if [[ -n "${SFTPGO_API_KEY_FILE:-}" ]]; then
    export SFTPGO_API_KEY
    SFTPGO_API_KEY="$(cat -- "$SFTPGO_API_KEY_FILE")"
fi
# SFTPGo OSS requires a non-empty admin password even for OIDC accounts.
# This write-only Terraform input never enters state or saved plans. Its value
# is discarded; the version field controls when a rotation is requested.
if [[ -z "${TF_VAR_admin_seed_password:-}" ]]; then
    export TF_VAR_admin_seed_password
    TF_VAR_admin_seed_password="$(openssl rand -base64 48)"
fi

if ! command -v terraform >/dev/null 2>&1; then
    echo "Install Terraform >= 1.11, < 2.0 on the runner first." >&2
    exit 1
fi

# Only these commands are wrapped: Terraform itself owns state locking and
# the saved plan. init/validate/fmt also work before live accounts are imported.
case "${1:-}" in
    init|validate|fmt|plan|apply|import|show|state|providers|test)
        exec terraform -chdir="$SCRIPT_DIR/../gitops/sftp-server" "$@"
        ;;
    *)
        echo "Usage: $0 {init|validate|fmt|plan|apply|import|show|state|providers|test} [arguments...]" >&2
        exit 2
        ;;
esac
