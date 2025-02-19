#!/usr/bin/env bash

export USER="gwestmont"

USER_HOME=$(eval echo ~$USER)
FRIGATE_HOME=$USER_HOME/.frigate

mkdir -p $FRIGATE_HOME

set -e
cd $FRIGATE_HOME

echo "Setting permissions on $FRIGATE_HOME"
chown -R $USER $FRIGATE_HOME || true

set +e

echo "docker compose down"
sudo -u $USER docker compose down 2> /dev/null
echo "docker compose rm -rf"
sudo -u $USER docker rm -f /scrypted /scrypted-watchtower 2> /dev/null

set -e

echo "docker compose pull"
sudo -u $USER docker compose pull

echo "docker compose up -d"
sudo -u $USER docker compose up -d
