#!/bin/bash

len=${#MIRACUM_PROJECTS[@]}

printf "Creating miracum projects and users - note: the miracum import user will get permission to administer the projects"


for (( i=0; i<$len; i++ )); 
    do 
        
        PROJECT=${MIRACUM_PROJECTS[$i]}
        USER=${MIRACUM_PROJECTS[$i]}

        echo "create project $PROJECT and user $USER "

    done