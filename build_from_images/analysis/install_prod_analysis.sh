#!/bin/bash

# this scripts installs the queue server for you
source ./ds_analysis.config
QP_HOME_DIR=${QP_HOME_DIR:-"$HOME/ds_deployment"}

printf "**** Creating directory /etc/dsqp for config files and copying unzipped config files to /etc/dsqp directory ...\n\n"
mkdir -p $QP_DATA_DIR
mkdir -p /etc/dsqp/auth
cp $QP_HOME_DIR/ds_analysis.config /etc/dsqp/ds_analysis.config
cp -R $QP_HOME_DIR/auth/* /etc/dsqp/auth

printf "**** removing config files from home repository $QP_HOME_DIR...\n\n"
rm $QP_HOME_DIR/ds_analysis.config
rm -rf $QP_HOME_DIR/auth

if [[ $(which docker) ]]; then
    echo "docker already installled, version is: "
    docker -v
    
else
    echo "docker not installed, installing docker:"
    cd $QP_HOME_DIR
    ./install_docker.sh
fi







if [[ -n $QP_DOCKER_REGISTRY_PREFIX ]]; then
    printf "**** registry found pulling images from $QP_DOCKER_REGISTRY_PREFIX ...\n\n"
   ./pullAnalysisProdImages.sh $QP_DOCKER_REGISTRY_PREFIX $QP_DOCKER_REGISTRY_USER $QP_DOCKER_REGISTRY_PW
fi

./start_prod.sh

printf "\n - visit your server IP or domain + port 8787 in your browser to access the analysis client \n"