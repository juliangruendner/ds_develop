#!/bin/bash
repos=("ds_common" "ds_poll" "ds_queue" "ds_opal" "ds_test" "ds_poll_monitor_server" "ds_poll_monitor_gui" "ds_rstudio")
baseDir=$(pwd)

printf "\n\n****Status base repository****\n\n"
git status

for repoName in ${repos[@]}
do
  printf "\n************************************************\n Status repository $repoName:\n************************************************\n" 
  cd $repoName
  git status
  cd ..
done