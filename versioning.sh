#!/bin/bash

# specify your tagname, and description below
TAGNAME='v0.0.1'
DESCRIPTION='first deployable version'

repos=("ds_common" "ds_poll" "ds_queue" "datashield_docker" "ds_test" "ds_poll_monitor_server" "ds_poll_monitor_gui")
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