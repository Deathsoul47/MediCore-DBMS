USE college_db;

SELECT * FROM students;

SELECT name, marks FROM students;

SELECT * FROM students WHERE marks > 80;

SELECT * FROM students
WHERE age >= 20 AND marks > 75;

SELECT * FROM students
WHERE city IN ('Delhi','Bhopal','Lucknow');

SELECT * FROM students
WHERE marks BETWEEN 70 AND 85;

SELECT * FROM students
WHERE name LIKE 'R%';

SELECT * FROM students
WHERE name LIKE '%a';
