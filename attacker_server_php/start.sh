#! /bin/bash
if [ -n "$SERVER_HOST_EXTERNAL_IP" ] && [ -n "$SERVER_HOST_EXTERNAL_PORT" ] && [ -n "$SERVER_DOCKER_INTERNAL_IP" ] && [ -n "$SERVER_DOCKER_INTERNAL_PORT" ] ; then
    echo "==== starting server on: external: $SERVER_HOST_EXTERNAL_IP:$SERVER_HOST_EXTERNAL_PORT - internal: $SERVER_DOCKER_INTERNAL_IP:$SERVER_DOCKER_INTERNAL_PORT ===="
fi
apache2-foreground
