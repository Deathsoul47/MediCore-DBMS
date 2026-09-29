-- PL/SQL 07: Handling Exceptions
SET SERVEROUTPUT ON;

DECLARE
    v_name VARCHAR2(120);
BEGIN
    -- P999 does not exist in the supplied dataset.
    SELECT first_name || ' ' || last_name
    INTO v_name
    FROM patients
    WHERE patient_id = 'P999';

    DBMS_OUTPUT.PUT_LINE('Patient: ' || v_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Exception handled: NO_DATA_FOUND');
        DBMS_OUTPUT.PUT_LINE('Patient P999 was not found.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Exception handled: TOO_MANY_ROWS');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Other exception: ' || SQLERRM);
END;
/
