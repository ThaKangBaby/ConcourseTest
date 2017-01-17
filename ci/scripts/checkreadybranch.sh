#!/bin/bash

set -e # fail fast
set -x # print commands
# echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
# cd CheckingBranches
# ls -la
# echo "-----------------"
# git config --local -l
# echo "-----------------"
# # git fetch -v
# echo "-----------------"
# git status
# echo "-----------------"
# git --version
# echo "-----------------"
# git branch -avv
# echo "-----------------"
# git branch -rv --list "origin/ready/*"


# readybranch=$(git branch -r --list "origin/ready/*" | tail -1 | sed "s/^[ \t]*//")

# echo $readybranch

git clone Praqma.com integration

#new --------------------------------------------
cd integration

readybranch=${$(git branch -r --list "origin/ready/*" | tail -1 | sed "s/^[ \t]*//")#*/}
echo -----readyBranch------
echo $readybranch

if [ "$readybranch" ]; then
    echo "exit 0 - Ready Branch found!"

else
    echo "exit 1 - No Ready Branches found"
    exit 1
fi

git checkout $readybranch

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
