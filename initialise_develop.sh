# this initialises the needed base containers for rstudio and the poll monitor server

cd ds_opal/opal_with_init
docker build -f Dockerfile -t opal_docker .

cd ../../ds_rstudio
docker build -f Dockerfile.rstudio.base -t rstudio_server .
docker build -f Dockerfile.rstudio.ds -t ds_rstudio_server .

cd ../ds_poll_monitor_server
docker build -f Dockerfile.poll_gui_server -t ds_poll_gui .
docker build -f Dockerfile.poll_server -t ds_poll ../