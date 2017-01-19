#!/bin/bash

set -e # fail fast
set -x # print commands

echo "-----------------"
env
echo "-----------------"

ls -la /tmp/build

git clone Praqma.com integration

#new --------------------------------------------
cd integration

readybranch=$(git branch -r --list "origin/ready/*" | tail -1 | sed "s/^[ \t]*//")
readybranch2=${readybranch#*/}
echo -----readyBranch------
echo $readybranch2

if [ "$readybranch2" ]; then
    echo "exit 0 - Ready Branch found!"

else
    echo "exit 1 - No Ready Branches found"
    exit 1
fi

git checkout $readybranch2

echo -----------
echo PULL
git pull --rebase master

echo -----------
echo CHECKOUT_MASTER
git checkout master

echo -----------
echo SQUASH
git merge --squash $readybranch

# jekyll --version
# touch ../integration/results.txt
# jekyll build --source Praqma.com --destination ../integration > ../integration/results.txt
# cat ../integration/results.txt
