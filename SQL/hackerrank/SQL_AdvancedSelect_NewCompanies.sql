/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

select T1.company_code, T1.founder, T2.num_lm, t2.num_sm, t2.num_m, t2.num_e
from company T1 left join (
select company_code, count(distinct lead_manager_code) as num_lm, count(distinct senior_manager_code) as num_sm, count(distinct manager_code) as num_m, count(distinct employee_code) as num_e from employee group by company_code) T2
         on T1.company_code = T2.company_code
order by company_code        
;

