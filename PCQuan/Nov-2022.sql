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
*/
-- Cach 1:
SELECT c.customer_id, c.customer_name
FROM Customers c
JOIN (
    SELECT 
        customer_id, 
        GROUP_CONCAT(product_name) AS product_name  
    FROM Orders 
    GROUP BY customer_id
) as o ON c.customer_id = o.customer_id
WHERE o.product_name REGEXP '^[^C]*$' AND o.product_name REGEXP 'A' AND o.product_name REGEXP 'B'

-- Cac cach tham khao cua anh DVHung
-- Cach 2:
SELECT
    c.customer_id,
    c.customer_name
FROM
    Customers c
    INNER JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id
HAVING
    SUM(o.product_name = 'C') = 0 AND 
    SUM(o.product_name = 'A') > 0 AND
    SUM(o.product_name = 'B') > 0
ORDER BY
    c.customer_id


-- Cach 3:
SELECT
    c.customer_id,
    c.customer_name
FROM
    Customers c
    JOIN Orders a ON a.customer_id = c.customer_id AND a.product_name = "A"
    JOIN Orders b ON b.customer_id = c.customer_id AND b.product_name = "B"
    LEFT OUTER JOIN Orders o on o.customer_id = c.customer_id AND o.product_name = "C"
WHERE
    o.order_id IS NULL


-- Cach 4:
SELECT
    DISTINCT b.customer_id,
    b.customer_name
FROM
    Orders a
    JOIN Customers b ON a.customer_id = b.customer_id
WHERE
    a.customer_id NOT IN (
        select customer_id FROM Orders WHERE product_name = 'C'
    )
  AND a.customer_id IN (
        SELECT customer_id FROM Orders WHERE product_name = 'A'
    )
  AND a.customer_id IN (
        SELECT customer_id FROM Orders WHERE product_name = 'B'
    )
ORDER BY 1

-- =====================================

/*
=====================================
### [1484. Group Sold Products By The Date](https://leetcode.com/problems/group-sold-products-by-the-date/)
Date: 10/11/2022
*/
SELECT 
    sell_date, 
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date ASC
-- =====================================




