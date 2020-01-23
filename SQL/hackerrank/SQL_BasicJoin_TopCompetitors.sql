/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select a.hacker_id, a.name from Hackers a left join Submissions b on a.hacker_id = b.hacker_id left join Challenges c on c.challenge_id = b.challenge_id left join Difficulty d on c.difficulty_level = d.difficulty_level where b.score = d.score group by a.hacker_id, a.name having count(*) > 1 order by count(*) desc, a.hacker_id;