#!/bin/sh

set -e # fail fast
set -x # print commands

git clone repository ConcourseTest
cd integration


for remote in `git branch -r`
do
if [[ $remote == *"origin/ready/"* ]]
then
  echo $remote>ready_branch;
fi
done
