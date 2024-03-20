/* Write your T-SQL query statement below */
SELECT employee_id FROM (
    SELECT employee_id 
    FROM Employees 
    WHERE salary < 30000
        AND manager_id NOT IN (SELECT employee_id FROM Employees)
) AS subquery
ORDER BY employee_id