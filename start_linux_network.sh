#!/bin/bash

DOCKER_COMPOSE_FILE=lfi_linux_network.yml

function cleanup {
    docker-compose -f $DOCKER_COMPOSE_FILE down
}
trap cleanup EXIT

# set linux docker
eval $(docker-machine env -unset)

if [ -n "$DOCKER_VM_IP" ]; then
    unset DOCKER_VM_IP
fi

docker-compose -f $DOCKER_COMPOSE_FILE up --build
