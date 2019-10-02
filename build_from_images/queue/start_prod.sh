source /etc/dsqp/queue.config

# uncomment the next two lines to configure your queue
TIMEOUT_QUEUE_AND_POLL=${TIMEOUT_QUEUE_AND_POLL:-"-t 10:10"}
ALLOWED_IPS=${ALLOWED_IPS:-""}

if [[ $(which docker) ]]; then
    echo "docker already installled, version is: "
    docker -v
else
    echo "docker not installed, installing docker:"
    ../install_docker.sh
fi

docker-compose -f docker-compose.prod.yml up -d
