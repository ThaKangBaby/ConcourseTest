#!/bin/sh

set -e # fail fast
set -x # print commands

ls
cd integration
git clone https://github.com/ThaKangBaby/ConcourseTest.git
ls
cd ConcourseTest

git branch -r

if git branch -r | grep 'origin/ready/*' &> /dev/null; then
   echo $?
fi

# for remote in `git branch -r`
# do
# if [[ $remote == *"origin/ready/"* ]]
# then
#   echo $remote>ready_branch;
# fi
# done
