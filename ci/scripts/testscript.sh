#!/bin/bash

cd Fullrepo

ls

#git fetch

#git branch ready

git checkout ready

#git fetch --all #origin/ready

ls ci/

git merge ready -m "Testing merge"

echo "TEST SCRIPT RUNNING!!!!"

git branch

echo "Git branch ran"

git status

echo "Git status ran"
