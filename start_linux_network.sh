#!/bin/bash

DOCKER_COMPOSE_FILE=lfi_linux_network.yml

# Check if docker, docker-machine and docker-compse is installed
command -v docker >/dev/null 2>&1 || { echo >&2 "docker needed (see https://www.docker.com)"; exit 1; }
command -v docker-machine >/dev/null 2>&1 || { echo >&2 "docker-machine needed (see https://docs.docker.com/machine/install-machine/)"; exit 1; }
command -v docker-compose >/dev/null 2>&1 || { echo >&2 "docker-compose needed (see https://docs.docker.com/compose/install/)"; exit 1; }


# Create a trap to clean up network at shut down
function cleanup {
    docker-compose -f $DOCKER_COMPOSE_FILE down
}
trap cleanup EXIT

# Set linux docker
eval $(docker-machine env -unset)

if [ -n "$DOCKER_VM_IP" ]; then
    unset DOCKER_VM_IP
fi

# Start network
docker-compose -f $DOCKER_COMPOSE_FILE up --build
