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

if [[ $(which docker) ]]; then
    echo "docker already installled, version is: "
    docker -v
    
else
    echo "docker not installed, installing docker:"
    cd ~/ds_deployment/ds_develop
    ./install_docker.sh
fi

printf "######################\n\n\n"

# install opal
cd ~/ds_deployment/ds_develop/datashield_docker
./install_prod.sh


# start the ds_poll_monitor_server
printf "######################\n Installing Poll server and GUI ... \n######################\n\n"

cd ~/ds_deployment/ds_develop/ds_poll_monitor_server
mkdir ds_poll_gui/poll-monitor
apt-get update
apt-get -y install zip
./deploy_new_gui.sh
./start_prod.sh

# change the configuration for the gui so that it communicates with the right server
cd ~/ds_deployment/ds_develop/ds_poll_monitor_server/ds_poll_gui/poll-monitor
sed -i "s/<replace_prod_server_url>/$OPAL_SERVER_IP/g" main.*

cd  ~/ds_deployment/ds_develop/datashield_docker
./stop_prod.sh
./start_prod.sh

printf "\n\n######################\n Setup Complete \n######################\n\n"

printf "\n - visit $OPAL_SERVER_IP:80 in your browser to access the poll server user interface \n"
printf "\n - visit $OPAL_SERVER_IP:8880 in your browser to access the opal server user interface \n"
