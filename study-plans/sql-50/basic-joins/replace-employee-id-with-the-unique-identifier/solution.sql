/* Write your T-SQL query statement below */
SELECT
    EmployeeUNI.unique_id AS unique_id,
    Employees.name AS name

FROM Employees Employees 

LEFT JOIN EmployeeUNI EmployeeUNI
    ON Employees.id = EmployeeUNI.id