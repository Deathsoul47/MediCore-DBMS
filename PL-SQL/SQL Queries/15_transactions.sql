USE college_db;

START TRANSACTION;

UPDATE students SET marks = marks + 5
WHERE student_id = 1;

UPDATE students SET marks = marks - 5
WHERE student_id = 2;

COMMIT;

START TRANSACTION;

UPDATE students SET marks = 0;

ROLLBACK;

START TRANSACTION;

UPDATE students SET marks = marks + 5
WHERE student_id = 1;

SAVEPOINT point1;

UPDATE students SET marks = 0
WHERE student_id = 2;

ROLLBACK TO point1;

COMMIT;
