#!/bin/bash

# this scripts installs the queue server for you
source ./queue.config

if [[ $(which docker) ]]; then
    echo "docker already installled, version is: "
    docker -v
    
else
    echo "docker not installed, installing docker:"
    ./install_docker.sh
fi

FILE=./nginx/dhparam.pem
if [ ! -f "$FILE" ]; then
    echo "Creating longer Diffie-Hellman Prime for extra security"
    openssl dhparam -out ./nginx/dhparam.pem 4096
fi


if [[ -n $QP_DOCKER_REGISTRY_PREFIX ]]; then
    printf "**** registry found pulling images from $QP_DOCKER_REGISTRY_PREFIX ...\n\n"
   ./pullQueueProdImages.sh $QP_DOCKER_REGISTRY_PREFIX $QP_DOCKER_REGISTRY_USER $QP_DOCKER_REGISTRY_PW
fi

./start_prod.sh


printf "\n - check if queue is running by typing 'docker ps' into the command line \n"