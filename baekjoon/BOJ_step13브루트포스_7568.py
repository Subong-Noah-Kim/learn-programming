# -*- coding: utf-8 -*-
"""
Created on Mon Jan 13 22:48:33 2020

@author: ksb
"""

n = int(input())
a = [list(map(int,input().split(' '))) for i in range(n)]
b = []
for i in range(n):
    bb = 0
    for j in range(n):
        if i==j:
            pass
        elif a[i][0] < a[j][0] and a[i][1] < a[j][1]:
            bb += 1
    b.append(bb+1)

for i in range(len(b)):
    print(b[i], end=' ')
        