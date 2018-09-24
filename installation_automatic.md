# DS Q-P + OPAL installation guide


## Install your poll thread, opal server and poll monitor server on a server

### 1 - prepare for installation

1. connect to your new server via ssh
2. change to sudo user: `sudo -s`

3. add the ssh user to access the prive ds repos

create a .ssh dir: `mkdir ~/.ssh`
upload the id_rsa_ds file to your .ssh dir  (get the private key as part of your installation package)
start the ssh agent and add the ssh key:

```bash 
cd ~/.ssh
eval $(ssh-agent -s)
chmod 600 ~/.ssh/id_rsa_ds
ssh-add ~/.ssh/id_rsa_ds
```
### 2 install opal with R server and test data + the poll mechanism with gui
execute `./install_prod_opal_poll.sh` in this repo


in your browser open the poll mechanism monitor:
`<server ip of current server>:80/poll-monitor`
you should now see the poll monitor gui, which lets you control the poll thread



## Install your queue server

### 1 - prepare for installation

1. connect to your new server via ssh
2. change to sudo user: `sudo -s`

3. add the ssh user to access the prive ds repos

create a .ssh dir: `mkdir ~/.ssh`
upload the id_rsa_ds file to your .ssh dir  (get the private key as part of your installation package)
start the ssh agent and add the ssh key:

```bash 
cd ~/.ssh
eval $(ssh-agent -s)
chmod 600 ~/.ssh/id_rsa_ds
ssh-add ~/.ssh/id_rsa_ds
```

### 2 download the ds repo to ur server

1. create a dir for your qp deployment ` mkdir ~/ds_deployment`
2. in your deployment dir pull the qp develop repo and all sub repos 

```bash
cd ~/ds_deployment
git clone git@github.com:juliangruendner/ds_develop.git
cd ds_develop
./git_update.sh
```

### 3 start the queue server

```bash
cd ~/ds_deployment/ds_develop/ds_queue

```

for more information type `python3 ds_queue.py -h`

the following command starts the queue server in the background
`nohup python3 ds_queue.py -a 0.0.0.0 -p 443 -r localhost:8843 -d proxyLog.logs -v -i -s -t 10:10`

like this the queue server is open to all ip addresses, to make the mechanism safer restrict the queue to certain ip adresses,
with the added option -c <ipadress>,<ipadress>

note, that the allowed ip addresses should at least include your poll server ip address and one R client server ip address for the q-p
to function.

a command could look like this:
`nohup python3 ds_queue.py -a 0.0.0.0 -p 443 -r localhost:8843 -d proxyLog.logs -v -i -s -t 10:10 -c 141.123.123.1,141.123.123.10`


## Test your installation

Your installation should now be complete and your queue server started. 
Go to your poll server installation and access its webservice to start the poll mechanism:
in your browser: `<poll_server_ip>/poll-monitor`
switch to the tab *control* and enter your queue server host and port and leave the opal server blank
then click start poll server 
your poll server should no be running (see running label in user interface)

now go to your R datashield client server and execute the following commands in R, changing 
*queue_server_host* for your queue server host.

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



