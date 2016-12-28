#!/bin/bash

set -e # fail fast
set -x # print commands

ls
cd integration
git clone https://ThaKangBaby:a3527b952368fb2183e02faf2c8dff64874fe0c0@github.com/ThaKangBaby/ConcourseTest.git
ls
cd ConcourseTest

git branch -r

for remote in `git branch -r`
do
if [[ "$remote" == *"origin/ready/"* ]]
then
  echo $remote>ready_branch;
  #cat ready_branch;
fi
done

# git config --global user.email "thakangbaby@gmail.com"
# git config --global user.name "Sonny Singh"
#
git config --global user.email "thakangbaby@gmail.com"
git config --global user.name "ThaKangBaby"

readybranch=$(cat "ready_branch")
readybranch=${#*/readybranch}

git remote rm origin
git remote add origin https://ThaKangBaby:a3527b952368fb2183e02faf2c8dff64874fe0c0@github.com/ThaKangBaby/ConcourseTest.git

git checkout $readybranch
git checkout master

git merge --squash $readybranch
git commit -m $readybranch

git push origin $readybranch:master
#
#
#
# git push origin/master HEAD:$(cat ready_branch)
#git push $TARGET_REPO :$TRAVIS_BRANCH
