source /etc/dsqp/opal_poll.config

QP_HOME_DIR=${QP_HOME_DIR:-"$HOME/ds_deployment"}

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


printf "\n Removing config folders and files from home directory $QP_HOME_DIR - you can find your config files  here /etc/dsqp/ \n"
rm -rf $QP_HOME_DIR/auth
rm -rf $QP_HOME_DIR/miracum_users
rm $QP_HOME_DIR/opal_poll.config

docker-compose -f docker-compose.poll.prod.yml down

./start_prod.sh

printf "\n the first time opal starts it takes a while to be ready as we are loading test data and configuring the servers for you, so please be patient\n"

printf "\n - visit $OPAL_SERVER_IP:8443 in your browser to access the poll server user interface \n"
printf "\n - visit https://$OPAL_SERVER_IP:443 in your browser to access the opal server user interface \n"
