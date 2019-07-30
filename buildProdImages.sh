#!/bin/bash

QP_VERSION_TAG=":v0.5.0"
REGISTRY_PREFIX="docker.miracum.org/ds_miracum_ci_test"
printf "building images ...\n"

cd ds_rstudio
printf "pull ds_analysis base image \n"
docker pull $REGISTRY_PREFIX/ds_analysis_base:latest
docker tag $REGISTRY_PREFIX/ds_analysis_base:latest ds_analysis_base:latest

printf "building image: $REGISTRY_PREFIX/ds_analysis$QP_VERSION_TAG \n"
docker build -f Dockerfile.rstudio.ds -t $REGISTRY_PREFIX/ds_analysis$QP_VERSION_TAG .

cd ../ds_opal/opal_with_init
printf "building image: $REGISTRY_PREFIX/ds_opal$QP_VERSION_TAG \n"
docker build -f Dockerfile -t $REGISTRY_PREFIX/ds_opal$QP_VERSION_TAG .

cd ../../ds_poll_monitor_server
printf "building image: $REGISTRY_PREFIX/ds_poll_gui$QP_VERSION_TAG \n"
docker build -f Dockerfile.poll_gui_server -t $REGISTRY_PREFIX/ds_poll_gui$QP_VERSION_TAG .

printf "building image: $REGISTRY_PREFIX/ds_poll$QP_VERSION_TAG \n"
docker build -f Dockerfile.poll_server -t $REGISTRY_PREFIX/ds_poll$QP_VERSION_TAG ../

cd ../ds_queue
printf "building image: $REGISTRY_PREFIX/ds_queue$QP_VERSION_TAG \n"
docker build -f Dockerfile.queue -t $REGISTRY_PREFIX/ds_queue$QP_VERSION_TAG .

cd ../ds_queue
printf "building image: $REGISTRY_PREFIX/ds_queue_nginx$QP_VERSION_TAG \n"
docker build -f Dockerfile.nginx.queue -t $REGISTRY_PREFIX/ds_queue_nginx$QP_VERSION_TAG .

