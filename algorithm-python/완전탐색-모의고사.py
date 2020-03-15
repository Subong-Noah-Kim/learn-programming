def solution(answers):
    n = len(answers)
    p1 = [1,2,3,4,5]
    p2 = [2,1,2,3,2,4,2,5]
    p3 = [3,3,1,1,2,2,4,4,5,5]
    
    ans1 = 0
    ans2 = 0
    ans3 = 0
    answer = []
    
    for i in range(n):
        if answers[i] == p1[i%len(p1)]:
            ans1 = ans1 + 1
        if answers[i] == p2[i%len(p2)]:
            ans2 = ans2 + 1
        if answers[i] == p3[i%len(p3)]:
            ans3 = ans3 + 1
    score = [ans1, ans2, ans3]
    for i in range(len(score)):
        if score[i] == max(score):
            answer.append(i+1)
    answer.sort()
    return answer
