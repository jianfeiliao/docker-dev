#!/bin/bash

docker rm -f docker-dev || true

docker build --force-rm -t docker-dev:latest .

docker run \
    --rm --name=docker-dev -it -p 2200:22 -h docker-dev \
    -v $HOME:/host \
    docker-dev:latest
