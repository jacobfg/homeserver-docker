#!/bin/bash

STACKS=(
  /opt/docker/stacks/docker-env
  /opt/docker/stacks/audiobookshelf
  /opt/docker/stacks/vscode-server
#   /opt/docker/stacks/esphome
)

# update each stack
for STACK in ${STACKS[*]} ; do
    echo $STACK

    # pull images then update and remove orphans
    docker compose pull
    docker compose up -d --remove-orphans

    # workflow uses digest, tag local image for niceness
    yq -r '.services[].image' docker-compose.yml | grep '@sha256:' | sed 's~^\([^:]\+\):\([^@]\+\)@\(.\+\)$~\1@\3 \1:\2~' | xargs -n2 docker tag
done

# clean all unused images
docker image prune -f

# prune everything
# docker system prune -af

# open ports
# ss -tulpen | grep -vEe "\s+127[.]|::1|239[.]255[.]255[.]250|fd4e:ca90:4df3:3f48:e65f:1ff:fe45:5c78|fe80::e65f:1ff:fe45:5c78"

# ports open to LAN (IPv4)
ss -tnlp4 '! src 127.0.0.0/8'
