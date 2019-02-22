#!/usr/bin/env bash
# Prettify haskell with hindent and stylish-haskell
if [ $# -lt 1 ]
then
    echo "Not enough arguments"
    echo "Example usage: phaskell.sh filename"
else
    hlint --refactor --refactor-options="--inplace" $1
    hindent $1
    stylish-haskell -i $1
fi
