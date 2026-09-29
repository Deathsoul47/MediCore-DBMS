USE college_db;

SELECT name, marks,
CASE
    WHEN marks >= 90 THEN 'A'
    WHEN marks >= 80 THEN 'B'
    WHEN marks >= 70 THEN 'C'
    WHEN marks >= 60 THEN 'D'
    ELSE 'F'
END AS grade
FROM students;

SELECT * FROM students WHERE city IS NULL;

SELECT * FROM students WHERE city IS NOT NULL;

SELECT name, COALESCE(city,'Unknown') AS city
FROM students;

SELECT city AS value FROM students
UNION
SELECT department_name FROM departments;

SELECT city AS value FROM students
UNION ALL
SELECT department_name FROM departments;
