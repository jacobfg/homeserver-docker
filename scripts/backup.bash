#!/bin/bash

# TIMESTAMP=$(date +%s)
# ssh root@192.168.2.33 docker-env/backup.bash > home-rpi4-backup-${TIMESTAMP}.tar
# xz -9e home-rpi4-backup-${TIMESTAMP}.tar

tar -cf - -C / /root/docker-env /root/broadlink /etc/systemd/system/docker-compose-app.service
