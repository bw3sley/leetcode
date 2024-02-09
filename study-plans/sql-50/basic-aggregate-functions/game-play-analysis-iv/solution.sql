/* Write your T-SQL query statement below */
WITH FirstLogins AS (
    SELECT player_id, MIN(event_date) AS first_login_date
    FROM Activity
    GROUP BY player_id
),

ConsecutiveLogins AS (
    SELECT FirstLogins.player_id

    FROM FirstLogins
    
    INNER JOIN Activity Activity
        ON FirstLogins.player_id = Activity.player_id
            AND DATEADD(DAY, 1, FirstLogins.first_login_date) = Activity.event_date
)

SELECT
    ROUND(COUNT(DISTINCT ConsecutiveLogins.player_id) * 1.0 / COUNT(DISTINCT FirstLogins.player_id), 2) AS fraction

FROM FirstLogins

LEFT JOIN ConsecutiveLogins
    ON FirstLogins.player_id = ConsecutiveLogins.player_id