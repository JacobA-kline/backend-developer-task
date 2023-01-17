#!/bin/bash

# Author: Jacob Kline
# Date: 16/01/23
# Last Modified: 16/01/23

# Description:
# Push images to dockerhub

docker images

version="$1"

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

  for service in $(docker-compose config --services); do
    echo "Tagging and pushing $service:$version"
    docker tag "$service":latest "$DOCKER_USERNAME"/"$service":"$version"
    docker push "$DOCKER_USERNAME"/"$service":"$version"
  done
docker images