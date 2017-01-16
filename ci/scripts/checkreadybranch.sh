cd CheckingBranches
readybranch=$(readybranch=$(git branch -r --list "origin/ready/*" | tail -1 | sed "s/^[ \t]*//"))

if [ $readybranch != "" ]
    then exit 0;
else
    exit 1;
fi
