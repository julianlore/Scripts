#!/usr/bin/env bash
gsmerge="gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite"
if [ ! $# -eq 1 ] # Not 1 arg
then
    echo "Not enough arguments."
    echo "Example usage: Blank2ndPages.sh pdffile.pdf"
elif [ ! -d temppdf ] # If Directory temppdf doesn't exist
then
    mkdir temppdf
    convert xc:none -page Letter temppdf/blank.pdf # Creates a blank pdf
    pdfseparate "$1" temppdf/t%d.pdf # Separates each page as t1.pdf, t2.pdf...
    cd temppdf
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=atemp.pdf t1.pdf blank.pdf
    rm t1.pdf
    for file in t*.pdf
    do
	gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=atemp1.pdf atemp.pdf "$file" 
	rm atemp.pdf
	gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=atemp.pdf atemp1.pdf blank.pdf
	rm atemp1.pdf
    done
    mv atemp.pdf ../"blanked_$1"
    cd ..
    rm -rf temppdf
else echo "The directory temppdf already exists, please delete/rename it and try again."
fi
