USE college_db;

-- ADD COLUMN
ALTER TABLE students
ADD email VARCHAR(100);

-- MODIFY COLUMN
ALTER TABLE students
MODIFY name VARCHAR(100);

-- RENAME COLUMN
ALTER TABLE students
RENAME COLUMN name TO student_name;

-- DROP COLUMN
ALTER TABLE students
DROP COLUMN email;

-- DELETE selected rows
-- DELETE FROM students WHERE student_id = 1;

-- TRUNCATE all rows
-- TRUNCATE TABLE students;

-- DROP table
-- DROP TABLE students;
