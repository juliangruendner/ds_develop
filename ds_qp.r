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
url <- c("https://localhost:8001")
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
