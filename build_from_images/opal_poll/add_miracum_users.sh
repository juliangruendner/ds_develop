#!/bin/bash

users=(miracum_er_1, miracum_er_2, miracum_er_3, miracum_fr_1, miracum_fr_2, miracum_fr_3)

for user in ${users[@]}
do
   CERT_FILE=/miracum_users/users/$user.pem
   docker exec datashield_opal bash -c "/miracum/create_miracum_user.sh $user $CERT_FILE"
done


