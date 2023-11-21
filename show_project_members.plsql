-- ==================================================
-- Create a table
-- ==================================================
-- Project
CREATE TABLE projects (
    project_id NUMBER PRIMARY KEY,
    project_name VARCHAR2(100)
);

INSERT INTO projects(project_id, project_name) VALUES(1, 'Haahor');

-- Project Members
CREATE TABLE project_members (
    member_id NUMBER PRIMARY KEY,
    project_id NUMBER,
    member_name VARCHAR2(100),
    CONSTRAINT FK_PROJECT_ID FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- ==================================================
-- Create a procedure
-- ==================================================
-- Procedure to add a project member
CREATE OR REPLACE PROCEDURE add_project_member(
    p_member_id IN NUMBER,
    p_project_id IN NUMBER,
    p_member_name IN VARCHAR2
)
IS
BEGIN
    INSERT INTO project_members(member_id, project_id, member_name)
    VALUES(p_member_id, p_project_id, p_member_name);

    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Member ' || p_member_name || ' added to Project ' || p_project_id);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        ROLLBACK;
END;

-- Procedure to show all project members
CREATE OR REPLACE PROCEDURE show_all_project_members
IS
    v_members_list VARCHAR2(1000);
BEGIN
    FOR project_rec IN (SELECT DISTINCT pm.project_id, p.project_name
                        FROM project_members pm
                        JOIN projects p ON pm.project_id = p.project_id) LOOP
        v_members_list := '';

        FOR member_rec IN (SELECT member_name
                           FROM project_members
                           WHERE project_id = project_rec.project_id) LOOP
            v_members_list := v_members_list || member_rec.member_name || ', ';
        END LOOP;

        v_members_list := RTRIM(v_members_list, ', ');

        IF v_members_list IS NOT NULL THEN
            DBMS_OUTPUT.PUT_LINE('Project ID: ' || project_rec.project_id || ', Project Name: ' || project_rec.project_name || ', Members: ' || v_members_list);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Project ID: ' || project_rec.project_id || ', Project Name: ' || project_rec.project_name || ', No members found');
        END IF;
    END LOOP;
END;

-- Show Error
SHOW ERRORS PROCEDURE add_project_member;
SHOW ERRORS PROCEDURE show_all_project_members;

-- ==================================================
-- Use the procedure
-- ==================================================
-- Add project members
BEGIN
    add_project_member(65050242, 1, 'ณภัทร์ วรกิตติวงศ์');
    add_project_member(65050295, 1, 'ณัฐพงศ์ พงศ์จารุมรณี');
    add_project_member(65050437, 1, 'นพกร แก้วสลับนิล');
    add_project_member(65050810, 1, 'วริษา นาคเจือทอง');
    add_project_member(65050877, 1, 'ศิวกร บุญแก้ว');

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('All members added');
END;

-- Show all project members
SET SERVEROUTPUT ON;

-- Option 1
BEGIN
    show_all_project_members;
END;

-- Option 2
EXEC show_all_project_members;