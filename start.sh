#!/bin/bash

cd ds_opal
./start.sh

cd ../ds_poll_monitor_server
echo "starting poll monitor server"
./start.sh

cd ../ds_rstudio
./start.sh