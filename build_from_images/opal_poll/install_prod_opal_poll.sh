source ./opal_poll.config

QP_HOME_DIR=${QP_HOME_DIR:-"$HOME/ds_deployment"}

if [[ $(which docker) ]]; then
    echo "docker already installled, version is: "
    docker -v
    
else
    echo "docker not installed, installing docker:"
    cd $QP_HOME_DIR/ds_develop
    ./install_docker.sh
fi

printf "**** Creating directory /etc/dsqp for config files and copying unzipped config files to /etc/dsqp directory ...\n\n"
mkdir -p $QP_DATA_DIR
mkdir -p /etc/dsqp/auth
cp $QP_HOME_DIR/opal_poll.config /etc/dsqp/opal_poll.config
cp -R $QP_HOME_DIR/auth/* /etc/dsqp/auth


printf "**** removing config files from home repository $QP_HOME_DIR...\n\n"
rm $QP_HOME_DIR/opal_poll.config
rm -rf $QP_HOME_DIR/auth

if [[ -n $QP_DOCKER_REGISTRY_PREFIX ]]; then
    printf "**** registry fround pulling images from $QP_DOCKER_REGISTRY_PREFIX ...\n\n"
   ./pullPollProdImages.sh $QP_DOCKER_REGISTRY_PREFIX $QP_DOCKER_REGISTRY_USER $QP_DOCKER_REGISTRY_PW
fi

./start_prod.sh

printf "\n the first time opal starts it takes a while to be ready as we are loading test data and configuring the servers for you, so please be patient\n"

printf "\n - visit $OPAL_SERVER_IP:8443 in your browser to access the poll server user interface \n"
printf "\n - visit https://$OPAL_SERVER_IP:443 in your browser to access the opal server user interface \n"

