#!/bin/bash

# Author: Jacob Kline
# Date: 16/01/23
# Last Modified: 16/01/23

# Description:
# Push image to dockerhub

 echo ${{ secrets.DOCKER_PASSWORD }} | docker login -u ${{ secrets.DOCKER_USERNAME }} --password-stdin
    for container in $(docker-compose config --services); do
        echo "Pushing $container"
        docker tag $container ${{ secrets.DOCKER_USERNAME }}/usermanagement/$container
        docker push ${{ secrets.DOCKER_USERNAME }}/usermanagement/$container
    done