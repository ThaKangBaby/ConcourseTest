#!/bin/bash

set -e # fail fast
set -x # print commands



cd CheckingBranches

readybranch=$(git branch -r --list "origin/ready/*" | tail -1 | sed "s/^[ \t]*//")

echo $readybranch

if [ "$(readybranch)" != "" ]
    then exit 0;
    echo "exit 0"
else
    exit 1;
    echo "exit 1"
fi
