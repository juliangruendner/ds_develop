#!/bin/bash

source /etc/dsqp/ds_analysis.config
#CURPW=$(pwgen -s -1 15)
# define users to be created in this format: <user>,<pw>;<user>,<pw>;
#export RSTUDIO_USERS="datashield,$CURPW"
#echo $RSTUDIO_USERS
docker-compose -f  docker-compose.analysis.prod.yml up -d