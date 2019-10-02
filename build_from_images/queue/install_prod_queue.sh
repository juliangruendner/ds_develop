#!/bin/bash

# this scripts installs the queue server for you
source ./queue.config
QP_HOME_DIR=${QP_HOME_DIR:-"$HOME/ds_deployment"}

if [[ $(which docker) ]]; then
    echo "docker already installled, version is: "
    docker -v
    
else
    echo "docker not installed, installing docker:"
    ./install_docker.sh
fi


printf "**** Creating directory /etc/dsqp for config files and copying unzipped config files to /etc/dsqp directory ...\n\n"
mkdir -p /etc/dsqp/auth
mkdir /etc/dsqp/nginx
cp $QP_HOME_DIR/queue.config /etc/dsqp/queue.config
cp -R $QP_HOME_DIR/auth/queue.pem /etc/dsqp/auth/queue.pem
cp -R $QP_HOME_DIR/nginx/* /etc/dsqp/nginx

printf "**** removing config files from home repository $QP_HOME_DIR...\n\n"
rm $QP_HOME_DIR/queue.config
rm -rf $QP_HOME_DIR/auth
rm -rf $QP_HOME_DIR/nginx

FILE=/etc/dsqp/nginx/dhparam.pem
if [ ! -f "$FILE" ]; then
    echo "Creating longer Diffie-Hellman Prime for extra security... this may take a fhile \n\n"
    openssl dhparam -out /etc/dsqp/nginx/dhparam.pem 4096
fi


if [[ -n $QP_DOCKER_REGISTRY_PREFIX ]]; then
    printf "**** registry found pulling images from $QP_DOCKER_REGISTRY_PREFIX ...\n\n"
   ./pullQueueProdImages.sh $QP_DOCKER_REGISTRY_PREFIX $QP_DOCKER_REGISTRY_USER $QP_DOCKER_REGISTRY_PW
fi


./start_prod.sh


printf "\n - check if queue is running by typing 'docker ps' into the command line \n"