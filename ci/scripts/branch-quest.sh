#!/bin/bash

set -e # fail fast
set -x # print commands

cd /
ls -la
# #
ls -la etc/ssh
ls -la home/
ls -la root/
# #
# ssh-keyscan github.com >> ~/.ssh/known_hosts


ls
cd integration
git clone ssh://git@github.com/ThaKangBaby/ConcourseTest.git
ls
cd ConcourseTest

git branch -r

for remote in `git branch -r`
do
if [[ "$remote" == *"origin/ready/"* ]]
then
  echo $remote>ready_branch;
  #cat ready_branch;
fi
done

# git config --global user.email "thakangbaby@gmail.com"
# git config --global user.name "Sonny Singh"
#
git config --global user.email "thakangbaby@gmail.com"
git config --global user.name "ThaKangBaby"

readybranch=$(cat ready_branch)
readybranch2="${readybranch:7}"
echo "$readybranch2"

#git remote rm origin
#git remote add origin https://ThaKangBaby:a3527b952368fb2183e02faf2c8dff64874fe0c0@github.com/ThaKangBaby/ConcourseTest.git

#git checkout -b $readybranch
git checkout master

git merge --squash $readybranch
git commit -m $readybranch

git push ssh://git@github.com/ThaKangBaby/ConcourseTest.git $readybranch:master
#
#
#
# git push origin/master HEAD:$(cat ready_branch)
#git push $TARGET_REPO :$TRAVIS_BRANCH
