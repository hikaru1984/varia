#!/bin/python3

import sys

def triangle_line(n):
  if(n==1):
    result = [1]
  elif(n==2):
    result = [1,1]
  else:
    prev = triangle_line(n-1)
    result = []
    result.append(prev[0])
    for i in range(1, len(prev)):
      result.append(prev[i-1] + prev[i])
    result.append(1)
  return(result)

triangle_length = int(sys.argv[1])
for i in range(1, triangle_length):
  s = "%s" % triangle_line(i)
  print(s.center(4*triangle_length))
