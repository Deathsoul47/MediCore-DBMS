CREATE DATABASE IF NOT EXISTS college_db;
USE college_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    marks INT
);

INSERT INTO students VALUES
(1,'Rahul',20,'Male','Delhi',85),
(2,'Aman',21,'Male','Bhopal',72),
(3,'Priya',20,'Female','Indore',91),
(4,'Neha',22,'Female','Delhi',68),
(5,'Rohit',21,'Male','Lucknow',78);

SELECT * FROM students;
