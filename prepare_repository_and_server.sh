#!/bin/bash

# inistialise ssh to allow access to private github repository
cd ~/.ssh
eval $(ssh-agent -s)
chmod 600 ~/.ssh/id_rsa_ds
ssh-add ~/.ssh/id_rsa_ds

# initialise the repository and clone newest version
mkdir ~/ds_deployment
cd ~/ds_deployment
git clone git@github.com:juliangruendner/ds_develop.git
cd ds_develop
./gitUpdate.sh
cp opal_poll.config_sample opal_poll.config
cp queue.config_sample queue.config

if [[ $(which docker) ]]; then
    echo "docker already installled, version is: "
    docker -v
    
else
    echo "docker not installed, installing docker:"
    cd ~/ds_deployment/ds_develop
    ./install_docker.sh
fi

printf "######################\n\n\n"
