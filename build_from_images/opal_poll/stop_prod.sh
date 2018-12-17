source ./opal_poll.config

printf "######################\Stopping Opal, Datashield and RServer ...\n######################\n\n"
docker-compose -f docker-compose.poll.prod.yml stop
