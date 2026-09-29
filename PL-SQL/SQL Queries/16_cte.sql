USE college_db;

WITH high_marks AS (
    SELECT * FROM students
    WHERE marks > 80
)
SELECT * FROM high_marks;

WITH student_avg AS (
    SELECT AVG(marks) AS avg_marks
    FROM students
),
high_students AS (
    SELECT * FROM students
    WHERE marks > (SELECT avg_marks FROM student_avg)
)
SELECT * FROM high_students;
