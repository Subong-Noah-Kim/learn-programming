

# 해시 문제 파이썬


프로그래머스 문항 중 [해시] - [완주하지 못한 선수] 문항은 단순히 이중포문으로 해결하려고 하면 시간복잡도 문제로 오답처리된다.
이를 해결하기 위해 participant, completion을 모두 사전 정렬 후, 비교하는 방법을 채택한다.

```python
def solution(participant, completion):
    participant.sort()
    completion.sort()
    for p, c in zip(participant, completion):
        if p != c:
            return p
    return participant[-1]
```

zip()은 파이썬 내장함수로 2개의 배열에서 대응되는 원소끼리 짝지어 새로운 배열을 생성해준다.

번외로 모범답안을 보면 collections.Counter() 클래스를 사용했다.
결과값은 dictionary 형태이다. 객체와 개수를 담고 있고, 클래스간 뺴기연산이 가능하다.
그래서 동명이인을 감안하더라도 남는 단 하나의 객체가 완주하지 못한 선수임을 확인 가능하다.

```python
import collections


def solution(participant, completion):
    answer = collections.Counter(participant) - collections.Counter(completion)
    return list(answer.keys())[0]
```
