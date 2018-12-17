source ./opal_poll.config

if [[ -n $QP_DOCKER_REGISTRY_PREFIX ]]; then
   ./pullProdImages.sh $QP_DOCKER_REGISTRY_PREFIX $QP_DOCKER_REGISTRY_USER $QP_DOCKER_REGISTRY_PW
fi
