/* Write your T-SQL query statement below */
SELECT 
    Signups.user_id,
    
    ROUND(
        COALESCE(
            SUM (CASE WHEN Confirmations.action = 'confirmed' THEN 1 ELSE 0 END) / NULLIF(CAST(COUNT(Confirmations.user_id) AS FLOAT), 0),
        0),
    2) AS confirmation_rate

FROM Signups Signups

LEFT JOIN Confirmations Confirmations
    ON Signups.user_id = Confirmations.user_id

GROUP BY Signups.user_id