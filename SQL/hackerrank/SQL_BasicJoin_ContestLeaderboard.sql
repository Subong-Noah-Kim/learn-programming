select h.hacker_id, h.name, sum(max_scr) as tsh
from Hackers h
  left join (select hacker_id, challenge_id, max(score) max_scr from Submissions group by hacker_id, challenge_id) s
          on h.hacker_id = s.hacker_id
group by h.hacker_id, h.name
having sum(max_scr) > 0 
order by tsh desc, h.hacker_id ;
