/* 윈도우함수를 이용해 select 절에서는 얼마든지 여러번의 aggregation functions를 사용할 수 있지만, having 절에서 결과를 요약하고자 할 때
   오라클 내에서 그룹 함수를 적용가능한 최대의 깊이가 있다는 오류를 보일 수 있음. 
   - ORA-00935: group function is nested too deeply */ 

select hacker_id, name, cnt_c 
from (select h.hacker_id, h.name
                 , count(c.challenge_id) as cnt_c -- 생성한 문제의 개수
                 , count(count(c.challenge_id)) over (partition by count(c.challenge_id)) as dup_cnt_c -- 문제 개수에 따른 중복 수 
                 , max(count(c.challenge_id)) over () as max_cnt_c  -- 문제 개수의 최대값
        from Hackers h left join Challenges c on h.hacker_id = c.hacker_id 
        group by h.hacker_id, h.name
       ) 
where cnt_c = max_cnt_c -- 최대값은 중복이어도 모두 출력
     or dup_cnt_c = 1 -- 최대값이 아닌 경우는 중복이 없는 케이스만 출력
order by cnt_c desc, hacker_id 
;