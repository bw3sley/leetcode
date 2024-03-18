/* Write your T-SQL query statement below */
WITH DailyAmount AS (
    SELECT visited_on, SUM(amount) AS daily_amount
    FROM Customer 
    GROUP BY visited_on
)

SELECT 
    DailyAmount.visited_on,
    SUM(DailyAmountRecursive.daily_amount) AS amount,
    ROUND(AVG(DailyAmountRecursive.daily_amount * 1.0), 2) AS average_amount
FROM DailyAmount DailyAmount
INNER JOIN DailyAmount DailyAmountRecursive
    ON DailyAmountRecursive.visited_on BETWEEN DATEADD(DAY, -6, DailyAmount.visited_on) AND DailyAmount.visited_on
GROUP BY DailyAmount.visited_on
HAVING COUNT(DailyAmountRecursive.visited_on) = 7
ORDER BY DailyAmount.visited_on 