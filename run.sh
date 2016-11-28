#!/bin/bash

ARGS=${1}
if [ "${ARGS}" == "" ]; then
    CMD="nvim /host"
else
    CMD="nvim /host/${ARGS}"
fi
docker run \
    --name=docker-dev \
    --rm \
    -it \
    -v `pwd`:/host \
    docker-dev:latest \
    ${CMD}
