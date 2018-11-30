#!/bin/bash -e

git checkout master
git branch -D test
commits=$(git log --reverse --pretty=format:"%H")
read -a arr <<< $commits
git checkout -b test
git reset --hard ${arr[$1]}

#for commit in commits
#do
#    echo $commit
#done
