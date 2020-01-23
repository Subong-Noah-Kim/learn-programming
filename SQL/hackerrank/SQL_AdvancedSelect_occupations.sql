/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT Doctor, Professor, Singer, Actor
FROM (select name, occupation, row_number() over (partition by occupation order by name) as num from OCCUPATIONS)
PIVOT (
  max(name)
  FOR OCCUPATION
   IN ('Doctor' as doctor, 'Professor' as professor, 'Singer' as singer, 'Actor' as actor)
)
order by Doctor, Professor, Singer, Actor
;