#!/bin/python3
# Solution for: https://www.hackerrank.com/challenges/absolute-permutation/problem

def absolutePermutation(n, k):
    pre = list(range(1, n+1))
    pos = []
    if(k == 0):
        return(pre)
    f = n / k
    d = n % k
    if(d != 0 or f % 2 != 0):
        return([-1])
    c = 1
    for e in pre:
        v = e + (c * k)
        if(e % k == 0):
            c = -c
        pos.append(v)
    return(pos)
