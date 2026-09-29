-- PL/SQL 03: Using SQL Statements Within a PL/SQL Block
SET SERVEROUTPUT ON;

DECLARE
    v_patient_id patients.patient_id%TYPE := 'P001';
    v_full_name VARCHAR2(120);
    v_insurance patients.insurance_provider%TYPE;
    v_paid_count NUMBER;
BEGIN
    SELECT first_name || ' ' || last_name, insurance_provider
    INTO v_full_name, v_insurance
    FROM patients
    WHERE patient_id = v_patient_id;

    SELECT COUNT(*)
    INTO v_paid_count
    FROM billing
    WHERE patient_id = v_patient_id
      AND payment_status = 'Paid';

    DBMS_OUTPUT.PUT_LINE('Patient: ' || v_full_name);
    DBMS_OUTPUT.PUT_LINE('Insurance Provider: ' || v_insurance);
    DBMS_OUTPUT.PUT_LINE('Paid Bills: ' || v_paid_count);
END;
/
