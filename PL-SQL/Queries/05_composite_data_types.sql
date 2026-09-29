-- PL/SQL 05: Composite Data Types
SET SERVEROUTPUT ON;

DECLARE
    -- Record based on the DOCTORS table
    v_doctor doctors%ROWTYPE;

    -- Associative array of patient names
    TYPE patient_name_array IS TABLE OF VARCHAR2(120)
        INDEX BY PLS_INTEGER;
    v_names patient_name_array;
BEGIN
    SELECT *
    INTO v_doctor
    FROM doctors
    WHERE doctor_id = 'D001';

    DBMS_OUTPUT.PUT_LINE('Record -> Doctor: ' ||
                         v_doctor.first_name || ' ' || v_doctor.last_name);
    DBMS_OUTPUT.PUT_LINE('Record -> Branch: ' || v_doctor.hospital_branch);

    SELECT first_name || ' ' || last_name
    BULK COLLECT INTO v_names
    FROM patients
    WHERE patient_id IN ('P001','P002','P003')
    ORDER BY patient_id;

    FOR i IN 1..v_names.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE('Array[' || i || ']: ' || v_names(i));
    END LOOP;
END;
/
