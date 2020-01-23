# -*- coding: utf-8 -*-
"""
Created on Mon Jan 13 22:03:49 2020

@author: ksb
"""

# 브루트포스(brute force) : 무식한 힘
# 모든 영역을 탐색하는 방법으로 가장 근본적인 방법이다.
  # 1) 주어진 문제를 선형구조로 구조화
  # 2) 구조화된 문제공간을 적절한 방법으로 해를 구성할때까지 탐색
  # 3) 구성된 해를 정리

a = list(map(int,input().split(' ')))
b = list(map(int,input().split(' ')))
c = []

for i in range(len(b)):
    for j in range(len(b)):
        if j == i:
            break
        for k in range(len(b)):
            if k == i:
                break
            elif k == j:
                break
            c.append(b[i]+b[j]+b[k])
ccc = []
for cc in c:
    if cc <= a[1]:
        ccc.append(cc)
print(max(ccc))