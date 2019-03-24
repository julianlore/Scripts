#!/usr/bin/env bash
if [ $# -lt 2 ]
then
    echo "Not enough arguments"
    echo "Usage: gen.sh lang source_file_name"
    echo "Example: gen.sh bash new_script.sh"
else
    template_dir="`dirname "$0"`/Template"
    case ${1^^} in
	"BASH")
	    cp "$template_dir/script.sh" $2
	    ;;
	"BASH_ARG")
	    cp "$template_dir/script_arg.sh" $2
	    ;;
	"MAKE")
	    cp "$template_dir/Makefile" $2
	    ;;
	"PYTHON")
	    cp "$template_dir/template.py" $2
	    ;;
        "MATLAB")
            cp "$template_dir/funcname.m" $2
            file=$(basename -- "$2")
            noext="${file%.*}"
            sed -i -e "s/funcname/$noext/g" $2 # Replace occurrences of function with filename
            ;;
	*)
	    echo "No templates for source language $1"
    esac
fi
