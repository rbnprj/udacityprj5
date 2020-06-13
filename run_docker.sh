#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build  --tag=capstone/udacityprj5:v1.0 .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
docker run -d -p 8080:80 capstone/udacityprj5:v1.0