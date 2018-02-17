#!/usr/bin/env bash
# Script used to initialize a Python file with a main function
if [ ! $# -eq 1 ] # Not 1 arg
then
    echo "Not the right amount of arguments."
    echo "Example usage: PythonSkeleton.sh file.py"
else
    # Add .py extension if not specified
    if [[ ! "$1" == *".py" ]]
    then
		file="$1.py"
    else
		file="$1"
    fi
    echo "def main():
		 
if __name__ == \"__main__\":
 	main()" >> "$file"
fi
