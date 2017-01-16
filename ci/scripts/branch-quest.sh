#!/bin/bash

set -e # fail fast
set -x # print commands


ls -la ~

git clone https://github.com/ThaKangBaby/ConcourseTest.git integration

cd integration


git branch -r

# for remote in `git branch -r`
# do
# if [[ "$remote" == *"origin/ready/"* ]]
# then
#   echo $remote>ready_branch;
#   #cat ready_branch;
# fi
# done

git config --global user.email "thakangbaby@gmail.com"
git config --global user.name "ThaKangBaby"

readybranch=$(readybranch=$(git branch -r --list "origin/ready/*" | tail -1 | sed "s/^[ \t]*//"))

git checkout $readybranch

git pull --rebase master

TEST

git checkout master

git merge --squash $readybranch

#git commit -m "Master merged into ready"

# git push origin/master HEAD:$(cat ready_branch)
#git push $TARGET_REPO :$TRAVIS_BRANCH
