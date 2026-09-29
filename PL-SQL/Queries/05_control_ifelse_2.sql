SET SERVEROUTPUT ON;

DECLARE
    v_experience doctors.years_experience%TYPE;
    v_level VARCHAR2(20);
BEGIN
    SELECT years_experience
    INTO v_experience
    FROM doctors
    WHERE doctor_id = 'D004';

    IF v_experience >= 25 THEN
        v_level := 'Senior';
    ELSIF v_experience >= 15 THEN
        v_level := 'Experienced';
    ELSE
        v_level := 'Junior';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Doctor ID: D004');
    DBMS_OUTPUT.PUT_LINE('Experience: ' || v_experience || ' years');
    DBMS_OUTPUT.PUT_LINE('Doctor Level: ' || v_level);
END;
/
