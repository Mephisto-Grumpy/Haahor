-- ======================================================================================================
-- USER_ID, FNAME, SNAME, USERNAME, PASSWORD, EMAIL, SEX
-- ======================================================================================================

-- U01 ณภัทร์ วรกิตติวงศ์ ballnapat ball1234 65050242@kmitl.ac.th M
-- U02 ณัฐพงศ์ พงศ์จารุมรณี bookhamhot book3345 65050295@kmitl.ac.th M
-- U03 นพกร แก้วสลับนิล pungrumpy punz6675 65050437@kmitl.ac.th M
-- U04 วริษา นาคเจือทอง risxcutie risa2234 65050810@kmitl.ac.th F
-- U05 ศิวกร บุญแก้ว oaklnwza oakz7764 65050877@kmitl.ac.th M

INSERT INTO USERS (USER_ID, FNAME, SNAME, USERNAME, PASSWORD, EMAIL, SEX) VALUES ('U01', 'ณภัทร์', 'วรกิตติวงศ์', 'ballnapat', 'ball1234', '65050242@kmitl.ac.th', 'M');
INSERT INTO USERS (USER_ID, FNAME, SNAME, USERNAME, PASSWORD, EMAIL, SEX) VALUES ('U02', 'ณัฐพงศ์', 'พงศ์จารุมรณี', 'bookhamhot', 'book3345', '65050295@kmitl.ac.th', 'M');
INSERT INTO USERS (USER_ID, FNAME, SNAME, USERNAME, PASSWORD, EMAIL, SEX) VALUES ('U03', 'นพกร', 'แก้วสลับนิล', 'pungrumpy', 'punz6675', '65050437@kmitl.ac.th', 'M');
INSERT INTO USERS (USER_ID, FNAME, SNAME, USERNAME, PASSWORD, EMAIL, SEX) VALUES ('U04', 'วริษา', 'นาคเจือทอง', 'risxcutie', 'risa2234', '65050810@kmitl.ac.th', 'F');
INSERT INTO USERS (USER_ID, FNAME, SNAME, USERNAME, PASSWORD, EMAIL, SEX) VALUES ('U05', 'ศิวกร', 'บุญแก้ว', 'oaklnwza', 'oakz7764', '65050877@kmitl.ac.th', 'M');

-- ======================================================================================================
-- Procedure
-- ======================================================================================================
CREATE OR REPLACE PROCEDURE add_user(
    p_user_id IN CHAR DEFAULT NULL,
    p_fname IN VARCHAR2 DEFAULT NULL,
    p_sname IN VARCHAR2 DEFAULT NULL,
    p_username IN CHAR DEFAULT NULL,
    p_password IN CHAR DEFAULT NULL,
    p_email IN CHAR DEFAULT NULL,
    p_sex IN CHAR DEFAULT NULL
) AS
BEGIN
    IF p_user_id IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('USER_ID IS NULL');
    END IF;

    IF p_fname IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('FNAME IS NULL');
    END IF;

    IF p_sname IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('SNAME IS NULL');
    END IF;

    IF p_username IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('USERNAME IS NULL');
    END IF;

    IF p_password IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('PASSWORD IS NULL');
    END IF;

    IF p_email IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('EMAIL IS NULL');
    END IF;

    IF p_sex IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('SEX IS NULL');
    END IF;

    BEGIN
        INSERT INTO USERS (USER_ID, FNAME, SNAME, USERNAME, PASSWORD, EMAIL, SEX)
        VALUES (p_user_id, p_fname, p_sname, p_username, p_password, p_email, p_sex);

        -- COMMIT;
        DBMS_OUTPUT.PUT_LINE('INSERT USER SUCCESSFUL');
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('ERROR: ' || SQLCODE || ' ' || SQLERRM);
    END;
END;

-- Use the procedure
EXECUTE add_user('U06', 'ศิวกร', 'บุญแก้ว', 'oaklnwza002', 'oakz7764', '65050877@kmitl.ac.th', 'M');
EXECUTE add_user('U07', 'ศิวกิต', 'บุญมี', 'kaolnwza', 'kaoz7764', 'siwakitlnwza@kmitl.ac.th', 'M');