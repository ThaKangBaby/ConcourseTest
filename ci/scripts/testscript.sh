#!/bin/bash

cd Fullrepo

ls

git fetch origin ready

#git branch ready
#git remote add upstr

git checkout ready

echo "Timi wants to see"

#git fetch --all #origin/ready

ls ci/

git merge ready -m "Testing merge"

echo "TEST SCRIPT RUNNING!!!!"

git branch

echo "Git branch ran"

git status

echo "Git status ran"
