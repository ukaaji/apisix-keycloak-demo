#!/usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BASE_DIR=$( cd "$SCRIPT_DIR/.." &> /dev/null && pwd )

set -a
source $BASE_DIR/.env
set +a

cd $BASE_DIR
docker compose -f $BASE_DIR/deployment/docker/docker-compose.yml up --build
