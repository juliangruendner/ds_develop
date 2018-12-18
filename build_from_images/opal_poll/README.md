# DS Q-P + OPAL installation guide


## Install your poll thread, opal server and poll monitor server on a server

The Q-P datashield opal application comes packed in docker images, which are automatically donwloaded from your registry of choice.

*Please note that in order to run your poll thread you require a datashield queue server to connect to, so make sure u have installed this before you continue.*

### To install the system:

*open the opal_poll.config file and change the configuration information* to your server requirements.

then execute `./install_prod_opal_poll.sh` in this repo.

Thats it, your poll server, opal and datashield server is now installed.






