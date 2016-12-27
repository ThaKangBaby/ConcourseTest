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
  cat ready_branch;
fi
done


git checkout master
git merges $(cat ready_branch)

#git push $TARGET_REPO HEAD:$TARGET_BRANCH
#git push $TARGET_REPO :$TRAVIS_BRANCH
