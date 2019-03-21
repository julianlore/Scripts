#!/usr/bin/env bash
# Script to run latexindent and replace current file

if [ $# -lt 1 ]
then
	echo "Not enough arguments"
	echo "Example usage: texind.sh texfile.tex"
else
    TEMP="$1.latexindent_temp.temp"
    latexindent "$1" > "$TEMP"
    rm -f indent.log # Remove latexindent log
    mv "$TEMP" "$1" # Overwrite original file
fi
