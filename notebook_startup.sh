#!/bin/bash

# Startup scripts are run as root, run the rest of the script as the jupyter user
sudo -i -u jupyter bash -ex << EOF
cd /home/jupyter

# Edit the following to be the cloud source repo with your notebooks
git clone https://github.com/KMarkert/ee-workshop-esa2023.git

# move files around
rm ee-workshop-esa2023/Dockerfile \
  ee-workshop-esa2023/notebook_startup.sh \
  ee-workshop-esa2023/README.md \
  ee-workshop-esa2023/setup.sh \
  ee-workshop-esa2023/.gitignore