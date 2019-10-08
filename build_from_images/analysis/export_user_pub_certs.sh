source /etc/dsqp/ds_analysis.config

zip ds_users.zip -r $QP_DATA_DIR/ds_homes -i '*.pem' -x "$QP_DATA_DIR/ds_homes/*/.ssh/*key*.pem"