select s.name 
from Students s 
  left join Friends f on s.id = f.id 
  left join Packages ps on s.id = ps.id   
  left join Packages pf on f.friend_id = pf.id 
where ps.salary < pf.salary 
order by pf.salary ;