def solution(prices):
    ans = [0] * len(prices)  # ans = [] 하고, 정수 초기화하여 append() 하는 것보다 빠름
    for i in range(len(prices)):
        for j in range(i+1,len(prices)):
            ans[i] += 1
            if prices[i] > prices[j]: # 불필요한 if문을 사용하지 않으면 빠름
                break
    return ans
