/*
  본 답안은 Discussion의 의견을 참조하여 작성되었음.
  1. 시작, 종료일자에서 연속성을 파악해 그룹화 할 수 있는가?
    -> 단순 조인으로 쿼리화하려 하였으나 실패
       시작, 종료일자는 반드시 1일 이상 차이나기 때문에 종료일자는 없는 시작일자와 
       시작일자가 없는 종료일자의 두 테이블을 만들어 시작일자가 작은 케이스만 가져온다.
       
       이렇게 수행한다면 시작일자가 종료일자보다 작은 모든 케이스가 나오는데, 
       이 때 각 시작일자별 최소 종료일자를 출력하고 이 두 날짜의 차이를 구하면 된다.
*/

select start_date, min(end_date) 
from (select start_date from Projects where start_date not in (select end_date from Projects)) a, 
       (select end_date from Projects where end_date not in (select start_date from Projects)) b 
where a.start_date < b.end_date 
group by start_date 
order by min(end_date)-start_date, start_date
;