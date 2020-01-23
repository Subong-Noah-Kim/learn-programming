/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select b.id, a.age, a.min_coins_needed, a.power 
from (
        select b.age, min(a.coins_needed) as min_coins_needed, a.power, a.code 
        from Wands a 
          left join Wands_Property b on a.code = b.code 
        where b.is_evil = 0 
        group by b.age, a.power, a.code
        ) a 
  left join Wands b on a.code = b.code and a.min_coins_needed = b.coins_needed 
order by a.power desc, a.age desc;