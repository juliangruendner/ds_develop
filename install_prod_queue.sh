#!/bin/bash

# this scripts installs the queue server for you
source ./queue.config

# setup ssh to allow access to private repository
cd ~/.ssh
eval $(ssh-agent -s)
chmod 600 ~/.ssh/id_rsa_ds
ssh-add ~/.ssh/id_rsa_ds

# Initialise the repository and clone newest version
mkdir ~/ds_deployment
cd ~/ds_deployment
git clone git@github.com:juliangruendner/ds_develop.git
cd ds_develop
./gitUpdate.sh


# (re-)start the queue
cd ds_queue
./stop.prod.sh
./start.prod.sh
