#!/bin/bash

# set project id for use in script
PROJECT=$(gcloud config get-value project)
echo Using project id $PROJECT for setup...

# pull the dockerfile to build custom EE container
wget https://raw.githubusercontent.com/KMarkert/ee-workshop-esa2023/main/Dockerfile -O Dockerile

# submit dockerfile to be built 
CONTAINER=gcr.io/$PROJECT/ee-esa2023
gcloud builds submit --tag $CONTAINER

# enable to notebooks api to programmatically create notebook env
gcloud services enable notebooks.googleapis.com

# create notebook instance
gcloud notebooks instances create ee-esa2023 \
    --container-repository=$CONTAINER \
    --location=us-central1-a \
    --machine-type=n1-standard-1
    --post-startup-script= TODO(kmarkert)