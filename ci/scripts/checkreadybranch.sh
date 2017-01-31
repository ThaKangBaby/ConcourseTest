#!/bin/bash

set -e # fail fast
set -x # print commands

#Create a file for on_success use to send with email
#touch /integration/success.txt
echo "TEST successfully completed" >> /integration/success.txt

#Create a file for on_failure use to send with email


#Git clone website
giturl=Praqma.com.git
org=Praqma
name=ThaKangBaby
cd integration
git clone https://${name}:${token}@github.com/${name}/${giturl}

cd Praqma.com

#Check for ready branches
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

#Starting PIP
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

#Starting jekyll build test
jekyll --version
touch /results.txt
mkdir /release
jekyll build --source Praqma.com --destination release > results.txt
echo ----------
cat results.txt

#If no errors so far then Git push master to origin
if [ $? -eq 0 ]; then

    #On test success
    #Push master to origin
    cd Praqma.com
    git push origin gh-pages

fi

#Do this no matter outcome
#Delete the remote ready branch
git push origin :$readybranch2
git fetch --prune
