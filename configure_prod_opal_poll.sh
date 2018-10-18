# this file lets you install opal and the poll service

# add your configuration information here
OPAL_SERVER_IP='127.0.0.1' # Ip address of this server - default is localhost
export OPAL_ADMIN_PASS='password'
export R_SERVER_HOST='datashield_rserver'



# install opal
cd ~/ds_deployment/ds_develop/datashield_docker
./configure_prod.sh


# start the ds_poll_monitor_server
printf "######################\n Installing Poll server and GUI ... \n######################\n\n"

cd ~/ds_deployment/ds_develop/ds_poll_monitor_server
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
