#!/bin/bash

# specify your tagname, and description below
TAGNAME='v0.0.3'
DESCRIPTION='first dockerised version, includes improvements and bugfixes for opal and autogeneration of certificate files for queue'

repos=("ds_common" "ds_poll" "ds_queue" "ds_opal" "ds_test" "ds_poll_monitor_server" "ds_poll_monitor_gui")
baseDir=$(pwd)

printf "****versioning base repository****\n"
git tag -a $TAGNAME -m "$DESCRIPTION"
git push origin $TAGNAME

for repoName in ${repos[@]}
do
  printf "**** Tagging repository $repoName **** \n" 
  cd $repoName
  git tag -a $TAGNAME -m "$DESCRIPTION"
  git push origin $TAGNAME
  #git tag -d $TAGNAME
  cd ..
done