docker stop queue_server_prod
docker rm queue_server_prod

docker rmi $(docker images --quiet --filter "dangling=true")
docker volume rm $(docker volume ls -q -f dangling=true)