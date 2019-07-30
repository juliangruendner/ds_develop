#!/bin/bash

# specify your tagname, and description below
TAGNAME='v0.6.0'
DESCRIPTION='second proper release'

repos=("ds_common" "ds_poll" "ds_queue" "ds_opal" "ds_test" "ds_poll_monitor_server" "ds_poll_monitor_gui" "ds_rstudio")
baseDir=$(pwd)

printf "****versioning base repository****\n"
git tag -a $TAGNAME -m "$DESCRIPTION"
git push origin $TAGNAME

for repoName in ${repos[@]}
do
  printf "**** Tagging repository $repoName **** \n" 
  cd $repoName
  git tag -af $TAGNAME -m "$DESCRIPTION"
  git push -f origin $TAGNAME
  #git tag -d $TAGNAME
  cd ..
done