/* Write your T-SQL query statement below */
SELECT
    Employees.employee_id,
    Employees.name,

    COUNT(RecursiveEmployee.reports_to) AS reports_count,
    ROUND(AVG(CAST(RecursiveEmployee.age AS FLOAT)), 0) AS average_age 

FROM Employees Employees

INNER JOIN Employees RecursiveEmployee
    ON Employees.employee_id = RecursiveEmployee.reports_to

GROUP BY
    Employees.employee_id,
    Employees.name

ORDER BY
    Employees.employee_id