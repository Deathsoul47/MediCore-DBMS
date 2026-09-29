USE hospital_management;

-- Q53. DDL: Create a table to record department announcements.
CREATE TABLE IF NOT EXISTS department_announcements (
  announcement_id INT PRIMARY KEY AUTO_INCREMENT,
  department_name VARCHAR(100) NOT NULL,
  announcement_text VARCHAR(500) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Q54. DML: Insert one sample announcement.
INSERT INTO department_announcements (department_name, announcement_text)
VALUES ('Cardiology', 'Monthly department review scheduled.');

-- Q55. DML: Update the sample announcement.
UPDATE department_announcements
SET announcement_text = 'Monthly department review scheduled for Friday.'
WHERE department_name = 'Cardiology';

-- Q56. DML: Delete the sample row (safe to run after reviewing it).
DELETE FROM department_announcements WHERE department_name = 'Cardiology';

-- Q57. TCL: Demonstrate a transaction and rollback. Run as a separate test.
START TRANSACTION;
INSERT INTO department_announcements (department_name, announcement_text)
VALUES ('Test Department', 'TCL rollback demonstration');
SAVEPOINT before_update;
UPDATE department_announcements SET announcement_text = 'Updated test text'
WHERE department_name = 'Test Department';
ROLLBACK TO SAVEPOINT before_update;
ROLLBACK;

-- Q58. INDEX: Create an index for appointment lookup by patient and date.
CREATE INDEX idx_appointments_patient_date
ON appointments (patient_id, appointment_date);

-- Q59. VIEW: Create a reusable patient appointment view.
CREATE OR REPLACE VIEW vw_patient_appointments AS
SELECT a.appointment_id, a.appointment_date, a.status,
       p.patient_id, p.first_name AS patient_first_name, p.last_name AS patient_last_name,
       d.doctor_id, d.first_name AS doctor_first_name, d.last_name AS doctor_last_name
FROM appointments a
JOIN patients p ON p.patient_id = a.patient_id
JOIN doctors d ON d.doctor_id = a.doctor_id;

-- Q60. Query the view.
SELECT * FROM vw_patient_appointments ORDER BY appointment_date;

-- Q61. Trigger: create audit table for billing status changes.
CREATE TABLE IF NOT EXISTS billing_status_audit (
  audit_id INT PRIMARY KEY AUTO_INCREMENT,
  bill_id INT NOT NULL,
  old_status VARCHAR(50),
  new_status VARCHAR(50),
  changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Q62. Trigger: log payment-status changes (MySQL syntax).
DELIMITER $$
CREATE TRIGGER trg_billing_status_update
AFTER UPDATE ON billing
FOR EACH ROW
BEGIN
  IF NOT (OLD.payment_status <=> NEW.payment_status) THEN
    INSERT INTO billing_status_audit (bill_id, old_status, new_status)
    VALUES (NEW.bill_id, OLD.payment_status, NEW.payment_status);
  END IF;
END$$
DELIMITER ;

-- Q63. DDL: Remove a table 
-- DROP TABLE IF EXISTS department_announcements;
