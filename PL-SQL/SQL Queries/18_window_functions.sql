USE college_db;

SELECT name, marks,
ROW_NUMBER() OVER (ORDER BY marks DESC) AS row_num
FROM students;

SELECT name, marks,
RANK() OVER (ORDER BY marks DESC) AS ranking
FROM students;

SELECT name, marks,
DENSE_RANK() OVER (ORDER BY marks DESC) AS ranking
FROM students;

SELECT name, city, marks,
RANK() OVER (
    PARTITION BY city
    ORDER BY marks DESC
) AS city_rank
FROM students;

SELECT name, marks,
LAG(marks) OVER (ORDER BY marks) AS previous_marks
FROM students;

SELECT name, marks,
LEAD(marks) OVER (ORDER BY marks) AS next_marks
FROM students;

SELECT name, marks,
SUM(marks) OVER (ORDER BY student_id) AS running_total
FROM students;
