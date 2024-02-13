/* Write your T-SQL query statement below */
SELECT 
    Cinema.id, 
    Cinema.movie, 
    Cinema.description, 
    Cinema.rating 
FROM Cinema Cinema
WHERE Cinema.description <> 'boring' AND Cinema.id % 2 <> 0
ORDER BY Cinema.rating DESC