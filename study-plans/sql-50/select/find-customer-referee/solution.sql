/* Write your T-SQL query statement below */
SELECT Customer.name FROM Customer WHERE Customer.referee_id IS NULL OR Customer.referee_id <> 2