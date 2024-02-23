/* Write your T-SQL query statement below */
SELECT 
    Employee.name,
    Bonus.bonus

FROM Employee Employee

LEFT JOIN Bonus Bonus 
    ON Employee.empId = Bonus.empId

WHERE Bonus.bonus < 1000 OR Bonus.bonus IS NULL