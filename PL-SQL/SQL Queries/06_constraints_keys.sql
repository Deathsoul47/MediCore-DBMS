USE college_db;

CREATE TABLE students2 (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Bhopal',
    marks INT CHECK (marks BETWEEN 0 AND 100)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

INSERT INTO departments VALUES
(1,'CSE'),(2,'ECE'),(3,'Mechanical');

CREATE TABLE students3 (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

INSERT INTO students3 VALUES
(1,'Rahul',1),(2,'Aman',1),(3,'Priya',2);
