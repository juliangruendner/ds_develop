REGISTRY_PREFIX=${QP_DOCKER_REGISTRY_PREFIX:-""}
REGISTRY_USER=${QP_DOCKER_REGISTRY_USER:-""}
REGISTRY_PW=${QP_DOCKER_REGISTRY_PW:-""}
QP_VERSION_TAG=${QP_VERSION_TAG:-""}

if [ -n $QP_VERSION_TAG ]; then
    QP_VERSION_TAG=":$QP_VERSION_TAG"
fi

printf "logging into registry $REGISTRY_PREFIX ...\n"
docker login --username=$REGISTRY_USER --password=$REGISTRY_PW "https://$REGISTRY_PREFIX"

printf "pulling QP images ...\n"

printf "pulling image: $REGISTRY_PREFIX/ds_queue$QP_VERSION_TAG \n"
docker pull $REGISTRY_PREFIX/ds_queue$QP_VERSION_TAG
docker tag $REGISTRY_PREFIX/ds_queue ds_queue:latest

printf "finished pulling all images for DS-QP ....\n"

