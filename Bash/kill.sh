#!/usr/bin/env bash
# echo [${1:0:1}]${1:1} This is how you can parse a string to put the first letter in a square bracket
# We want the first letter of grep to be in brackets such that it does not kill itself
# Example taken from: https://stackoverflow.com/questions/3510673/find-and-kill-a-process-in-one-line-using-bash-and-regex
# kill $(ps aux | grep '[p]ython csp_build.py' | awk '{print $2}')
if [ ! $# -eq 1 ]
then
	echo "Not the right amount of arguments."
	echo "Example usage: kill.sh word_to_search_for_in_process_name"
else
	# Adding [], but if input does not have [] this will also kill the script
	kill $(ps aux | grep "[${1:0:1}]${1:1}" | awk '{print $2}')
	# Assuming brackets are already there
	# kill $(ps aux | grep "$1" | awk '{print $2}')
fi
