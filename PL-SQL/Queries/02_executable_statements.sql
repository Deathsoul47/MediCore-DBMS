-- PL/SQL 02: Writing Executable Statements
SET SERVEROUTPUT ON;

DECLARE
    v_patient_id billing.patient_id%TYPE := 'P001';
    v_total NUMBER(12,2);
    v_status VARCHAR2(30);
BEGIN
    SELECT NVL(SUM(amount), 0)
    INTO v_total
    FROM billing
    WHERE patient_id = v_patient_id;

    v_status := 'Calculated';
    v_total := ROUND(v_total, 2);

    DBMS_OUTPUT.PUT_LINE('Patient ID: ' || v_patient_id);
    DBMS_OUTPUT.PUT_LINE('Total Billing Amount: ' || TO_CHAR(v_total, 'FM9999990.00'));
    DBMS_OUTPUT.PUT_LINE('Status: ' || v_status);
END;
/
