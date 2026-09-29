SET SERVEROUTPUT ON;

DECLARE
    v_patient patients%ROWTYPE;
BEGIN
    SELECT *
    INTO v_patient
    FROM patients
    WHERE patient_id = 'P005';

    DBMS_OUTPUT.PUT_LINE('Patient ID: ' || v_patient.patient_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' ||
                         v_patient.first_name || ' ' || v_patient.last_name);
    DBMS_OUTPUT.PUT_LINE('Gender: ' || v_patient.gender);
    DBMS_OUTPUT.PUT_LINE('Insurance: ' || v_patient.insurance_provider);
END;
/
