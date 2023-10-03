#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <image_name> <image_version>"
  exit 1
fi

# Get the image name and version from the command line arguments
image_name="$1"
image_version="$2"

# Build the Docker image using the provided name and version
docker build -t "${image_name}:${image_version}" .

# Check if the build was successful
if [ $? -eq 0 ]; then
  echo "Docker image ${image_name}:${image_version} successfully built."
else
  echo "Error: Docker image build failed."
  exit 1
fi

# Optionally, you can push the image to a Docker registry if needed
# docker push "${image_name}:${image_version}"

# Exit with success status
exit 0
