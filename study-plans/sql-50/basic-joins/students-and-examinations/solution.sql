/* Write your T-SQL query statement below */
SELECT 
    Students.student_id,
    Students.student_name,
    Subjects.subject_name,
    
    COALESCE(COUNT(Examinations.student_id), 0) AS attended_exams

FROM Students Students

CROSS JOIN Subjects Subjects
LEFT JOIN Examinations Examinations 
    ON Students.student_id = Examinations.student_id 
        AND Subjects.subject_name = Examinations.subject_name

GROUP BY 
    Students.student_id, 
    Students.student_name,

    Subjects.subject_name

ORDER BY 
    Students.student_id, 

    Subjects.subject_name
