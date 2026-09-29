USE hospital_management;

-- Q11. Count all patients
SELECT COUNT(*) AS total_patients FROM patients;

-- Q12. Count all doctors
SELECT COUNT(*) AS total_doctors FROM doctors;

-- Q13. Calculate average doctor experience
SELECT ROUND(AVG(years_experience),2) AS average_experience FROM doctors;

-- Q14. Calculate total treatment cost
SELECT SUM(cost) AS total_treatment_cost FROM treatments;

-- Q15. Calculate average treatment cost
SELECT ROUND(AVG(cost),2) AS average_treatment_cost FROM treatments;

-- Q16. Find minimum and maximum treatment cost
SELECT MIN(cost) AS minimum_cost, MAX(cost) AS maximum_cost FROM treatments;

-- Q17. Count appointments by status
SELECT status, COUNT(*) AS appointment_count FROM appointments GROUP BY status ORDER BY appointment_count DESC;

-- Q18. Count treatments and average cost by type
SELECT treatment_type, COUNT(*) AS treatment_count, ROUND(AVG(cost),2) AS average_cost FROM treatments GROUP BY treatment_type ORDER BY treatment_count DESC;

-- Q19. Count doctors by specialization
SELECT specialization, COUNT(*) AS doctor_count, ROUND(AVG(years_experience),2) AS average_experience FROM doctors GROUP BY specialization;

-- Q20. Count doctors by hospital branch
SELECT hospital_branch, COUNT(*) AS doctor_count FROM doctors GROUP BY hospital_branch;

-- Q21. Treatment types whose average cost exceeds 2500
SELECT treatment_type, AVG(cost) AS average_cost FROM treatments GROUP BY treatment_type HAVING AVG(cost)>2500;
