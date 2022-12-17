-- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/

select c.customer_number
from (select customer_number, count(customer_number) as counts
from Orders
group by customer_number
order by counts desc) as c
limit 1
