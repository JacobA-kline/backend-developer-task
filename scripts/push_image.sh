#!/bin/bash

# Author: Jacob Kline
# Date: 16/01/23
# Last Modified: 16/01/23

# Description:
# Push image to dockerhub

docker images
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
  for container in $(docker-compose config --services); do
      echo "Pushing $container"
      docker tag "$container" "$DOCKER_USERNAME"/usermanagement/"$container"
      docker push "$DOCKER_USERNAME"/usermanagement/"$container"
  done