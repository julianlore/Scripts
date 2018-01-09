#!/usr/bin/env bash
# This script is used to generate a LaTeX file formatted the way I usually format my documents and including packages. Alternative to copying a header from an old assignment and slightly more automated than using a custom class.
if [ ! $# -eq 1 ] # Not 1 arg
then
    echo "Not the right amount of arguments."
    echo "Example usage: AssignmentSkeleton.sh file.tex"
else
    # Add .tex extension if not specified
    if [[ ! "$1" == *".tex" ]]
    then
	file="$1.tex"
    else
	file="$1"
    fi
    echo "Course code:"
    read cc
    echo "Title:"
    read title
    echo "Name:"
    read name
    echo "ID:"
    read id
    echo "\documentclass[12pt]{article}
\usepackage[margin=1 in,headheight=20pt]{geometry}
\usepackage{fancyhdr, setspace, amsmath, amsthm, amssymb, tabularx}
\usepackage[dvipsnames]{xcolor}
\usepackage{tikz}
\usetikzlibrary{positioning,chains,fit,shapes,calc,arrows.meta,matrix}
\usepackage{enumerate, lastpage, pdfpages, algpseudocode}
\allowdisplaybreaks

\theoremstyle{definition}
\newtheorem{problem}{Problem} 
	 
\theoremstyle{definition} 
\newtheorem*{solution}{Solution} 

\theoremstyle{theorem}
\newtheorem*{lemm}{Lemma}
	 
%New command \mybox to box something
\newcommand{\mybox}{%
\collectbox{%
	\setlength{\fboxsep}{3pt}%
	\fbox{\BOXCONTENT}%
	}%
}
\pagestyle{fancy}
\lhead{$cc}
\chead{$title}
\rhead{\today
	\\\\ID: $id
	\\\\ $name}
\cfoot{Page \thepage \ of \pageref{LastPage}}
\begin{document}
\onehalfspacing
\end{document}" >> "$file"
fi
