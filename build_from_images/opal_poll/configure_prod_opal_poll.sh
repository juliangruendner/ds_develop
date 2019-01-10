#!/bin/bash
source ./opal_poll.config

docker-compose -f docker-compose.poll.prod.yml down
docker-compose -f docker-compose.poll.prod.yml up

printf "\n - visit $OPAL_SERVER_IP:80 in your browser to access the poll server user interface \n"
printf "\n - visit $OPAL_SERVER_IP:8880 in your browser to access the opal server user interface \n"
