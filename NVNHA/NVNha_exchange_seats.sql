---case1---
select
Case
    When id%2 = 1 and id != (select count(id) from seat) then id+1
    When id%2 = 0 then id-1
    ELSE id
END as id, student
from seat
order by id


---case2---
SELECT
id,
CASE WHEN id % 2 = 1 AND id NOT IN (SELECT MAX(id) FROM Seat)
THEN LEAD(student,1) OVER (ORDER BY id ASC)
WHEN id % 2 = 1 AND id IN (SELECT MAX(id) FROM Seat)
THEN student
ELSE LAG(student,1) OVER (ORDER BY id ASC) END AS student
FROM
Seat
