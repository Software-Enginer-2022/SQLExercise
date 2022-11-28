-- https://leetcode.com/problems/second-highest-salary/

with cte as (select salary, dense_rank () over(order by salary DESC) as salary_rank 
from Employee)
select ifnull((select distinct salary from cte where salary_rank = 2), null) as SecondHighestSalary;