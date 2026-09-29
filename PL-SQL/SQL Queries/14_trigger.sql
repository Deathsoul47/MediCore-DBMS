USE college_db;

CREATE TABLE IF NOT EXISTS student_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    student_name VARCHAR(50),
    action_type VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS after_student_delete;

DELIMITER //

CREATE TRIGGER after_student_delete
AFTER DELETE ON students
FOR EACH ROW
BEGIN
    INSERT INTO student_audit
    (student_id, student_name, action_type)
    VALUES
    (OLD.student_id, OLD.name, 'DELETE');
END //

DELIMITER ;

-- Test:
-- DELETE FROM students WHERE student_id = 2;
-- SELECT * FROM student_audit;

DROP TRIGGER IF EXISTS before_student_insert;

DELIMITER //

CREATE TRIGGER before_student_insert
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    IF NEW.marks < 0 THEN SET NEW.marks = 0; END IF;
    IF NEW.marks > 100 THEN SET NEW.marks = 100; END IF;
END //

DELIMITER ;
