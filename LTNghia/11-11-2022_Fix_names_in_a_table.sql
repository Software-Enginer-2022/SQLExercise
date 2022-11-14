-- https://leetcode.com/problems/fix-names-in-a-table/

Select user_id, CONCAT(UPPER(SUBSTRING(name,1,1)),LOWER(SUBSTRING(name,2))) AS name 
from Users 
order by user_id asc;