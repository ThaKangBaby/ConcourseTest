#!/bin/sh

set -e # fail fast
set -x # print commands

ls
cd integration
ls
cd ConcourseTest
git status

cat ready_branch

git config --global user.email "thakangbaby@gmail.com"
git config --global user.name "thakangbaby"

git checkout master

#git merge $(cat ready_branch)

git merge --squash $(cat ready_branch)
git commit -m $(cat ready_branch)


git push origin/master HEAD:$(cat ready_branch)

# git clone repository integration
# cd integration
# ls
# echo "hello"
# git checkout `cat ready_branch`
# echo "success!"
# git status
