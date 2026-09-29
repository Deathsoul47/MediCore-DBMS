SET SERVEROUTPUT ON;

DECLARE
    v_amount NUMBER := 7719.07;
    v_tax    NUMBER;
    v_total  NUMBER;
BEGIN
    v_tax := v_amount * 0.05;
    v_total := v_amount + v_tax;

    DBMS_OUTPUT.PUT_LINE('Billing Amount: ' || TO_CHAR(v_amount, 'FM9999990.00'));
    DBMS_OUTPUT.PUT_LINE('Tax (5%): ' || TO_CHAR(v_tax, 'FM9999990.00'));
    DBMS_OUTPUT.PUT_LINE('Total Amount: ' || TO_CHAR(v_total, 'FM9999990.00'));
END;
/
