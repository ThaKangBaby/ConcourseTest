#!/bin/bash

set -e # fail fast
set -x # print commands

# echo "-----------------"
# env
# echo "-----------------"

giturl=Praqma.com.git
org=Praqma
name=ThaKangBaby
cd integration
git clone https://${name}:${token}@github.com/${name}/${giturl}

cd Praqma.com

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

git checkout gh-pages

git checkout $readybranch2

echo -----------
echo PULL
git fetch
git branch -a
git pull --rebase origin gh-pages

echo -----------
echo CHECKOUT_MASTER
git checkout gh-pages

echo -----------
echo SQUASH
git merge --squash $readybranch

cd ..

jekyll --version
touch /results.txt
mkdir /release
jekyll build --source Praqma.com --destination release > results.txt
echo ----------
cat results.txt

if [ $? -eq 0 ]; then

    #On test success
    #Push master to origin
    git push origin master
    ls -la ../integration

fi


#Do this no matter outcome
#Delete the ready branch
git branch -dr $readybranch

#git push origin :$readybranch

git fetch --prune
