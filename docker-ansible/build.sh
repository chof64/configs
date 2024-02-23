#!/bin/bash

# Set the name for the Docker image
IMAGE_NAME="ansibe-core"

# Build the Docker image using the Dockerfile in the current directory
docker build -t "$IMAGE_NAME" .

# Check if the build was successful
if [ $? -eq 0 ]; then
    echo "Docker image '$IMAGE_NAME' built successfully."
else
    echo "Error: Docker image build failed."
fi
