QP_VERSION_TAG=$1
REGISTRY_PREFIX=${2:-"docker.miracum.org/datashield_miracum"}
REGISTRY_USER=$3
REGISTRY_PW=$4





if [ -n $QP_VERSION_TAG ]; then
    QP_VERSION_TAG=":$QP_VERSION_TAG"
fi

printf "logging into registry $REGISTRY_PREFIX ...\n"
docker login --username=$REGISTRY_USER --password=$REGISTRY_PW "https://$REGISTRY_PREFIX"

printf "building images ...\n"

cd ds_rstudio
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

printf "building image: $REGISTRY_PREFIX/nginx_queue$QP_VERSION_TAG \n"
docker build -f Dockerfile.nginx.queue -t $REGISTRY_PREFIX/nginx_queue$QP_VERSION_TAG .

cd ../ds_test
printf "building image: $REGISTRY_PREFIX/ds_test$QP_VERSION_TAG \n"
docker build -f Dockerfile.ds_test -t $REGISTRY_PREFIX/ds_test$QP_VERSION_TAG .


printf "pushing images ...\n"

printf "pushing image: $REGISTRY_PREFIX/ds_analysis$QP_VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ds_analysis$QP_VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ds_opal$QP_VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ds_opal$QP_VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ds_poll_gui$QP_VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ds_poll_gui$QP_VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ds_poll$QP_VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ds_poll$QP_VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ds_queue$QP_VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ds_queue$QP_VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/nginx_queue$QP_VERSION_TAG \n"
docker push $REGISTRY_PREFIX/nginx_queue$QP_VERSION_TAG

printf "pushing image: $REGISTRY_PREFIX/ds_test$QP_VERSION_TAG \n"
docker push $REGISTRY_PREFIX/ds_test$QP_VERSION_TAG

printf "finished building an pushing all images for DS-QP ....\n"
