#!/usr/bin/env python
import sys
from fractions import Fraction
if (len(sys.argv) < 2):
    print("Give me an argument")
    print("Example usage: fraction_reducer.py 100/200")
elif "/" in sys.argv[1]:
    fr = sys.argv[1].split('/')
    print(Fraction(float(fr[0])/float(fr[1])).limit_denominator())
else:
    print(Fraction(float(sys.argv[1])).limit_denominator())
