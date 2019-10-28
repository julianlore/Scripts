#!/usr/bin/env bash
# Script to rename files by removing first n characters of the file name

if [ $# -lt 1 ]
then
    echo "Not enough arguments"
    echo "Example usage: shorten_name.sh n"
else
    for file in *
    do
        newfile=`echo $file | sed "s/\(.\{$1\}\)//"`
        cp "$file" "$newfile"
    done
fi
