USE hospital_management;

-- Q50. Use UNION to combine patient and doctor names
SELECT first_name,last_name,'Patient' AS person_type FROM patients UNION SELECT first_name,last_name,'Doctor' AS person_type FROM doctors;

-- Q51. Use INTERSECT to find patient IDs that also appear in billing
SELECT patient_id FROM patients INTERSECT SELECT patient_id FROM billing;

-- Q52. Use EXCEPT to find patients without bills
SELECT patient_id FROM patients EXCEPT SELECT patient_id FROM billing;
