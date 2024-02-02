/* Write your T-SQL query statement below */
SELECT
    Employee.employee_id,
    Employee.department_id

FROM Employee Employee

WHERE Employee.primary_flag = 'Y'
    OR (SELECT COUNT(*) FROM Employee TEMP WHERE TEMP.employee_id = Employee.employee_id) = 1;