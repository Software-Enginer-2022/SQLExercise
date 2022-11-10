/*
=====================================
[175. Combine Two Tables](https://leetcode.com/problems/combine-two-tables/)
Date: 04/11/2022
=====================================
*/
SELECT p.lastname, p.firstname, a.city, a.state FROM Person p 
LEFT JOIN Address a ON p.personId = a.personId


/*
=====================================
### [1393. Capital Gain/Loss](https://leetcode.com/problems/capital-gainloss/)
Date: 07/11/2022
**Way 1:**

Reference: [Stored Procedure](https://www.semtek.com.vn/procedure-la-gi/)
*/

SELECT stock_name, SUM(IF(operation='Buy', -price, price)) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name


-- **Way 2:**
-- Reference: [MySQL CASE Function](https://www.w3schools.com/sql/func_mysql_case.asp)

SELECT 
    stock_name,
    SUM(
        CASE operation
            WHEN 'BUY' THEN -price
            ELSE price
        END
    ) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name 

-- OR

SELECT 
    stock_name,
    SUM(
        CASE 
            WHEN operation = 'BUY' THEN -price
            ELSE price
        END
    ) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name 
-- =====================================


/*
=====================================
### [626. Exchange Seats](https://leetcode.com/problems/exchange-seats/)
Date: 10/11/2022
*/
SELECT 
    CASE
        WHEN id % 2 = 0 THEN id - 1
        WHEN id % 2 = 1 AND id != (SELECT MAX(id) FROM Seat) THEN id + 1
        ELSE id
    END AS id,
    student
FROM Seat 
ORDER BY id
-- =====================================


/*
=====================================
### [1398. Customers Who Bought Products A and B but Not C](https://leetcode.com/problems/customers-who-bought-products-a-and-b-but-not-c/)
Date: 10/11/2022

!!!! Chưa xong. Tìm REGEX đúng là ok
*/
SELECT c.customer_id, c.customer_name
FROM Customers c
JOIN (
    SELECT 
        customer_id, 
        REPLACE(GROUP_CONCAT(product_name), ',','') AS product_name  
    FROM Orders 
    GROUP BY customer_id
) as o ON c.customer_id = o.customer_id
WHERE o.product_name REGEXP '[[:>:]]AB[^C][[:>:]]'
-- =====================================







