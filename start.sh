cd datashield_docker
./start.sh
cd ../ds_queue
./start.sh &
sleep 1
cd ../ds_poll
./start.sh