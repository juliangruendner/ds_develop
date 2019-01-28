# DS Analyis Server installation guide


## Install your analyis server on a server

The datashield analysis application comes packed in docker images, which are automatically donwloaded from your registry of choice.

### To install the system:

*open the ds_analysis.config file and change the configuration information* to your requirements.

then execute `./install_prod_analysis.sh` in this repo.

Thats it, your queue server is now installed.


### Install own SSL certificate

To install your own SSL certificate: 
1. open the file ./auth/rstudiocert.pem, truncate it and paste your certificate .pem file, then save the changes 
2. open the file ./auth/rstudiokey.pem, truncate it and paste your key .pem file, then save the changes 
3. Finally, restart the analysis server using first the ./stop_prod.sh and then the ./start_prod.sh files.

### The config file explained

export QP_VERSION_TAG='v0.1.0' # version of qp and ds system - e.g. v0.0.1 - default is empty => master = newest
export QP_DOCKER_REGISTRY_PREFIX='docker.miracum.org/datashield_miracum' # registry host:port  e.g. 'testregistry.de:5043'
export QP_DOCKER_REGISTRY_USER='' # user e.g. 'test'
export QP_DOCKER_REGISTRY_PW=''  #  password, e.g. 'test123!'
export RSTUDIO_USERS='datashield,password' # create RSTUDIO users ";" separated e.g. 'user,pw;user,pw' - it is important to set at least one user and to choose a secure password


