#!/bin/bash

set -e # fail fast
set -x # print commands

# echo "-----------------"
# env
# echo "-----------------"

ls -la /tmp/build
echo $private_key > key.pem
pwd 

echo ~/.ssh/config
#git clone Praqma.com integration
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config
ssh-agent $(ssh-add key.pem; git clone git@github.com:ThaKangBaby/praqma.com.git)
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
