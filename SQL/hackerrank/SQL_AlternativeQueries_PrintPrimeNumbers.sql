select listagg(l1,'&') within group (order by l1)  
  -- list agg ~ within group (order by) 
  -- 행간 문자열 합치기                                                
from (select l1 
      from 
       (select level as l1 from dual where level > 1 connect by level <= 1000) a, -- 소수를 구하기 위한 기준
       (select level as l2 from dual where level > 1 connect by level <= 1000) b  -- 소수를 나누어서 검증하는 수
      where a.l1 >= b.l2 -- 기준보다 작은 나누는 수만 가져오기 위함
      group by l1 having sum(decode(mod(l1,l2),0,1,0)) = 1  -- 나누어서 나머지가 0인 것만 가져옴
      order by l1  -- 순서세팅
     )
;