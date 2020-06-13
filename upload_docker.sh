#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerpath=rabinprj123/capstone/udacityprj5v1.0
DOCKER_USERNAME=''
 DOCKER_PASSWORD=''
# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
#docker login
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker tag capstone/udacityprj5:v1.0 $dockerpath 

# Step 3:
# Push image to a docker repository
docker push $dockerpath