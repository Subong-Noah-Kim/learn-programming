/* 잘 해결되지 않은 이유
  1. View_Stats 테이블과 Submission_Stats 테이블을 challenge_id로 조인하는 과정에서 불필요한 중복이 발생 -> 조인 이전에 집계하여 처리
  2. 모든 점수가 0점 일 때, 제외하는 조건은 contest_id 기준이므로 having 단계에서 적용, where에서 적용 시 challenge_id 단계에서 적용되어 결과가 다를 수 있음에 유의
*/

select t1.contest_id, t1.hacker_id, t1.name, sum(total_submissions) as sts, sum(total_accepted_submissions) as tas, sum(total_views) as tv, sum(total_unique_views) as tuv
from Contests t1
  left join Colleges t2 on t1.contest_id = t2.contest_id
  left join Challenges t3 on t2.college_id = t3.college_id
  left join (select challenge_id, sum(total_views) as total_views, sum(total_unique_views) as total_unique_views from View_Stats group by challenge_id) t4 on t3.challenge_id = t4.challenge_id
  left join (select challenge_id, sum(total_submissions) as total_submissions, sum(total_accepted_submissions) as total_accepted_submissions from Submission_Stats group by challenge_id) t5 on t3.challenge_id = t5.challenge_id
group by t1.contest_id, t1.hacker_id, t1.name
having sum(total_submissions) + sum(total_accepted_submissions) + sum(total_views) +  sum(total_unique_views) > 0
order by t1.contest_id ;