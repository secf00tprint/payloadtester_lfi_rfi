#!/bin/bash

DOCKER_COMPOSE_FILE=lfi_win_network.yml

function cleanup {
    docker-compose -f $DOCKER_COMPOSE_FILE down
    unset DOCKER_VM_IP
}
trap cleanup EXIT

eval $(docker-machine env 2016)
if [ -z "$DOCKER_VM_IP" ]; then
    export DOCKER_VM_IP=$(docker-machine ip 2016)
fi

docker-compose -f $DOCKER_COMPOSE_FILE up --build
