USE college_db;

CREATE OR REPLACE VIEW student_details AS
SELECT student_id, name, city, marks
FROM students;

SELECT * FROM student_details;

CREATE OR REPLACE VIEW toppers AS
SELECT * FROM students
WHERE marks >= 80;

SELECT * FROM toppers;

DROP VIEW IF EXISTS toppers;
