# -*- coding: utf-8 -*-
"""
Created on Mon Jan 13 22:57:18 2020

@author: ksb
"""
# https://www.acmicpc.net/problem/1018
# 체스판 다시 칠하기
n,m = list(map(int,input().split(' ')))
b = [input() for i in range(n)]
answer = []
for I in range(n-7):
    for J in range(m-7):
        ans1 = 0
        ans2 = 0
        for i in range(8):
            for j in range(8):
                if (i+j) % 2 == 0 and b[I+i][J+j] != 'W':
                    ans1 += 1
                elif (i+j) % 2 != 0 and b[I+i][J+j] == 'W':
                    ans1 += 1
                if (i+j) % 2 == 0 and b[I+i][J+j] != 'B':
                    ans2 += 1
                elif (i+j) % 2 != 0 and b[I+i][J+j] == 'B':
                    ans2 += 1                    
        answer.append(ans1)
        answer.append(ans2)
# print(answer)
print(min(answer))