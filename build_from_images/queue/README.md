# DS Q-P + OPAL installation guide


## Install your queue server on a server

The Q-P datashield opal application comes packed in docker images, which are automatically donwloaded from your registry of choice.

### To install the system:

*open the queue.config file and change the configuration information* to your requirements.

then execute `./install_prod_queue.sh` in this repo.

Thats it, your queue server is now installed.


### Install own SSL certificate

To install your own SSL certificate open the file ./auth/queue.pem, truncate it and paste your certificate .pem file. Save the changes and restart the
queue server using first the ./stop_prod.sh and then the ./start_prod.sh files.






