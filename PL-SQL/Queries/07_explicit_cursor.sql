SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_doctors IS
        SELECT doctor_id,
               first_name || ' ' || last_name AS doctor_name,
               years_experience
        FROM doctors
        WHERE specialization = 'Pediatrics'
        ORDER BY doctor_id;

    v_id   doctors.doctor_id%TYPE;
    v_name VARCHAR2(100);
    v_exp  doctors.years_experience%TYPE;
BEGIN
    OPEN c_doctors;

    LOOP
        FETCH c_doctors INTO v_id, v_name, v_exp;
        EXIT WHEN c_doctors%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_id || ' | ' || v_name || ' | ' || v_exp || ' years'
        );
    END LOOP;

    CLOSE c_doctors;
END;
/
