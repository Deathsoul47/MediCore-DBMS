SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE show_patient_bill(
    p_patient_id IN billing.patient_id%TYPE
)
IS
    v_total NUMBER(12,2);
BEGIN
    SELECT NVL(SUM(amount), 0)
    INTO v_total
    FROM billing
    WHERE patient_id = p_patient_id;

    DBMS_OUTPUT.PUT_LINE('Patient ID: ' || p_patient_id);
    DBMS_OUTPUT.PUT_LINE('Total Bill: ' ||
                         TO_CHAR(v_total, 'FM9999990.00'));
END;
/

CREATE OR REPLACE FUNCTION get_paid_bill_count(
    p_patient_id IN billing.patient_id%TYPE
)
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM billing
    WHERE patient_id = p_patient_id
      AND payment_status = 'Paid';

    RETURN v_count;
END;
/

BEGIN
    show_patient_bill('P005');

    DBMS_OUTPUT.PUT_LINE(
        'Paid Bill Count: ' || get_paid_bill_count('P005')
    );
END;
/
