#!/bin/bash

set -e # fail fast
set -x # print commands

findReadyBranches(){
    return $(git branch -r --list "origin/ready/*" | tail -1 | sed "s/^[ \t]*//")
}

cd CheckingBranches
readybranch=$(findReadyBranches)

echo $readybranch

if [ "$readybranch" ]; then
    echo "exit 0 - Ready Branch found!"
    exit 0
else
    echo "exit 1 - No Ready Branches found"
    exit 1
fi
