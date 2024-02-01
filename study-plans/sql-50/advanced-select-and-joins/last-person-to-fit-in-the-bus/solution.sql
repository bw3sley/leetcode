/* Write your T-SQL query statement below */
WITH CumulativeWeight AS (
    SELECT
        person_name,
        weight,
        turn,

        SUM(weight) OVER (ORDER BY turn) AS cumulative_weight,
        ROW_NUMBER() OVER (ORDER BY turn) AS rn

    FROM Queue 
),

FilteredQueue AS (
    SELECT
        person_name,
        cumulative_weight,
        rn
    FROM CumulativeWeight
    WHERE cumulative_weight <= 1000
)

SELECT person_name FROM FilteredQueue WHERE rn = (SELECT MAX(rn) FROM FilteredQueue)