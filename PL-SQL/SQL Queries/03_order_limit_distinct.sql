USE college_db;

SELECT * FROM students ORDER BY marks ASC;

SELECT * FROM students ORDER BY marks DESC;

SELECT * FROM students
ORDER BY marks DESC
LIMIT 3;

SELECT DISTINCT city FROM students;
