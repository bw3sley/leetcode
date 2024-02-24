/* Write your T-SQL query statement below */
SELECT Employee.name FROM Employee Employee
WHERE Employee.id IN (
    SELECT managerId FROM Employee WHERE managerId IS NOT NULL GROUP BY managerId HAVING COUNT(*) >= 5
)