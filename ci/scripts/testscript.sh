#!/bin/bash

cd Fullrepo

ls
git checkout ready
git checkout master

git merge ready -m "Testing merge"

echo "TEST SCRIPT RUNNING!!!!"

git branch

echo "Git branch ran"

git status

echo "Git status ran"
