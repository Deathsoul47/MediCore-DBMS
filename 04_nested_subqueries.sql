USE hospital_management;

-- Q31. Find treatments costing above the average
SELECT treatment_id, treatment_type, cost FROM treatments WHERE cost > (SELECT AVG(cost) FROM treatments WHERE cost IS NOT NULL) ORDER BY cost DESC;

-- Q32. Find doctors with above-average experience
SELECT doctor_id, first_name, last_name, years_experience FROM doctors WHERE years_experience > (SELECT AVG(years_experience) FROM doctors);

-- Q33. Find patients who have at least one appointment using EXISTS
SELECT p.patient_id,p.first_name,p.last_name FROM patients p WHERE EXISTS (SELECT 1 FROM appointments a WHERE a.patient_id=p.patient_id);

-- Q34. Find patients without appointments using NOT EXISTS
SELECT p.patient_id,p.first_name,p.last_name FROM patients p WHERE NOT EXISTS (SELECT 1 FROM appointments a WHERE a.patient_id=p.patient_id);

-- Q35. Find doctors with a completed appointment
SELECT d.doctor_id,d.first_name,d.last_name FROM doctors d WHERE EXISTS (SELECT 1 FROM appointments a WHERE a.doctor_id=d.doctor_id AND a.status='Completed');

-- Q36. Find doctors without completed appointments
SELECT d.doctor_id,d.first_name,d.last_name FROM doctors d WHERE NOT EXISTS (SELECT 1 FROM appointments a WHERE a.doctor_id=d.doctor_id AND a.status='Completed');
