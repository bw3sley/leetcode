/* Write your T-SQL query statement below */
SELECT TOP 1 MAX(num) as num FROM (
    SELECT num 
    FROM MyNumbers 
    GROUP BY num 
    HAVING COUNT(num) = 1
) AS SingleNumber

-- OR

WITH SingleNumbers AS (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
)

SELECT MAX(num) AS num FROM SingleNumbers