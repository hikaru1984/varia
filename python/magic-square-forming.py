#!/bin/python3
#Solution for: https://www.hackerrank.com/challenges/magic-square-forming/problem

import math
import os
import random
import re
import sys

# Complete the formingMagicSquare function below.
def rotate(s):
    r = []
    for i in range(3):
        r.append([])
        for j in range(3):
            r[i].append(s[2 - j][i])
    return(r)

def mirror(s):
    return([s[2], s[1], s[0]])

def magicSquare():
    r = [[8, 3, 4], [1, 5, 9], [6, 7, 2]]
    for i in range(9):
        if(i == 5):
            r = mirror(r)
        yield(r)
        r = rotate(r)

def sumAll(s):
    r = 0
    for i in range(3):
        for j in range(3):
            r += s[i][j]
    return(r) 

def formingMagicSquare(s):
    listOfSums = []
    for m in magicSquare():
        differences = []
        for i in range(3):
            differences.append([])
            for j in range(3):
                differences[i].append(abs(m[i][j] - s[i][j]))
        listOfSums.append(sumAll(differences))
    return(min(listOfSums))


if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = []

    for _ in range(3):
        s.append(list(map(int, input().rstrip().split())))

    result = formingMagicSquare(s)

    fptr.write(str(result) + '\n')

    fptr.close()

