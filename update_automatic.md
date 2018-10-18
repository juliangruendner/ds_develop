# DS Q-P + OPAL installation guide

## 1 - Update Information

This is a manual for the updating of the opal poll and queue server.

Please note that we have two update pathways:

1. Dynamic update via our official repositories (requires an internet connection of the virtual machine)
2. Static update via a provided virtual machine


## Update your poll thread, opal server and poll monitor server on a server

### 1 Dynamic update

login to your vm via ssh, then:

change to sudo `sudo -s`

navigate to the repo `cd ~/ds_deployment/ds_develop`

*open the update_prod_opal_poll.sh and change the configuration information* to your server requirements,

then execute `./update_prod_opal_poll.sh` in this repo.


### 2 Static update

If you have been given a new virtual machine to install please proceed as follows:

Start the virtual machine and login via ssh, then:

change to sudo `sudo -s`

navigate to the repo `cd ~/ds_deployment/ds_develop`

*open the configure_prod_opal_poll.sh and change the configuration information* to your server requirements,

then execute `./configure_prod_opal_poll.sh` in this repo

in your browser open the poll mechanism monitor:
`<server ip of current server>:80/poll-monitor`
you should now see the poll monitor gui, which lets you control the poll thread


## update your queue server

### 1 - Dynamic update

login via ssh, then:

change to sudo user: `sudo -s`

navigate to the repo `cd ~/ds_deployment/ds_develop`

change the rights to execute `chmod +x ~/install_prod_queue.sh`  (note: a queue update is the same as a new installation)

change your configurations in the install_prod_queue.sh file of this repository and then execute `./install_prod_queue.sh`


### 2 - Static update

If you have been given a new virtual machine to install please proceed as follows:

Start the virtual machine and login via ssh, then:

change to sudo user: `sudo -s`

navigate to the repo `cd ~/ds_deployment/ds_develop`

open the configure_prod_queue.sh and *change the configuration information* to your server requirements,

change the rights to execute `chmod +x ~/configure_prod_queue.sh`  (note: a queue update is the same as a new installation)

change your configurations in the configure_prod_queue.sh file of this repository and then execute `./configure_prod_queue.sh`

#### working with the queue:

the queue is started in a docker container and can be managed with the following bash commands:
first navigate to the queue repository `cd ~/ds_deployment/ds_develop/ds_queue`

starting the queue
execute `./start.prod.sh`

stopping the queue
execute `./stop.prod.sh`

getting the queue status
execute `docker exec queue_server_prod bash -c "cd /root/ds_queue && ./q_admin.sh status"`

## Test your installation

Your installation should now be complete and your queue server started. 
Go to your poll server installation and access its webservice to start the poll mechanism:
in your browser: `<poll_server_ip>/poll-monitor`
switch to the tab *control* and enter your queue server host and port and leave the opal server blank
then click start poll server 
your poll server should no be running (see running label in user interface)

now go to your R datashield client server and execute the following commands in R, changing 
*queue_server_host* for your queue server host.

note: if you do not have a running R server see the section below *Run R server locally*




If you see this output:

```
Variables assigned:
datashield_opal--GESLACHT, GEWICHT, LENGTE, HEALTH17A1, HEALTH17B1, HEALTH17D1, DBPa, SMK11, SMK31, SMK4A1, SMK4A21
````

your Installation is working



```R
# Load opal and datashield libraries
library(opal)
library(opaladmin)
library(dsBaseClient)
library(dsStatsClient)
library(dsGraphicsClient)
library(dsModellingClient)

# Login to VMs

# To understand why these variables are assigned this way, see the
# documentation for the datashield.login function (part of the opal
# package)

# login details
server <- c("datashield_opal")
# note the datashield_opal only works from inside this docker container
url <- c("https://queue_server_host:443")  # Ur quserver host or ip address here
# ^^^ Note this specifies the port number
user <- "administrator"
password <- "password"
table <- c("test.LifeLines")
# ^^^ note that this reflects the folder hierarchy that can be seen via the OPAL web interface

# Create a dataframe with all these details
logindata <- data.frame(server,url,user,password,table)

# Create an 'opals' object by passing the 'logindata' data frame to the
# datashield.login function
opals <- datashield.login(logins=logindata, assign = TRUE)
```


### Run R server locally

As a first test you can start your test server on your poll server and connect to your queue.

For this navigate to the test repo:

`cd ~/ds_deployment/ds_develop/ds_test` and start the test docker `docker-compose up -d`
then connect to your test docker container `docker exec -it ds_test bash`

start R `R` and then paste the R test above with the `queue_server_host` string changed to your queue server ip address
