#!/bin/bash -a

if [[ -z "${@}" ]] ; then
  echo "specify containr(s)"
  exit 1
fi

docker compose stop ${@}
docker compose rm -f ${@}
docker compose up -d ${@}
