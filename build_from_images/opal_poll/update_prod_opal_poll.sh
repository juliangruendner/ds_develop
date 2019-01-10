source ./opal_poll.config

if [[ $(which docker) ]]; then
    echo "docker already installled, version is: "
    docker -v
    
else
    echo "docker not installed, installing docker:"
    cd ~/ds_deployment/ds_develop
    ./install_docker.sh
fi


if [[ -n $QP_DOCKER_REGISTRY_PREFIX ]]; then
    printf "**** registry fround pulling images from $QP_DOCKER_REGISTRY_PREFIX ...\n\n"
   ./pullPollProdImages.sh $QP_DOCKER_REGISTRY_PREFIX $QP_DOCKER_REGISTRY_USER $QP_DOCKER_REGISTRY_PW
fi


docker-compose -f docker-compose.poll.prod.yml down

./start_prod.sh

printf "\n the first time opal starts it takes a while to be ready as we are loading test data and configuring the servers for you, so please be patient\n"

printf "\n - visit $OPAL_SERVER_IP:80/poll-monitor in your browser to access the poll server user interface \n"
printf "\n - visit https://$OPAL_SERVER_IP:8843 in your browser to access the opal server user interface \n"
