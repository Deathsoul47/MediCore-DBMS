USE hospital_management;

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
