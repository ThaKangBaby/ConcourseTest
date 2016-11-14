#!/bin/bash

cd Fullrepo

ls
git fetch

git branch localready

git checkout localready origin/ready

git merge ready -m "Testing merge"

echo "TEST SCRIPT RUNNING!!!!"

git branch

echo "Git branch ran"

git status

echo "Git status ran"
