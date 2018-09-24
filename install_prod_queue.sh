# this scripts installs the queue server for you

### BEGIN CONFIGURATIONS ###
# uncomment variables to set configuration

## Timeout
# TIMEOUT_QUEUE_AND_POLL sets the timeout for the queue
# -t <requestTimeout:responseTimeout> , sets request and response timeout for the queue
# if not set the default value is 10:10  (10 seconds) and (10 seconds)
##

# TIMEOUT_QUEUE_AND_POLL='-t 10:10'

## Allowed Ips
# If the ALLOWED_IPS is not set the queue server is open to all ip addresses, to make the mechanism safer restrict the queue to certain ip adresses,
# Set the allowed ipadresses by setting ALLOWED_IPS to '-c <ipadress>,<ipadress>'
# note, that the allowed ip addresses should at least include your poll server ip address and one R client server ip address for the q-p
# to function.
##

#ALLOWED_IPS='-c 140.0.0.1,140.0.0.1'

### END CONFIGURATIONS ###


# Initialise the repository and clone newest version
mkdir ~/ds_deployment
cd ~/ds_deployment
git clone git@github.com:juliangruendner/ds_develop.git
cd ds_develop
./gitUpdate.sh


# start the queue
cd ds_queue
./start.prod.sh
