#!/bin/bash

SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"

# read .env file
export $(xargs < "${SCRIPT_DIR}/.env")

function findOrderStacks() {
    find . -maxdepth 2 -mindepth 2 -type f -name 'docker-compose.yml' -exec egrep -H '^# deploy weight [0-9]+' {} \; \
    | sed 's/:# deploy weight /:/' \
    | sort -t: -g -k2 \
    | sed -e 's~/docker-compose.yml:[0-9]\+$~~' \
    | tr '\n' '\0'
}

function dockerAuth() {
  echo "$GITHUB_TOKEN" | docker login ghcr.io -u "$GITHUB_USERNAME" --password-stdin || exit 1
}

function retireCodeServer() {
    # Removed stacks are no longer discovered below, so --remove-orphans cannot
    # retire their containers. Keep this migration safe to run on every update.
    # A restored stack definition takes precedence (for example, on rollback).
    if [[ -f "$SCRIPT_DIR/../vscode-server/docker-compose.yml" ]]; then
        return 0
    fi

    local retired_container_id
    retired_container_id="$(docker container ls --all --quiet \
        --filter 'name=^/code-server$' \
        --filter 'label=com.docker.compose.service=vscode-server' \
        --filter 'label=com.docker.compose.project')" || return 1

    if [[ -n "$retired_container_id" ]]; then
        echo "Retiring the removed code-server Compose service (keeping its data)"
        docker container stop "$retired_container_id" || return 1
        # No --volumes: preserve volumes and the existing host bind-mount data.
        docker container rm "$retired_container_id" || return 1
    fi
}

dockerAuth
retireCodeServer || exit 1

# update each stack
while read -d $'\0' STACK ; do
    cd "$SCRIPT_DIR/../$STACK"
    echo $STACK

    # pull images then update and remove orphans
    docker compose pull
    docker compose up -d --remove-orphans

    # workflow uses digest, tag local image for niceness
    yq --yaml-fix-merge-anchor-to-spec=true -r '.services[].image' docker-compose.yml | grep '@sha256:' | sed 's~^\([^:]\+\):\([^@]\+\)@\(.\+\)$~\1@\3 \1:\2~' | xargs -n2 docker tag

done < <(findOrderStacks)

# clean all unused images
docker image prune -f

# prune everything
# docker system prune -af

echo
echo Run script to see host ports that are open to the local LAN
echo
echo    bash $SCRIPT_DIR/host-open-ipv4-ports.bash
echo
echo Does docker need a prune ? check all containers are running ok
echo
echo    docker system prune -af
echo
