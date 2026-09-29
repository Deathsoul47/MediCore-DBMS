-- PL/SQL 04: Control Structures
SET SERVEROUTPUT ON;

DECLARE
    v_avg_cost NUMBER(12,2);
    v_category VARCHAR2(30);
BEGIN
    SELECT AVG(cost)
    INTO v_avg_cost
    FROM treatments;

    IF v_avg_cost >= 3000 THEN
        v_category := 'High';
    ELSIF v_avg_cost >= 2000 THEN
        v_category := 'Medium';
    ELSE
        v_category := 'Low';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Average Treatment Cost: ' ||
                         TO_CHAR(ROUND(v_avg_cost,2), 'FM9999990.00'));
    DBMS_OUTPUT.PUT_LINE('Cost Category: ' || v_category);

    FOR i IN 1..3 LOOP
        DBMS_OUTPUT.PUT_LINE('Loop iteration: ' || i);
    END LOOP;
END;
/
