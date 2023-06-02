#!/bin/sh -l

echo "Repo Url $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT

sh -c "git config --global --add safe.directory '*'"
sh -c "git config --global credential.username $WVS_USERNAME"
sh -c "git config --global core.askPass /auth.sh"
sh -c "git config --global credential.helper cache"
sh -c "git remote add syncremote $1"
sh -c "git push --prune syncremote +refs/remotes/origin/*:refs/heads/* +refs/tags/*:refs/tags/*"