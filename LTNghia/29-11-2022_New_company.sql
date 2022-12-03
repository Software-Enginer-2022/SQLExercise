-- https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true

select c.company_code, c.founder, 
count(distinct(e.lead_manager_code)), 
count(distinct(e.senior_manager_code)),
count(distinct(e.manager_code)),
count(distinct(e.employee_code)) 
from Company as c 
left join Employee as e 
on c.company_code = e.company_code
group by c.company_code, c.founder;
