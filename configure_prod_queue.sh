# this scripts installs the queue server for you

### BEGIN CONFIGURATIONS ###
# uncomment variables to set configuration

## Timeout
# TIMEOUT_QUEUE_AND_POLL sets the timeout for the queue
# -t <requestTimeout:responseTimeout> , sets request and response timeout for the queue
# if not set the default value is 10:10  (10 seconds) and (10 seconds)
##

# export TIMEOUT_QUEUE_AND_POLL='-t 10:10'

## Allowed Ips
# If the ALLOWED_IPS is not set the queue server is open to all ip addresses, to make the mechanism safer restrict the queue to certain ip adresses,
# Set the allowed ipadresses by setting ALLOWED_IPS to '-c <ipadress>,<ipadress>'
# note, that the allowed ip addresses should at least include your poll server ip address and one R client server ip address for the q-p
# to function.
##

# export ALLOWED_IPS='-c 140.0.0.1,140.0.0.1'

### END CONFIGURATIONS ###

# stop queue to start configuration


printf "stopping and starting the queue for new configurations to take effect\n"

cd ds_queue
./stop.prod.sh
./start.prod.sh

printf "reconfiguration finished\n"