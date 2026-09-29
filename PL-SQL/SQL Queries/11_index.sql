USE college_db;

CREATE INDEX idx_student_name
ON students(name);

CREATE INDEX idx_student_city
ON students(city);

SHOW INDEX FROM students;

DROP INDEX idx_student_name
ON students;
