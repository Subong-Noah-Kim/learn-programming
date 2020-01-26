/*
  1. 누적 submission 학생구하기
    -> 1) 날짜+학생id로 distinct (인라인뷰)
       2) 분석함수 - 누적합
         - 단, partition by와 order by 대상을 잘 구분해야 함.
         - 학생별 날짜 증가에 따른 누적합을 구할 것이기 때문에 아래와 같이 입력
           (1) partition by : hacker_id
           (2) order by : submission_date
       3) 일자별 누적합 값 비교
*/
select t1.submission_date, t1.u_id, t2.min_hid, t2.name 
from (select submission_date, sum(case when act_csctv_d = csctv_d then 1 else 0 end) as u_id 
      from (select submission_date, hacker_id
                   , sum(1) over (partition by hacker_id order by submission_date) as act_csctv_d
                   , to_number(submission_date - to_date('2016-03-01')+1) as csctv_d 
            from (select distinct submission_date, hacker_id from Submissions)
           ) 
      group by submission_date
     ) t1 
  left join ( -- 일별 submissions를 최대로 제출한 hacker_id 및 name 찾기 
      select s.submission_date, s.min_hid, h.name 
      from (select submission_date, min(hacker_id) as min_hid -- 동일하게 max라면 hacker_id의 min 출력
            from (select submission_date ,hacker_id, count(*) as cnt 
                  from Submissions group by submission_date ,hacker_id) 
            where (submission_date, cnt) in (select submission_date, max(cnt) -- 일자, 개수를 기준으로 동일일자에 최고로 submission이 많은 케이스만 불러옴. 행에 컬럼데이터는 hacker_id까지 있지만, 조회 조건에서는 빼주어야 함.
                                             from (select submission_date ,hacker_id
                                                          , count(*) as cnt 
                                                   from Submissions 
                                                   group by submission_date ,hacker_id) 
                                             group by submission_date) 
            group by submission_date) s 
        left join Hackers h on s.min_hid = h.hacker_id -- name을 가져오기 위한 join
  ) t2 
  on t1.submission_date = t2.submission_date 
order by t1.submission_date ;
