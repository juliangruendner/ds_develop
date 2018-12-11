#!/bin/bash

githubBase="git@github.com:juliangruendner/"
#mlServiceRepos=("ds_common" "ds_poll" "ds_queue" "datashield_docker" "ds_test" "ds_poll_monitor_server" "ds_poll_monitor_gui")
mlServiceRepos=("ds_test")
baseDir=$(pwd)

for repoName in ${mlServiceRepos[@]}

do
  curRepo="$baseDir/$repoName"
  cd $curRepo
  if [[ $1 ]]; then
      printf "tag $1 specified, switching to tag $1 for repo $curRepo for installation... \n"
      branchInList=$(git branch | grep $1)
      if [ "$branchInList" == "" ]; then
        echo "reached inside for repo $curRepo"
        git checkout tags/$1 -b $1
      fi
      git checkout $1
  else
      printf "switching to master as no tag specified for repo $curRepo for installation ... \n"
      git checkout master
  fi
done

cd $baseDir

if [[ $1 ]]; then
  printf "tag $1 specified, switching to tag $1 for repo $curRepo for installation... \n"
  branchInList=$(git branch | grep $1)
  if [[ "$branchInList" == "" ]]; then
    git checkout tags/$1 -b $1
  fi
  git checkout $1
else
  printf "switching to master as no tag specified for repo $curRepo for installation ... \n"
  git checkout master
fi
