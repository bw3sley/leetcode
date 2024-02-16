/* Write your T-SQL query statement below */
SELECT 
    query_name,

    ISNULL(ROUND(AVG(CAST(rating AS FLOAT) / position), 2), 0) AS quality,
    
    ISNULL(ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2), 0) AS poor_query_percentage

FROM Queries

WHERE query_name IS NOT NULL

GROUP BY query_name