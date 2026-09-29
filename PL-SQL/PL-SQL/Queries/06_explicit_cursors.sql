-- PL/SQL 06: Using Explicit Cursors
SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_pediatrics IS
        SELECT doctor_id, first_name || ' ' || last_name AS doctor_name,
               years_experience
        FROM doctors
        WHERE specialization = 'Pediatrics'
        ORDER BY doctor_id;

    v_id doctors.doctor_id%TYPE;
    v_name VARCHAR2(120);
    v_exp doctors.years_experience%TYPE;
BEGIN
    OPEN c_pediatrics;

    LOOP
        FETCH c_pediatrics INTO v_id, v_name, v_exp;
        EXIT WHEN c_pediatrics%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_id || ' | ' || v_name ||
                             ' | ' || v_exp || ' years');
    END LOOP;

    CLOSE c_pediatrics;
END;
/
