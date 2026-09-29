USE college_db;

SELECT *
FROM students
WHERE marks = (
    SELECT MAX(marks) FROM students
);

SELECT *
FROM students
WHERE marks > (
    SELECT AVG(marks) FROM students
);

SELECT *
FROM students
WHERE city IN (
    SELECT city FROM students
    WHERE marks > 80
);

SELECT *
FROM students s
WHERE marks > (
    SELECT AVG(s2.marks)
    FROM students s2
    WHERE s2.city = s.city
);
