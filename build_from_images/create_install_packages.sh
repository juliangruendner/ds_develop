rm analysis_install.zip
rm opal_poll_install.zip
rm queue_install.zip

cd opal_poll && zip -r ../opal_poll_install.zip *
cd ../queue && zip -r ../queue_install.zip queue *
cd ../analysis && zip -r ../analysis_install.zip *