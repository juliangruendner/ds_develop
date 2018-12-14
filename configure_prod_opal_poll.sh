#!/bin/bash

# this file installs opal and the poll service
source ./opal_poll.config

printf "######################\n Configuring Opal \n######################\n\n"
cd ~/ds_deployment/ds_develop/ds_opal
./configure_prod.sh



printf "######################\n Installing Poll server and GUI ... \n######################\n\n"

cd ~/ds_deployment/ds_develop/ds_poll_monitor_server
./deploy_new_gui.sh
./start_prod.sh
cd  ~/ds_deployment/ds_develop/ds_opal
./stop_prod.sh
./start_prod.sh

printf "\n\n######################\n Setup Complete \n######################\n\n"

printf "\n - visit $OPAL_SERVER_IP:80 in your browser to access the poll server user interface \n"
printf "\n - visit $OPAL_SERVER_IP:8880 in your browser to access the opal server user interface \n"
