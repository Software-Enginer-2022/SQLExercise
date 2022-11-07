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