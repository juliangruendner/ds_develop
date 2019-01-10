#!/bin/bash

# this scripts reconfigures the queue server for you
source ./queue.config

./stop_prod.sh
./start_prod.sh

printf "reconfiguration finished\n"