#!/bin/bash

docker rm -f docker-dev || time docker build --force-rm -t docker-dev:latest . && docker run --name=docker-dev -it -d -p 2200:22 docker-dev:latest && ssh -A root@dockervm -p 2200
