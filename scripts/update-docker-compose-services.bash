#!/bin/bash

SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)"

function findOrderStacks() {
    find . -maxdepth 2 -mindepth 2 -type f -name 'docker-compose.yml' -exec egrep -H '^# deploy weight [0-9]+' {} \; \
    | sed 's/:# deploy weight /:/' \
    | sort -t: -g -k2 \
    | sed -e 's~/docker-compose.yml:[0-9]\+$~~' \
    | tr '\n' '\0'
}

# update each stack
while read -d $'\0' STACK ; do
    cd "$SCRIPT_DIR/../$STACK"
    echo $STACK

    export SECRETS_DIR=$SCRIPT_DIR/../secrets

    # pull images then update and remove orphans
    docker compose pull
    docker compose up -d --remove-orphans

    # workflow uses digest, tag local image for niceness
    yq -r '.services[].image' docker-compose.yml | grep '@sha256:' | sed 's~^\([^:]\+\):\([^@]\+\)@\(.\+\)$~\1@\3 \1:\2~' | xargs -n2 docker tag

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
