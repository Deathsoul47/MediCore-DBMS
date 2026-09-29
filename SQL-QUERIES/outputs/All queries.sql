-- MediCore Hospital Management
USE hospital_management;

-- Q01. Display all patients
SELECT * FROM patients;

-- Q02. Show patient names and gender
SELECT patient_id, first_name, last_name, gender FROM patients;

-- Q03. List unique insurance providers
SELECT DISTINCT insurance_provider FROM patients ORDER BY insurance_provider;

-- Q04. Find patients recorded as male
SELECT patient_id, first_name, last_name FROM patients WHERE gender = 'M';

-- Q05. Find patients born between 1970 and 1990
SELECT patient_id, first_name, last_name, date_of_birth FROM patients WHERE date_of_birth BETWEEN '1970-01-01' AND '1990-12-31' ORDER BY date_of_birth;

-- Q06. List doctors in selected hospital branches
SELECT doctor_id, first_name, last_name, hospital_branch FROM doctors WHERE hospital_branch IN ('Main Branch', 'City Branch');

-- Q07. Find patients whose last name starts with J
SELECT patient_id, first_name, last_name FROM patients WHERE last_name LIKE 'J%';

-- Q08. Doctors with at least 5 years experience
SELECT doctor_id, first_name, last_name, years_experience FROM doctors WHERE years_experience >= 5 ORDER BY years_experience DESC;

-- Q09. List completed appointments
SELECT appointment_id, patient_id, doctor_id, appointment_date, status FROM appointments WHERE status = 'Completed' ORDER BY appointment_date;

-- Q10. Treatments costing more than 4000
SELECT treatment_id, treatment_type, cost FROM treatments WHERE cost > 4000 ORDER BY cost DESC;

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

-- Q22. Display appointments with patient details
SELECT a.appointment_id, a.appointment_date, a.status, p.first_name, p.last_name FROM appointments a JOIN patients p ON a.patient_id=p.patient_id ORDER BY a.appointment_date;

-- Q23. Display appointments with doctor details
SELECT a.appointment_id, a.appointment_date, d.first_name, d.last_name, d.specialization FROM appointments a JOIN doctors d ON a.doctor_id=d.doctor_id;

-- Q24. Display patient and doctor for each appointment
SELECT a.appointment_id, p.first_name AS patient_first_name, p.last_name AS patient_last_name, d.first_name AS doctor_first_name, d.last_name AS doctor_last_name, a.appointment_date, a.status FROM appointments a JOIN patients p ON a.patient_id=p.patient_id JOIN doctors d ON a.doctor_id=d.doctor_id;

-- Q25. Display treatment and billing details
SELECT t.treatment_id, t.treatment_type, t.cost, b.bill_id, b.amount, b.payment_status FROM treatments t JOIN billing b ON t.treatment_id=b.treatment_id;

-- Q26. Display billing details with patient names
SELECT b.bill_id, p.patient_id, p.first_name, p.last_name, b.amount, b.payment_status FROM billing b JOIN patients p ON b.patient_id=p.patient_id;

-- Q27. Calculate total billed amount per patient
SELECT p.patient_id, p.first_name, p.last_name, COALESCE(SUM(b.amount),0) AS total_billed FROM patients p LEFT JOIN billing b ON p.patient_id=b.patient_id GROUP BY p.patient_id,p.first_name,p.last_name ORDER BY total_billed DESC;

-- Q28. Count appointments per doctor
SELECT d.doctor_id, d.first_name, d.last_name, COUNT(a.appointment_id) AS appointment_count FROM doctors d LEFT JOIN appointments a ON d.doctor_id=a.doctor_id GROUP BY d.doctor_id,d.first_name,d.last_name ORDER BY appointment_count DESC;

-- Q29. Count completed appointments per doctor
SELECT d.doctor_id, d.first_name, d.last_name, COUNT(a.appointment_id) AS completed_count FROM doctors d LEFT JOIN appointments a ON d.doctor_id=a.doctor_id AND a.status='Completed' GROUP BY d.doctor_id,d.first_name,d.last_name;

-- Q30. Summarize billing by payment status
SELECT payment_status, COUNT(*) AS bill_count, SUM(amount) AS total_amount FROM billing GROUP BY payment_status;

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

-- Q37. Categorize bills using CASE
SELECT bill_id, amount, CASE WHEN amount>=4000 THEN 'High' WHEN amount>=2000 THEN 'Medium' ELSE 'Low' END AS amount_category FROM billing ORDER BY amount DESC;

-- Q38. Convert appointment status into readable labels
SELECT appointment_id,status,CASE WHEN status='Completed' THEN 'Visit completed' WHEN status='Scheduled' THEN 'Upcoming visit' ELSE 'Other status' END AS status_label FROM appointments;

-- Q39. Show monthly billing summary
SELECT substr(bill_date,1,7) AS billing_month,COUNT(*) AS bill_count,SUM(amount) AS total_amount FROM billing GROUP BY substr(bill_date,1,7) ORDER BY billing_month;

-- Q40. Show monthly appointment summary
SELECT substr(appointment_date,1,7) AS appointment_month,COUNT(*) AS appointment_count FROM appointments GROUP BY substr(appointment_date,1,7) ORDER BY appointment_month;

-- Q41. Use IN with a nested query to find patients with bills
SELECT patient_id,first_name,last_name FROM patients WHERE patient_id IN (SELECT patient_id FROM billing);

-- Q42. Find bills above the average bill amount using a scalar subquery
SELECT bill_id,patient_id,amount FROM billing WHERE amount>(SELECT AVG(amount) FROM billing) ORDER BY amount DESC;

-- Q43. Find doctors whose experience exceeds every doctor in a selected specialization (MAX subquery)
SELECT doctor_id,first_name,last_name,years_experience FROM doctors WHERE years_experience>(SELECT MAX(years_experience) FROM doctors WHERE specialization='Pediatrics');

-- Q44. Find patients with no email recorded (NULL check)
SELECT patient_id,first_name,last_name FROM patients WHERE email IS NULL;

-- Q45. Replace missing email values with a readable label
SELECT patient_id,COALESCE(email,'Email not provided') AS email_display FROM patients;

-- Q46. Count total patients and patients with email addresses
SELECT COUNT(*) AS total_patients,COUNT(email) AS with_email,COUNT(*)-COUNT(email) AS without_email FROM patients;

-- Q47. Format patient names in uppercase and lowercase
SELECT patient_id,UPPER(first_name) AS first_name_upper,LOWER(last_name) AS last_name_lower FROM patients;

-- Q48. Convert treatment cost to text and decimal forms
SELECT treatment_id,CAST(cost AS TEXT) AS cost_as_text,ROUND(cost,1) AS cost_one_decimal FROM treatments;

-- Q49. Use a LEFT JOIN to show all patients and any matching bills
SELECT p.patient_id,p.first_name,p.last_name,b.bill_id,b.amount FROM patients p LEFT JOIN billing b ON p.patient_id=b.patient_id;

-- Q50. Use UNION to combine patient and doctor names
SELECT first_name,last_name,'Patient' AS person_type FROM patients UNION SELECT first_name,last_name,'Doctor' AS person_type FROM doctors;

-- Q51. Use INTERSECT to find patient IDs that also appear in billing
SELECT patient_id FROM patients INTERSECT SELECT patient_id FROM billing;

-- Q52. Use EXCEPT to find patients without bills
SELECT patient_id FROM patients EXCEPT SELECT patient_id FROM billing;
