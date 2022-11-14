-- https://leetcode.com/problems/exchange-seats/


select 
Case
    When id%2 = 1 and id != (select count(id) from seat) then id+1
    When id%2 = 0 then id-1
    ELSE id
END as id, student
from seat 
order by id
