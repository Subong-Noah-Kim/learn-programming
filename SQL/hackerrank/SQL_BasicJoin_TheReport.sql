/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT case when b.GRADE >= 8 then a.name else null end, b.grade, a.MARKs FROM Students a left join Grades b on a.marks between b.min_mark and b.max_mark order by b.grade desc, a.name ;