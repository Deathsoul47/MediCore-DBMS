USE college_db;

WITH RECURSIVE numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 10
)
SELECT * FROM numbers;

WITH RECURSIVE employee_tree AS (
    SELECT employee_id, employee_name, manager_id, 0 AS level
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT e.employee_id, e.employee_name, e.manager_id, et.level + 1
    FROM employees e
    JOIN employee_tree et
    ON e.manager_id = et.employee_id
)
SELECT * FROM employee_tree;
