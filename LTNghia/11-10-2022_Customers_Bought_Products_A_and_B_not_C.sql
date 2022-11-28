-- https://leetcode.com/problems/customers-who-bought-products-a-and-b-but-not-c/


select c.customer_id, c.customer_name
from Customers as c
where 
c.customer_id in (select customer_id from Orders where product_name = "A") 
and c.customer_id IN (select customer_id from Orders where product_name = "B")
and c.customer_id not in (select customer_id from Orders where product_name = "C");