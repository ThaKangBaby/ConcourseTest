#!/bin/sh

set -e # fail fast
set -x # print commands

ls
cd integration
git clone https://github.com/ThaKangBaby/ConcourseTest.git
ls


for remote in `git branch -r`
do
if [[ $remote == *"origin/ready/"* ]]
then
  echo $remote>ready_branch;
fi
done
