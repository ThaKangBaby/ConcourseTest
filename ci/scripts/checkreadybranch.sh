#!/bin/bash

set -e # fail fast
set -x # print commands
# echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
cd CheckingBranches
ls -la
echo "-----------------"
git config --local -l
echo "-----------------"
git fetch -v
echo "-----------------"
git status
echo "-----------------"
git --version
echo "-----------------"
git branch -avv
echo "-----------------"
git branch -rv --list "origin/ready/*"


readybranch= $(git branch -r --list "origin/ready/*" | tail -1 | sed "s/^[ \t]*//")

echo $readybranch

if [ "$readybranch" ]; then
    echo "exit 0 - Ready Branch found!"
    exit 0
else
    echo "exit 1 - No Ready Branches found"
    exit 1
fi
