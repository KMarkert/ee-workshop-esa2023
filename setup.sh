#!/bin/bash

# set project id for use in script
PROJECT=$(gcloud config get-value project)
echo Using project id $PROJECT for setup...

# enable to notebooks api to programmatically create notebook env
gcloud services enable notebooks.googleapis.com

# create notebook instance
gcloud notebooks instances create ee-esa2023 \
    --container-repository=us-west1-docker.pkg.dev/ee-kmarkert-demo/esa2023-jupyter/esa2023-jupyter-image:latest \
    --location=us-west1-a \
    --machine-type=e2-standard-2 \
    --post-startup-script=https://raw.githubusercontent.com/KMarkert/ee-workshop-esa2023/main/notebook_startup.sh