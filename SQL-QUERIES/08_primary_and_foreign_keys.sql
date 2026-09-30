USE hospital_management;

-- ============================================================
--  PRIMARY KEY & FOREIGN KEY QUERIES
--  Database: hospital_management
-- ============================================================

-- ============================================================
--  SECTION 1: PRIMARY KEY QUERIES
-- ============================================================

-- Q1. Display the primary key column of the patients table.
SELECT patient_id AS primary_key, first_name, last_name
FROM patients
ORDER BY patient_id;

-- Q2. Display the primary key column of the doctors table.
SELECT doctor_id AS primary_key, first_name, last_name, specialization
FROM doctors
ORDER BY doctor_id;

-- Q3. Display the primary key column of the appointments table.
SELECT appointment_id AS primary_key, patient_id, doctor_id, appointment_date
FROM appointments
ORDER BY appointment_id;

-- Q4. Display the primary key column of the treatments table.
SELECT treatment_id AS primary_key, appointment_id, treatment_type, cost
FROM treatments
ORDER BY treatment_id;

-- Q5. Display the primary key column of the billing table.
SELECT bill_id AS primary_key, patient_id, treatment_id, amount
FROM billing
ORDER BY bill_id;

-- Q6. Verify primary keys are unique — count vs distinct count for patients.
SELECT COUNT(patient_id) AS total_rows,
       COUNT(DISTINCT patient_id) AS unique_keys
FROM patients;

-- Q7. Verify primary keys are unique — count vs distinct count for doctors.
SELECT COUNT(doctor_id) AS total_rows,
       COUNT(DISTINCT doctor_id) AS unique_keys
FROM doctors;

-- Q8. Check that no primary key is NULL in appointments.
SELECT COUNT(*) AS null_primary_keys
FROM appointments
WHERE appointment_id IS NULL;

-- Q9. List all primary key constraint details from INFORMATION_SCHEMA.
SELECT TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'hospital_management'
  AND CONSTRAINT_NAME = 'PRIMARY'
ORDER BY TABLE_NAME;

-- Q10. DDL: Create a new table with a PRIMARY KEY to store hospital departments.
CREATE TABLE IF NOT EXISTS departments (
  department_id INT PRIMARY KEY AUTO_INCREMENT,
  department_name VARCHAR(100) NOT NULL,
  head_doctor_id VARCHAR(10),
  location VARCHAR(100)
);

-- Q11. DDL: Add a PRIMARY KEY to an existing table (demo — create then add).
CREATE TABLE IF NOT EXISTS temp_staff (
  staff_id VARCHAR(10) NOT NULL,
  staff_name VARCHAR(100)
);

ALTER TABLE temp_staff
ADD PRIMARY KEY (staff_id);

-- ============================================================
--  SECTION 2: FOREIGN KEY QUERIES
-- ============================================================

-- Q12. List all foreign key constraints in the database from INFORMATION_SCHEMA.
SELECT CONSTRAINT_NAME,
       TABLE_NAME,
       COLUMN_NAME,
       REFERENCED_TABLE_NAME,
       REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'hospital_management'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, CONSTRAINT_NAME;

-- Q13. Show foreign key relationships for the appointments table.
SELECT CONSTRAINT_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'hospital_management'
  AND TABLE_NAME = 'appointments'
  AND REFERENCED_TABLE_NAME IS NOT NULL;

-- Q14. Show foreign key relationships for the billing table.
SELECT CONSTRAINT_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'hospital_management'
  AND TABLE_NAME = 'billing'
  AND REFERENCED_TABLE_NAME IS NOT NULL;

-- Q15. Show foreign key relationships for the treatments table.
SELECT CONSTRAINT_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'hospital_management'
  AND TABLE_NAME = 'treatments'
  AND REFERENCED_TABLE_NAME IS NOT NULL;

-- Q16. JOIN using FK: Get appointment details with patient and doctor names.
SELECT a.appointment_id,
       p.patient_id, p.first_name AS patient_first, p.last_name AS patient_last,
       d.doctor_id, d.first_name AS doctor_first, d.last_name AS doctor_last,
       a.appointment_date, a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date;

-- Q17. JOIN using FK: Get treatment details with patient and doctor info.
SELECT t.treatment_id, t.treatment_type, t.cost,
       p.first_name AS patient_first, p.last_name AS patient_last,
       d.first_name AS doctor_first, d.specialization
FROM treatments t
JOIN appointments a ON t.appointment_id = a.appointment_id
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
ORDER BY t.treatment_id;

-- Q18. JOIN using FK: Get billing details with patient name and treatment type.
SELECT b.bill_id, b.amount, b.payment_method, b.payment_status,
       p.first_name AS patient_first, p.last_name AS patient_last,
       t.treatment_type
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
JOIN treatments t ON b.treatment_id = t.treatment_id
ORDER BY b.bill_id;

-- Q19. JOIN using FK: Full chain — Patient → Appointment → Treatment → Billing.
SELECT p.patient_id, CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
       a.appointment_id, a.appointment_date,
       d.doctor_id, CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
       t.treatment_id, t.treatment_type, t.cost AS treatment_cost,
       b.bill_id, b.amount AS billed_amount, b.payment_status
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
JOIN treatments t ON a.appointment_id = t.appointment_id
JOIN billing b ON t.treatment_id = b.treatment_id
ORDER BY p.patient_id, a.appointment_date;

-- Q20. Validate FK: Find appointments whose patient_id exists in patients table.
SELECT a.appointment_id, a.patient_id
FROM appointments a
WHERE a.patient_id IN (SELECT patient_id FROM patients);

-- Q21. Validate FK: Find any orphan rows — appointments with no matching patient.
SELECT a.appointment_id, a.patient_id
FROM appointments a
LEFT JOIN patients p ON a.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

-- Q22. Validate FK: Find any orphan rows — billing with no matching treatment.
SELECT b.bill_id, b.treatment_id
FROM billing b
LEFT JOIN treatments t ON b.treatment_id = t.treatment_id
WHERE t.treatment_id IS NULL;

-- Q23. Validate FK: Find any orphan rows — treatments with no matching appointment.
SELECT t.treatment_id, t.appointment_id
FROM treatments t
LEFT JOIN appointments a ON t.appointment_id = a.appointment_id
WHERE a.appointment_id IS NULL;

-- Q24. Count records linked through FK: Appointments per patient.
SELECT p.patient_id, CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
       COUNT(a.appointment_id) AS total_appointments
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name
ORDER BY total_appointments DESC;

-- Q25. Count records linked through FK: Appointments per doctor.
SELECT d.doctor_id, CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
       d.specialization,
       COUNT(a.appointment_id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name, d.specialization
ORDER BY total_appointments DESC;

-- Q26. Total billing amount per patient using FK joins.
SELECT p.patient_id, CONCAT(p.first_name, ' ', p.last_name) AS patient_name,
       SUM(b.amount) AS total_billed,
       COUNT(b.bill_id) AS bill_count
FROM patients p
JOIN billing b ON p.patient_id = b.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name
ORDER BY total_billed DESC;

-- Q27. DDL: Add a FOREIGN KEY to the departments table referencing doctors.
ALTER TABLE departments
ADD CONSTRAINT fk_departments_head_doctor
FOREIGN KEY (head_doctor_id) REFERENCES doctors (doctor_id);

-- Q28. DDL: Drop the foreign key constraint from departments.
ALTER TABLE departments
DROP FOREIGN KEY fk_departments_head_doctor;

-- Q29. Cleanup: Drop the demo tables created above.
DROP TABLE IF EXISTS temp_staff;
DROP TABLE IF EXISTS departments;
