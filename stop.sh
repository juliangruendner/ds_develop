#!/bin/bash

cd ds_opal
./stop.sh

cd ../ds_poll_monitor_server
./stop.sh

cd ../ds_rstudio
./stop.sh