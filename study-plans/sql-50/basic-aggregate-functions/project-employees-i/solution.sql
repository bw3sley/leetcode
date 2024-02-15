/* Write your T-SQL query statement below */
SELECT 
    Project.project_id,

    ISNULL(ROUND(AVG(Employee.experience_years * 1.0), 2), 0) AS average_years

FROM Project Project

LEFT JOIN Employee Employee
    ON Project.employee_id = Employee.employee_id

GROUP BY
    Project.project_id