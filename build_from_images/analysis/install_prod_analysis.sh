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


if [[ -n $QP_DOCKER_REGISTRY_PREFIX ]]; then
    printf "**** registry found pulling images from $QP_DOCKER_REGISTRY_PREFIX ...\n\n"
   ./pullAnalysisProdImages.sh $QP_DOCKER_REGISTRY_PREFIX $QP_DOCKER_REGISTRY_USER $QP_DOCKER_REGISTRY_PW
fi

./start_prod.sh