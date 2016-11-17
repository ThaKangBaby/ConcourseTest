#!/bin/bash

mkdir gitrepo

cd gitrepo

git clone https://github.com/ThaKangBaby/ConcourseTest.git

ls

cd ConcourseTest

git config --global push.default simple

git branch

git checkout master

git branch

git remote -v

git checkout ready

git branch

git checkout master

git config user.email "thakangbaby@gmail.com"
git config user.name "thakangbaby"

git remote set-url origin https://thakangbaby:testtest1@github.com/thakangbaby/ConcourseTest.git

git merge ready -m "Trying to merge with script"

git push

git status
