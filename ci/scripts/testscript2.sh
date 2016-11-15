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

git remote set-url origin https://thakangbaby:17smsj2115@github.com/thakangbaby/ConcourseTest.git
#thakangbaby@gmail.com:ThaKangBaby/ConcourseTest.git

git merge ready -m "Trying to merge with script"

git push #--repo https://thakangbaby:17smsj2115@github.com/thakangbaby/ConcourseTest.git

git status
