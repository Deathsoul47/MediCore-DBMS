SET SERVEROUTPUT ON;

DECLARE
    v_patient_id patients.patient_id%TYPE := 'P005';
    v_total_bill NUMBER(12,2);
    v_paid_bills NUMBER;
BEGIN
    SELECT NVL(SUM(amount), 0)
    INTO v_total_bill
    FROM billing
    WHERE patient_id = v_patient_id;

    SELECT COUNT(*)
    INTO v_paid_bills
    FROM billing
    WHERE patient_id = v_patient_id
      AND payment_status = 'Paid';

    DBMS_OUTPUT.PUT_LINE('Patient ID: ' || v_patient_id);
    DBMS_OUTPUT.PUT_LINE('Total Bill: ' || TO_CHAR(v_total_bill, 'FM9999990.00'));
    DBMS_OUTPUT.PUT_LINE('Paid Bills: ' || v_paid_bills);
END;
/
