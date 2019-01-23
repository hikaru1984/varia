#!/bin/python3
#Solution for: https://www.hackerrank.com/challenges/matrix-rotation-algo/problem

import math
import os
import random
import re
import sys

def createRotationList(matrix, m, n, r):
    rotationList = []
    if(n == 0):
        rotationList = matrix
    else:
        for i in range(m):
            rotationList.append(matrix[0][i])
        for j in range(n):
            rotationList.append(matrix[j][m])
        for i in range(m):
            rotationList.append(matrix[n][m - i])
        for j in range(n):
            rotationList.append(matrix[n - j][0])
    listLength = 2 * (m + n)
    if(r > listLength):
        r = r % listLength
    for _ in range(r):
        rotationList.append(rotationList.pop(0))
    return(rotationList)

def createSubMatrix(matrix, m, n):
    r = []
    for j in range(1, n + 1):
        r.append([])
        for i in range(1, m + 1):
            r[j - 1].append(matrix[j][i])
    return(r)

def convertListToMatrixFrame(l, m, n):
    i = 0
    j = 0
    r = [[0 for _ in range(m + 1)] for _ in range(n + 1)]
    for k in range(m + n + 1):
        if(k <= m):
            r[j][i] = l[k]
            i += 1
        if(m < k <= m + n):
            r[j][i] = l[k]
            j += 1
        if(m < i):
            i -= 1
            j += 1
        if(n < j):
            j -=1
            i -= 1
    i = m - 1
    j = n
    for k in range(m + n + 1, len(l)):
        if(k <= 2 * m + n):
            r[j][i] = l[k]
            i -= 1
        if(i < 0):
            i += 1
            j -= 1
        if(2 * m + n < k < len(l)):
            r[j][i] = l[k]
            j -= 1
    return(r)

def mergeMatrix(frame, submatrix):
    for j in range(len(submatrix)):
        for i in range(len(submatrix[j])):
            frame[j + 1][i + 1] = submatrix[j][i]
    return(frame)

# Complete the matrixRotation function below.
def matrixRotation(matrix, r):
    m = len(matrix[0]) - 1
    n = len(matrix) - 1
    if(isinstance(matrix[0], int) and n == 0):
        return(matrix)
    rotList = createRotationList(matrix, m, n, r)
    if(m == 1 or n == 1):
        return(convertListToMatrixFrame(rotList, m, n))    
    subMatrix = createSubMatrix(matrix, m - 1, n - 1)
    rotSubMatrix = matrixRotation(subMatrix, r)
    matrixFrame = convertListToMatrixFrame(rotList, m, n)
    return(mergeMatrix(matrixFrame, rotSubMatrix))
    
def printMatrix(matrix):
    m = len(matrix[0]) - 1
    n = len(matrix) - 1
    for j in range(n + 1):
        for i in range(m + 1):
            if(i < m):
                print(matrix[j][i], end = " ")
            else:
                print(matrix[j][i])

if __name__ == '__main__':
    mnr = input().rstrip().split()

    m = int(mnr[0])

    n = int(mnr[1])

    r = int(mnr[2])

    matrix = []

    for _ in range(m):
        matrix.append(list(map(int, input().rstrip().split())))

    printMatrix(matrixRotation(matrix, r))
    

