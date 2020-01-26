select distinct f1.x as x1, f1.y as y1 -- 하나의 결과씩 출력하기 위해 중복을 제거
from Functions f1 
  inner join (
                 select x,y from Functions group by x, y 
                 having not(x=y and count(*)=1) -- x==y이면 중복여부 확인이 불가해, 동일한 경우 미리 개수를 체크
                ) f2 on f1.x = f2.y and f1.y=f2.x 
where f1.x <= f1.y -- x가 y보다 크거나 같은 케이스만 출력
order by x1;