#!/bin/bash

# this scripts installs the queue server for you
source ./queue.config

# stop queue to start configuration


printf "stopping and starting the queue for new configurations to take effect\n"

cd ds_queue
./stop.prod.sh
./start.prod.sh

printf "reconfiguration finished\n"