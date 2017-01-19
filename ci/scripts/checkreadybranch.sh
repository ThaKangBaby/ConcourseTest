#!/bin/bash

set -e # fail fast
set -x # print commands

# echo "-----------------"
# env
# echo "-----------------"

giturl=Praqma.com.git
org=Praqma
token=289c8504e59a858cfdaba8bd808f70f6702ade74
name=ThaKangBaby
git clone https://${org}:${token}@github.com/${org}/${giturl} integration

#git clone Praqma.com integration
# mkdir -p ~/.ssh
# echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
# chmod 777 ~/.ssh/config
#
# #ok
# echo -e "{{$private_key}}" > ~/.ssh/key.pem
# chmod 777 ~/.ssh/key.pem
# ssh-agent $(ssh-add key.pem; git clone git@github.com:ThaKangBaby/praqma.com.git)


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
