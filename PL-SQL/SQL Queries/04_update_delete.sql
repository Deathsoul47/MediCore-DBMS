USE college_db;

UPDATE students
SET marks = 90
WHERE student_id = 1;

SELECT name, marks
FROM students
WHERE student_id = 1;

-- Example:
-- DELETE FROM students WHERE student_id = 5;
