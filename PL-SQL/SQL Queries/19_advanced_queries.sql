USE college_db;

WITH ranked_students AS (
    SELECT name, city, marks,
           ROW_NUMBER() OVER (
               PARTITION BY city
               ORDER BY marks DESC
           ) AS rn
    FROM students
)
SELECT name, city, marks
FROM ranked_students
WHERE rn <= 2;

SELECT MAX(marks) AS second_highest
FROM students
WHERE marks < (SELECT MAX(marks) FROM students);

SELECT marks
FROM (
    SELECT marks,
           DENSE_RANK() OVER (ORDER BY marks DESC) AS rnk
    FROM students
) ranked
WHERE rnk = 3;

SELECT city, COUNT(*) AS total
FROM students
GROUP BY city
HAVING COUNT(*) > 1;

SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM students3 s3
    WHERE s3.student_id = s.student_id
);

SELECT *
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM students3 s
    WHERE s.department_id = d.department_id
);

SELECT COUNT(*) AS total_students,
       SUM(CASE WHEN marks >= 80 THEN 1 ELSE 0 END) AS above_80
FROM students;
