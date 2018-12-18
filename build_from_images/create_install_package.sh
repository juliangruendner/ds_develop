cp ../opal_poll.config_sample ./opal_poll.config
cp ../queue.config_sample ./queue.config

rm opal_poll_install.zip
rm queue_install.zip

zip -rj opal_poll_install.zip opal_poll.config opal_poll/ -x opal_poll/opal_poll.config 
zip -rj queue_install.zip queue.config queue/ -x queue/queue.config

rm ./opal_poll.config
rm ./queue.config