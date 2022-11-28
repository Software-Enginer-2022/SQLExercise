-- https://leetcode.com/problems/market-analysis-i/description/

SELECT u.user_id AS buyer_id, u.join_date AS join_date, COUNT(o.buyer_id) AS orders_in_2019
FROM Users AS u
LEFT JOIN Orders AS o
ON u.user_id = o.buyer_id
AND year(o.order_date) = '2019'  -- use "AND" instead of "WHERE" to get full user_id
GROUP BY u.user_id