#!/bin/bash

# this file lets you install opal and the poll service

source ./opal_poll.config

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

if [[ $1 ]]; then
    printf "tag $1 specified, switching to tag $1 for installation... \n"
    ./gitCheckoutTag.sh $1
else
    printf "switching to master as no tag specified for installation ... \n"
    ./gitCheckoutTag.sh
fi


if [[ $(which docker) ]]; then
    echo "docker already installled, version is: "
    docker -v
    
else
    echo "docker not installed, installing docker:"
    cd ~/ds_deployment/ds_develop
    ./install_docker.sh
fi

printf "######################\n\n\n"
