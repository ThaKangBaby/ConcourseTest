#!/bin/bash

mkdir gitrepo

cd gitrepo

git clone https://github.com/ThaKangBaby/ConcourseTest.git

ls

cd ConcourseTest

git branch

git checkout master

git branch

git remote -v

git checkout ready

git branch

git checkout master

git config user.email "thakangbaby@gmail.com"
git config user.name "thakangbaby"

git remote set-url origin git@github.com:ThaKangBaby/ConcourseTest.git

git merge ready -m "Trying to merge with script"

git push

git status
