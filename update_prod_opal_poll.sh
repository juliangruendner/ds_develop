#!/bin/bash

# this file lets you install opal and the poll service

### add your configuration information here
source ./opal_poll.config


# activate ssh agent for update
cd ~/.ssh
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_rsa_ds

# update the repository and clone newest version
mkdir ~/ds_deployment
cd ~/ds_deployment
cd ds_develop
./gitUpdate.sh


if [[ $QP_VERSION_TAG ]]; then
    printf "tag $QP_VERSION_TAG specified, switching to tag $QP_VERSION_TAG for installation... \n"
    ./gitCheckoutTag.sh $QP_VERSION_TAG
else
    printf "switching to master as no tag specified for installation ... \n"
    ./gitCheckoutTag.sh
fi


# install opal
cd ~/ds_deployment/ds_develop/ds_opal
./update_prod.sh


# start the ds_poll_monitor_server
printf "######################\n Installing Poll server and GUI ... \n######################\n\n"

cd ~/ds_deployment/ds_develop/ds_poll_monitor_server
./stop_prod.sh
./deploy_new_gui.sh
./start_prod.sh

# change the configuration for the gui so that it communicates with the right server
cd ~/ds_deployment/ds_develop/ds_poll_monitor_server/ds_poll_gui/poll-monitor
sed -i "s/<replace_prod_server_url>/$OPAL_SERVER_IP/g" main.*

cd  ~/ds_deployment/ds_develop/ds_opal
./stop_prod.sh
./start_prod.sh

printf "\n\n######################\n Update Complete \n######################\n\n"

printf "\n - visit $OPAL_SERVER_IP:80 in your browser to access the poll server user interface \n"
printf "\n - visit $OPAL_SERVER_IP:8880 in your browser to access the opal server user interface \n"
