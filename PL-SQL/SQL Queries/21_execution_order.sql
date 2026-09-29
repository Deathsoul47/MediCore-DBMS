USE college_db;

-- Conceptual execution order:
-- FROM -> JOIN -> WHERE -> GROUP BY -> HAVING
-- -> SELECT -> DISTINCT -> ORDER BY -> LIMIT

SELECT city, AVG(marks) AS average_marks
FROM students
WHERE marks > 50
GROUP BY city
HAVING AVG(marks) > 70
ORDER BY average_marks DESC
LIMIT 3;
