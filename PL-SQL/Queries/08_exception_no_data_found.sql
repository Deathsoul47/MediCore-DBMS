SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(100);
BEGIN
    SELECT first_name || ' ' || last_name
    INTO v_name
    FROM patients
    WHERE patient_id = 'P999';

    DBMS_OUTPUT.PUT_LINE('Patient: ' || v_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Exception: NO_DATA_FOUND');
        DBMS_OUTPUT.PUT_LINE('Patient P999 does not exist.');
END;
/
