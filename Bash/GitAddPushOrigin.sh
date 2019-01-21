#!/usr/bin/env bash

# Script to add remote origin and then push to said remote, also setting upstream to that remote

if [ $# -lt 1 ]
then
	echo "Not enough arguments"
	echo "Example usage: GitAddPushOrigin.sh remote_origin"
else
	git remote add origin "$1"
	git push --set-upstream origin master
fi
