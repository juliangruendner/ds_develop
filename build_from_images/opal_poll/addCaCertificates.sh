docker exec -it poll_server bash -c "cp /auth/ca_certs/* /usr/local/share/ca-certificate && update-ca-certificates"