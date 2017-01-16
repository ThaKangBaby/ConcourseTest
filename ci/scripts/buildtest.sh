#!/bin/bash

set -e # fail fast
set -x # print commands

ls -la

#git clone https://github.com/ThaKangBaby/ConcourseTest.git integration

#Checking for readybranch
cd CheckingBranches
readybranch=$(readybranch=$(git branch -r --list "origin/ready/*" | tail -1 | sed "s/^[ \t]*//"))

if [ $readybranch != "" ]
    then exit 0;
else
    exit 1;
fi

git checkout $readybranch

git pull --rebase master

git checkout master

git merge --squash $readybranch

#TEST - Jekyll build TEST
jekyll build --source Praqma.com --destination integration

#On test success
Push master to origin

#Do this no matter outcome
Delete the ready branch remotely
git fetch --prune

#if [ $readybranch != "" ]

ls -la integration
