REGISTRY_PREFIX=$1
REGISTRY_USER=$2
REGISTRY_PW=$3

printf "logging into registry $REGISTRY_PREFIX ...\n"
docker login --username=$REGISTRY_USER --password=$REGISTRY_PW "https://$REGISTRY_PREFIX"

printf "pulling QP images ...\n"

printf "pulling image: $REGISTRY_PREFIX/ds_opal \n"
docker pull $REGISTRY_PREFIX/ds_opal
docker tag $REGISTRY_PREFIX/ds_opal ds_opal

printf "pulling image: $REGISTRY_PREFIX/ds_poll_gui \n"
docker pull $REGISTRY_PREFIX/ds_poll_gui
docker tag $REGISTRY_PREFIX/ds_poll_gui ds_poll_gui

printf "pulling image: $REGISTRY_PREFIX/ds_poll \n"
docker pull $REGISTRY_PREFIX/ds_poll
docker tag $REGISTRY_PREFIX/ds_poll ds_poll

printf "pulling image: $REGISTRY_PREFIX/ds_queue \n"
docker pull $REGISTRY_PREFIX/ds_queue
docker tag $REGISTRY_PREFIX/ds_queue ds_queue

printf "finished pulling all images for DS-QP ....\n"


