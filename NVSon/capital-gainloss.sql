SELECT stock_name, SUM(
    CASE
        WHEN operation = 'Buy' THEN -price
        ELSE price
    END
) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name


select 
    stock_name,
    sum(if(operation = 'Buy', -1, 1) * price) as capital_gain_loss
from stocks
group by stock_name


select
    stock_name,
    sum(if(operation='Buy', -price, price)) as capital_gain_loss
from stocks
group by 1