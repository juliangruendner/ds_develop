# ds_develop

See main README file of this repository before reading on.

This README guides you through how you can participate in the development of this repository and how to setup your own development environment.

## Install Docker

1. Install docker, if you are using linux ubuntu you can simply execute the build_from_images/install_docker.sh of this repository, else 
   please refer to https://www.docker.com/get-started 

2. Install docker-compose (note: the install_docker.sh script install docker-compose for you)


## Pull all the subrepositories of this project

This repository is a wrapper for multiple sub-repositories needed to implement a queue-poll mechanism with opal and datashield

It includes a `/gitUpdate.sh`, which pulls the following subrepositories:

- ds_opal
- ds_common
- ds_poll
- ds_queue
- ds_poll_monitor_gui
- ds_poll_monitor_server
- ds_rstudio
- ds_test

## initialise your develop environment and start all neccessary docker containers

To spin up our development environment we need to first build some basic containers, which we will use to build upon.

To initialise those containers you have to execute the ./initialise_develop.sh ones, when u download this repository.

For convenience I have provided a start.sh and stop.sh to start the docker containers of this project and to stop them.
If executed it starts the following containers:

- datashield_rserver   
- datashield_mongo
- datashield_opal
- datashield_datashield
- queue_server
- poll_monitor_mongodb
- poll_monitor_db
- poll_server 


## Start developing

The opal parts of the project (datashield_rserver, datashield_mongo, datashield_opal) are not meant for developing and are simply used to test the rest of the project and new functionalities.

the queue_server and poll_server both mount their respective source code into the container so that changes made on the host are directly relaied to the docker container and can be tested immediatly.

... TODO - finish develop description

