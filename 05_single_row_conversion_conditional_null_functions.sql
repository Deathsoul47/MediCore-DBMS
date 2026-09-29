USE hospital_management;

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
