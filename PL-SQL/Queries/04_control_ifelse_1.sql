SET SERVEROUTPUT ON;

DECLARE
    v_total_bill NUMBER(12,2);
    v_category VARCHAR2(20);
BEGIN
    SELECT NVL(SUM(amount), 0)
    INTO v_total_bill
    FROM billing
    WHERE patient_id = 'P005';

    IF v_total_bill >= 15000 THEN
        v_category := 'High';
    ELSIF v_total_bill >= 10000 THEN
        v_category := 'Medium';
    ELSE
        v_category := 'Low';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Patient ID: P005');
    DBMS_OUTPUT.PUT_LINE('Total Bill: ' || TO_CHAR(v_total_bill, 'FM9999990.00'));
    DBMS_OUTPUT.PUT_LINE('Billing Category: ' || v_category);
END;
/
