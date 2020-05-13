#!/usr/bin/env bash

if [ $# -lt 1 ]
then
	echo "Not enough arguments"
	echo "Example usage: script.sh arg"
else
	case ${1^^} in
		"WORD")
			echo "Do something"
			;;
		*)
			echo "$1 not a valid option"
	esac
fi
