SET SERVEROUTPUT ON;

-- ============================================================
-- Implicit Cursor: Patient Billing Summary
-- Uses a cursor FOR loop — Oracle automatically opens,
-- fetches each row, and closes the cursor.
-- Lists every patient who has at least one 'Pending' bill,
-- along with the count and total amount of their pending bills.
-- ============================================================

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Patients with Pending Bills ---');
    DBMS_OUTPUT.PUT_LINE('Patient ID | Name               | Pending Count | Total Pending');
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------');

    FOR rec IN (
        SELECT p.patient_id,
               p.first_name || ' ' || p.last_name AS patient_name,
               COUNT(b.bill_id)                    AS pending_count,
               SUM(b.amount)                       AS total_pending
        FROM   patients p
        JOIN   billing  b ON p.patient_id = b.patient_id
        WHERE  b.payment_status = 'Pending'
        GROUP  BY p.patient_id, p.first_name, p.last_name
        ORDER  BY total_pending DESC
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            rec.patient_id   || ' | ' ||
            RPAD(rec.patient_name, 18) || ' | ' ||
            LPAD(rec.pending_count, 13) || ' | ' ||
            LPAD(TO_CHAR(rec.total_pending, 'FM99999.00'), 13)
        );
    END LOOP;
END;
/
