REGISTRY_PREFIX=$1
REGISTRY_USER=$2
REGISTRY_PW=$3

printf "logging into registry $REGISTRY_PREFIX ...\n"
docker login --username=$REGISTRY_USER --password=$REGISTRY_PW "https://$REGISTRY_PREFIX"

printf "building images ...\n"

cd ds_opal/opal_with_init
printf "building image: $REGISTRY_PREFIX/ds_opal \n"
docker build -f Dockerfile -t $REGISTRY_PREFIX/ds_opal .

cd ../../ds_poll_monitor_server
printf "building image: $REGISTRY_PREFIX/ds_poll_gui \n"
docker build -f Dockerfile.poll_gui_server -t $REGISTRY_PREFIX/ds_poll_gui .

printf "building image: $REGISTRY_PREFIX/ds_poll \n"
docker build -f Dockerfile.poll_server -t $REGISTRY_PREFIX/ds_poll ../

cd ../ds_queue
printf "building image: $REGISTRY_PREFIX/ds_queue \n"
docker build -f Dockerfile.queue -t $REGISTRY_PREFIX/ds_queue .


printf "pushing images ...\n"

printf "pushing image: $REGISTRY_PREFIX/ds_opal \n"
docker push $REGISTRY_PREFIX/ds_opal

printf "pushing image: $REGISTRY_PREFIX/ds_poll_gui \n"
docker push $REGISTRY_PREFIX/ds_poll_gui

printf "pushing image: $REGISTRY_PREFIX/ds_poll \n"
docker push $REGISTRY_PREFIX/ds_poll

printf "pushing image: $REGISTRY_PREFIX/ds_queue \n"
docker push $REGISTRY_PREFIX/ds_queue

printf "finisehd building an pushing all images for DS-QP ....\n"
