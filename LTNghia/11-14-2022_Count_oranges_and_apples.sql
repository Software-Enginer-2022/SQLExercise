-- https://leetcode.com/problems/count-apples-and-oranges/

select sum(total.apple_b + total.apple_c) as apple_count, sum(total.orange_b + total.orange_c) as orange_count
from (select COALESCE(b.apple_count, 0) as apple_b, COALESCE(b.orange_count, 0) as orange_b, COALESCE(c.apple_count, 0) as apple_c, COALESCE(c.orange_count, 0) as orange_c
from Boxes as b
left join Chests as c
on b.chest_id = c.chest_id) as total
