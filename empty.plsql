-- Check table is empty in oracle db
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM table_name;
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Table is empty');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Table is not empty');
    END IF;
END;