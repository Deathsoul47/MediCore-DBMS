USE college_db;

DROP FUNCTION IF EXISTS getGrade;

DELIMITER //

CREATE FUNCTION getGrade(mark INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(10);

    IF mark >= 90 THEN
        SET grade = 'A';
    ELSEIF mark >= 80 THEN
        SET grade = 'B';
    ELSEIF mark >= 70 THEN
        SET grade = 'C';
    ELSEIF mark >= 60 THEN
        SET grade = 'D';
    ELSE
        SET grade = 'F';
    END IF;

    RETURN grade;
END //

DELIMITER ;

SELECT name, marks, getGrade(marks) AS grade
FROM students;
