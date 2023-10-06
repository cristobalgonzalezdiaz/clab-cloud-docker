#!/bin/bash

# Load configuration variables
source ./config.env

echo "IMAGE_NAME: $IMAGE_NAME"
echo "IMAGE_VERSION: $IMAGE_VERSION"
echo "GITHUB_USERNAME: $GITHUB_USERNAME"
echo "GGITHUB_TOKEN: $GITHUB_TOKEN"

# Check if the required variables are set
if [ -z "$IMAGE_NAME" ] || [ -z "$IMAGE_VERSION" ] || [ -z "$GITHUB_USERNAME" ] || [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: Configuration variables are not set in config.env"
  exit 1
fi

# Build the Docker image
docker build -t "${IMAGE_NAME}:${IMAGE_VERSION}" .

# Log in to GitHub Container Registry
echo "$GITHUB_TOKEN" | docker login ghcr.io -u "$GITHUB_USERNAME" --password-stdin

# Tag the Docker image for GitHub Container Registry
DOCKER_IMAGE="ghcr.io/$GITHUB_USERNAME/$IMAGE_NAME:$IMAGE_VERSION"
docker tag "${IMAGE_NAME}:${IMAGE_VERSION}" "$DOCKER_IMAGE"

# Push the Docker image to GitHub Container Registry
docker push "$DOCKER_IMAGE"

# Check if the push was successful
if [ $? -eq 0 ]; then
  echo "Docker image $DOCKER_IMAGE successfully pushed to GitHub Container Registry."
else
  echo "Error: Docker image push failed."
  exit 1
fi

# Clean up - remove the locally tagged image
docker rmi "$DOCKER_IMAGE"

# Exit with success status
exit 0
