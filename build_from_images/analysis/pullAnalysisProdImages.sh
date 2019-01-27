REGISTRY_PREFIX=${QP_DOCKER_REGISTRY_PREFIX:-""}
REGISTRY_USER=${QP_DOCKER_REGISTRY_USER:-""}
REGISTRY_PW=${QP_DOCKER_REGISTRY_PW:-""}
QP_VERSION_TAG=${QP_VERSION_TAG:-""}

if [ -n $QP_VERSION_TAG ]; then
    QP_VERSION_TAG=":$QP_VERSION_TAG"
fi


if [ -n "$REGISTRY_USER" ]  && [ -n "$REGISTRY_PREFIX" ]; then
    printf "logging into registry $REGISTRY_PREFIX ...\n"
    docker login --username=$REGISTRY_USER --password=$REGISTRY_PW "https://$REGISTRY_PREFIX"
fi

printf "pulling ds analysis images ...\n"

printf "pulling image: $REGISTRY_PREFIX/ds_analyis$QP_VERSION_TAG \n"
docker pull $REGISTRY_PREFIX/ds_analyis$QP_VERSION_TAG
docker tag $REGISTRY_PREFIX/ds_analyis$QP_VERSION_TAG ds_analyis:latest

printf "finished pulling all images for datashield analysis Server ....\n"


