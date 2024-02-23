#!/bin/bash

# Define the name of the Docker image
IMAGE_NAME="ansibe-core"

# Check if the Docker image is available locally
if docker image inspect "$IMAGE_NAME" &> /dev/null; then
    echo "Docker image '$IMAGE_NAME' is available locally."
    # Run the Docker image interactively
    docker run --rm -it "$IMAGE_NAME" /bin/bash
else
    echo "Docker image '$IMAGE_NAME' is not available locally."
    read -p "Do you want to build it now? (y/n): " choice
    case "$choice" in
        y|Y )
            # Build the Docker image using the provided build script
            ./build.sh
            # Run the Docker image interactively if build was successful
            if [ $? -eq 0 ]; then
                docker run --rm -it "$IMAGE_NAME" /bin/bash
            else
                echo "Error: Failed to build the Docker image."
            fi
            ;;
        n|N )
            echo "Exiting script."
            ;;
        * )
            echo "Invalid choice. Exiting script."
            ;;
    esac
fi
