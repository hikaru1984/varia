import math
import os
import random
import re
import sys

# Solution for: https://www.hackerrank.com/challenges/sherlock-and-valid-string/problem

# Complete the isValid function below.
def isValid(s):
    letters = []
    occurences = []
    for c in s:
        found = False
        for i in range(len(letters)):
            if(c in letters[i]):
                letters[i] += c
                occurences[i] += 1
                found = True
        if(not found):
            letters.append(c)
            occurences.append(1)
    maxVal = max(occurences)
    countMax = 0
    countSubMax = 0
    countOne = 0
    for e in occurences:
        if(e == maxVal):
            countMax += 1
        if(e == maxVal - 1):
            countSubMax += 1
        if(e == 1):
            countOne += 1
    if(countMax == len(occurences)):
        return("YES")
    if(countOne == 1 and countMax == len(occurences) - 1):
        return("YES")
    if(countMax == 1 and countSubMax == len(occurences) - 1):
        return("YES")
    return("NO")

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = input()

    result = isValid(s)

    fptr.write(result + '\n')

    fptr.close()

