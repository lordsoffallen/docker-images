#!/usr/bin/env bash

set -e
set -x

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker-compose build

docker run --rm ftopal/machine-learning:latest

docker run --rm ftopal/machine-learning:py37

docker-compose push
