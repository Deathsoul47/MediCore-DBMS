USE college_db;

SELECT s.name, d.department_name
FROM students3 s
INNER JOIN departments d
ON s.department_id = d.department_id;

SELECT s.name, d.department_name
FROM students3 s
LEFT JOIN departments d
ON s.department_id = d.department_id;

SELECT s.name, d.department_name
FROM students3 s
RIGHT JOIN departments d
ON s.department_id = d.department_id;

-- FULL OUTER JOIN concept in MySQL:
SELECT s.name, d.department_name
FROM students3 s
LEFT JOIN departments d
ON s.department_id = d.department_id
UNION
SELECT s.name, d.department_name
FROM students3 s
RIGHT JOIN departments d
ON s.department_id = d.department_id;

-- CROSS JOIN
SELECT s.name, d.department_name
FROM students3 s
CROSS JOIN departments d;

-- SELF JOIN
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT
);

SELECT e.employee_name AS employee,
       m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;
