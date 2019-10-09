source /etc/dsqp/queue.config

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
   ./pullQueueProdImages.sh $QP_DOCKER_REGISTRY_PREFIX $QP_DOCKER_REGISTRY_USER $QP_DOCKER_REGISTRY_PW
fi


printf "\n Removing config folders and files from home directory $QP_HOME_DIR - you can find your config files  here /etc/dsqp/ \n"
rm -rf $QP_HOME_DIR/auth
rm -rf $QP_HOME_DIR/nginx
rm $QP_HOME_DIR/queue.config

docker-compose -f docker-compose.prod.yml down

./start_prod.sh

printf "\n - check if queue is running by typing 'docker ps' into the command line \n"
