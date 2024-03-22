/* Write your T-SQL query statement below */
SELECT TOP 1 requester_id AS id, SUM(total) AS num FROM (
    SELECT requester_id, COUNT(requester_id) AS total FROM RequestAccepted GROUP BY requester_id
        UNION ALL
    SELECT accepter_id AS requester_id, COUNT(accepter_id) FROM RequestAccepted GROUP BY accepter_id
) AS temp
GROUP BY temp.requester_id
ORDER BY num DESC