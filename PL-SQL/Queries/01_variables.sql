-- PL/SQL 01: Declaring PL/SQL Variables
-- Dataset: hospital_management
SET SERVEROUTPUT ON;

DECLARE
    v_doctor_id doctors.doctor_id%TYPE := 'D001';
    v_name      VARCHAR2(100);
    v_specialization doctors.specialization%TYPE;
BEGIN
    SELECT first_name || ' ' || last_name, specialization
    INTO v_name, v_specialization
    FROM doctors
    WHERE doctor_id = v_doctor_id;

    DBMS_OUTPUT.PUT_LINE('Doctor ID: ' || v_doctor_id);
    DBMS_OUTPUT.PUT_LINE('Doctor Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Specialization: ' || v_specialization);
END;
/
