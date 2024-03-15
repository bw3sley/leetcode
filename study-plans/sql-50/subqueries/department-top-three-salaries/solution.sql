/* Write your T-SQL query statement below */
SELECT department, employee, salary
FROM (
    SELECT 
        Employee.name AS employee, Employee.salary AS salary, Department.name AS department, DENSE_RANK() OVER (PARTITION BY Department.id ORDER BY Employee.salary DESC) ranking
    FROM Employee Employee
    INNER JOIN Department Department
        ON Employee.department_id = Department.id
) temp
WHERE ranking <= 3