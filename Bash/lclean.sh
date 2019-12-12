#!/usr/bin/env bash
find . -name "*.tex"
if [ $# -ge 1 ] && [ ${1^^} == "D" ]
then
    find . -name "*.tex" -exec bash -c 'base="${1%.tex}"; rm -f $base.out $base.aux $base.synctex.gz $base.log' _ {} \;
else
    echo "Usage: ./lclean.sh [D]"
    echo "The D flag deletes all the .out, .aux, .synctex.gz and .log files matching the same name."
fi
