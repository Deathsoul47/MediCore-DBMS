USE college_db;

DROP PROCEDURE IF EXISTS getStudents;

DELIMITER //

CREATE PROCEDURE getStudents()
BEGIN
    SELECT * FROM students;
END //

DELIMITER ;

CALL getStudents();

DROP PROCEDURE IF EXISTS getStudentById;

DELIMITER //

CREATE PROCEDURE getStudentById(IN id INT)
BEGIN
    SELECT * FROM students
    WHERE student_id = id;
END //

DELIMITER ;

CALL getStudentById(2);
