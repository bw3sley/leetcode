/* Write your T-SQL query statement below */
SELECT 
    Register.contest_id,

    ROUND(COUNT(DISTINCT Register.user_id) * 1.0 * 100 / (SELECT COUNT(1) FROM Users), 2) AS percentage
    
FROM Register Register

GROUP BY
    Register.contest_id

ORDER BY
    percentage DESC,

    Register.contest_id ASC