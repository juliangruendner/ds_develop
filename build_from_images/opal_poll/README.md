# DS Q-P + OPAL installation guide


## Install your poll thread, opal server and poll monitor server on a server

The Q-P datashield opal application comes packed in docker images, which are automatically donwloaded from your registry of choice.

*Please note that in order to run your poll thread you require a datashield queue server to connect to, so make sure u have installed this before you continue.*

### To install the system:

*open the opal_poll.config file and change the configuration information* to your server requirements.

then execute `./install_prod_opal_poll.sh` in this repo.

Thats it, your poll server, opal and datashield server is now installed.

Please be aware that the server might take a couple of minutes to be available as the startup script automatically installs test data and updates the opal server.


### The config file explained

export QP_VERSION_TAG='' # version of qp and ds system - e.g. v0.0.1
export OPAL_SERVER_IP='127.0.0.1' # Ip address of this server (the server which hosts the opal and poll thread) - default is localhost
export QP_DOCKER_REGISTRY_PREFIX='' # registry host:port  e.g. 'testregistry.de:5043' this is used to download the respective images
export QP_DOCKER_REGISTRY_USER='' # user e.g. 'test'  - this user is not needed for publically available images such as the ds images from the miracum registry
export QP_DOCKER_REGISTRY_PW=''  #  password, e.g. 'test123!' - not needed for publically available images - see above.
export OPAL_ADMIN_PASS='password'  # password for the opal server - it is important for this password to be a save password
export R_SERVER_HOST='datashield_rserver' # host of an r server used for the opal evaluation 
export OPAL_MONGODB_HOST='datashield_mongo'

export POLL_QUEUE_SERVER='' # e.g. '-q 123.12.12.12:443' , queue server host and port(usually 443)
export POLL_OPAL_SERVER=''  # e.g. '-o 123.12.12.12:443' , opal server host and port, if left blank defaults to datashield_opal:8443, which is correct for a pure docker setup
export POLL_THREADS=''      # e.g. '-t 5' number of poll threads defaults to 2



### Installing your own ssl certificate

To install your own ssl certificate you can either use the user interface or the command line tools we have provided

- command line tools:
1. exchange the opalcert.pem and opalkey.pem files with your own certificate files, but make sure, that the filename stays the same.
2. execute `./import_certificate.sh` in the opal_poll folder (NOT the one in the ./auth folder)
3. your certificate should now be updated

- opal user interface
go to your opal server https://OPAL_SERVER_IP:443 and login to the admin

To see if Opal is running connect








