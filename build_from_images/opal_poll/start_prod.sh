source ./opal_poll.config

printf "######################\nInitialising Opal and installing Datashield and RServer ...\n######################\n\n"

docker-compose -f docker-compose.poll.prod.yml up -d

./poll_admin.sh start "$POLL_QUEUE_SERVER" "$POLL_OPAL_SERVER" "$POLL_THREADS" "$CHECK_SERVER_CERT"
