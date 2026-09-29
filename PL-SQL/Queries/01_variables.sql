SET SERVEROUTPUT ON;

DECLARE
    v_patient_id patients.patient_id%TYPE := 'P001';
    v_name      VARCHAR2(100);
    v_insurance patients.insurance_provider%TYPE;
BEGIN
    SELECT first_name || ' ' || last_name, insurance_provider
    INTO v_name, v_insurance
    FROM patients
    WHERE patient_id = v_patient_id;

    DBMS_OUTPUT.PUT_LINE('Patient ID: ' || v_patient_id);
    DBMS_OUTPUT.PUT_LINE('Patient Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Insurance: ' || v_insurance);
END;
/
