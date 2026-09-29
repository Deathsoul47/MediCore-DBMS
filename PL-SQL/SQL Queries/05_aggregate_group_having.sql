USE college_db;

SELECT COUNT(*) AS total_students FROM students;

SELECT MAX(marks) AS highest_marks FROM students;

SELECT MIN(marks) AS lowest_marks FROM students;

SELECT AVG(marks) AS average_marks FROM students;

SELECT SUM(marks) AS total_marks FROM students;

SELECT city, COUNT(*) AS total_students
FROM students
GROUP BY city;

SELECT city, AVG(marks) AS average_marks
FROM students
GROUP BY city;

SELECT city, AVG(marks) AS average_marks
FROM students
GROUP BY city
HAVING AVG(marks) > 75;
