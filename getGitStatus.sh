#!/bin/bash
repos=("ds_common" "ds_poll" "ds_queue" "datashield_docker" "ds_test" "ds_poll_monitor_server" "ds_poll_monitor_gui")
baseDir=$(pwd)

printf "****Status base repository****\n"
git status

for repoName in ${repos[@]}
do
  printf "**** Status repository $repoName:**** \n" 
  cd $repoName
  git status
  cd ..
done