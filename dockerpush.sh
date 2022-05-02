#! /bin/bash
CONTAINER_REGISTRY_NAME=azuremlapidemo #REPLACE with azure registry name (lower letters only)
sudo az login #login to Azure
sudo az acr login --name "$CONTAINER_REGISTRY_NAME" 
sudo docker images
VERSION_NAME="$CONTAINER_REGISTRY_NAME.azurecr.io/version1"
sudo docker tag 2b458f67dac3 "$VERSION_NAME" #REPLACE tag with image ID
sudo docker push "$VERSION_NAME"