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

-- ==================================================
-- Procedure to check table is empty in oracle db
-- ==================================================
CREATE OR REPLACE PROCEDURE check_table_empty
(
    p_table_name IN VARCHAR2,
    p_count OUT NUMBER
)
AS
    v_sql VARCHAR2(1000);
BEGIN
    -- Dynamically create the SQL statement using the provided table name
    v_sql := 'SELECT COUNT(*) FROM ' || p_table_name;
    
    -- Execute immediate to run the dynamically created SQL
    EXECUTE IMMEDIATE v_sql INTO p_count;
    
    -- You can add exception handling here if needed
EXCEPTION
    WHEN OTHERS THEN
        -- Handle exceptions accordingly
        p_count := -1; -- or set an appropriate error value
END;

-- Use procedure to check table is empty in oracle db
DECLARE
    v_count NUMBER;
BEGIN
    check_table_empty('table_name', v_count);
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Table is empty');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Table is not empty');
    END IF;
END;