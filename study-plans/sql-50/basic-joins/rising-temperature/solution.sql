/* Write your T-SQL query statement below */
SELECT 
    W1.id

FROM Weather W1

INNER JOIN Weather W2 
    ON DATEDIFF(DAY, W2.recordDate, W1.recordDate) = 1

WHERE 
    W1.temperature > W2.temperature;
