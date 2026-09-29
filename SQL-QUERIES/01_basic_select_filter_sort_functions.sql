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
