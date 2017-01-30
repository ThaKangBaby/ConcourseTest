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
jekyll --version
touch ../integration/results.txt
jekyll build --source Praqma.com --destination ../integration > ../integration/results.txt
cat ../integration/results.txt

if [ $? -eq 0 ]; then

    #On test success
    #Push master to origin
    git push origin master
    ls -la ../integration

fi


#Do this no matter outcome
#Delete the ready branch
git branch -dr $readybranch

#git push origin :$readybranch

git fetch --prune
