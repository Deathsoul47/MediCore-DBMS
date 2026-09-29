SET SERVEROUTPUT ON;

DECLARE
    v_specialization doctors.specialization%TYPE;
BEGIN
    SELECT specialization
    INTO v_specialization
    FROM doctors
    WHERE specialization = 'Pediatrics';

    DBMS_OUTPUT.PUT_LINE('Specialization: ' || v_specialization);

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Exception: TOO_MANY_ROWS');
        DBMS_OUTPUT.PUT_LINE('More than one Pediatrics doctor was found.');
END;
/
