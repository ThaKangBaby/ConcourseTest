#!/bin/bash

set -e # fail fast
set -x # print commands

ls
cd integration
git clone https://github.com/ThaKangBaby/ConcourseTest.git
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

git config --global user.email "thakangbaby@gmail.com"
git config --global user.name "Sonny Singh"

git checkout master

git merge --squash $(cat ready_branch)
git commit -m $(cat ready_branch) --author ConcourseCI



#git push $TARGET_REPO HEAD:$TARGET_BRANCH
#git push $TARGET_REPO :$TRAVIS_BRANCH
