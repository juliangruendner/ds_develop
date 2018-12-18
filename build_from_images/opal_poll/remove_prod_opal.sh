
docker stop datashield_opal
docker stop poll_gui_server
docker stop datashield_rserver
docker stop datashield_mongo
docker stop poll_server
docker stop poll_gui_server

docker rm datashield_opal
docker rm poll_gui_server
docker rm datashield_rserver
docker rm datashield_mongo
docker rm poll_server
docker rm poll_gui_server

docker rmi $(docker images --quiet --filter "dangling=true")
docker volume rm $(docker volume ls -q -f dangling=true)