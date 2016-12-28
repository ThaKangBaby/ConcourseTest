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

git remote rm origin
git remote add origin https://ThaKangBaby:a3527b952368fb2183e02faf2c8dff64874fe0c0@github.com/ThaKangBaby/ConcourseTest.git

git checkout master
#
git merge --squash $(cat ready_branch)
git commit -m $(cat ready_branch)

git push origin master:$(cat ready_branch)
#
#
#
# git push origin/master HEAD:$(cat ready_branch)
#git push $TARGET_REPO :$TRAVIS_BRANCH
