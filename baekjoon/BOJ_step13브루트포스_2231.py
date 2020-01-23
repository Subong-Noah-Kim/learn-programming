# -*- coding: utf-8 -*-
"""
Created on Mon Jan 13 22:36:14 2020

@author: ksb
"""

n = int(input())

b = []
for i in range(n):
    a = str(i)
    b = []
    for j in range(len(a)):
        b.append(int(a[j]))
    if i + sum(b) == n:
        print(i)
        break
if i == n-1:
    print(0)


    


