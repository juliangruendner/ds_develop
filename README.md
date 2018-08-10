# ds_develop

## Summary

This repository is a wrapper for the datashield repositories needed to implement a queue-poll mechanism.

It includes a ./gitUpdate.sh, which pulls the following subrepositories:
ds_poll
ds_queue
ds_common
datashield_docker

ds_queue implements a queue server, which recieves requests from a datashield client and stores them in memory to be polled and processed by the ds_poll thread

ds_poll implements a polling thread, which connects to the ds_queue server. It then polls new requests for ds_queue and sends it to opal to be
executed, once executed it relays the response back to the queue server.

ds_common contains common elements needed by ds_queue as well as ds_poll.

datashield_docker is a docker configuration of a datashield/opal server, which comes with LifeLines.sav test data needed.
This repository has been set up to test the queue-poll mechanism with a real live instance.


## Running and testing the queue-poll mechanism

please note that before running the complete queue-poll mechanism you need to navigate to the datashield_docker repository and follow the readme there to set up your datashield/opal environment.

after this you can run the `./start.sh` in this repository to setup your development environment.
you should now have a running opal environment (check using `docker ps`),
a running queue server `pgrep -fl proxpy.py` and a running poll thread `pgrep -fl ds_poll`

Now that everything is set up you can run the test R script.

first run the Script without the qp `R -f ds_direct.r`
then run the script with the qp `R -f ds_qp.r`

if everything runs succesfully you should see the following on your terminal:

--- begin terminal output ---
Variables assigned:
datashield_opal--GESLACHT, GEWICHT, LENGTE, HEALTH17A1, HEALTH17B1, HEALTH17D1, DBPa, SMK11, SMK31, SMK4A1, SMK4A21
--- end terminal output ---


## developing the queue-poll mechanism

if you would like to debug or develop the q-p mechanism further it might be easier to start the queue and poll servers in separate terminal windows to follow the output of the implementations.

navigate to the ds_queue repo and execute `./start.sh`
in a new terminal window navigate to the ds_poll rep and execute `./start.sh`

In a new termianl window Run the test R script in this rep `R -f ds_qp.r` and see the output of the servers in your terminal windows.

## needed ports for the services

- opal environment
opal: http= 8880, https=8843
r-server: 6611 und 6612
datashield_agate: 8881, 8844

- q-p
ds_queue: 8001
ds_poll: -