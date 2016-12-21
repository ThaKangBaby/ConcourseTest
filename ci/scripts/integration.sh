#!/bin/sh

set -e # fail fast
set -x # print commands

ls
cd integration
ls
git status

# git clone repository integration
# cd integration
# ls
# echo "hello"
# git checkout `cat ready_branch`
# echo "success!"
# git status
