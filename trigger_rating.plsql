-- ======================================================================================================
-- Tigger for calculated RATING from RATING TABLE 
-- ======================================================================================================
-- FOR REVIEW TABLE
CREATE OR REPLACE TRIGGER calculate_review_rating
AFTER INSERT OR UPDATE OR DELETE ON RATING
FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_total_rating NUMBER;
    v_num_ratings NUMBER;
    v_avg_rating FLOAT;
BEGIN
    -- Calculate the total rating for the specific review
    SELECT SUM(CLEANLINESS_RATE + COMFORT_RATE + WORTHINESS_RATE), NVL(COUNT(*), 0)
    INTO v_total_rating, v_num_ratings
    FROM Rating
    WHERE REVIEW_ID = :NEW.REVIEW_ID;

    -- Calculate the average rating
    IF v_num_ratings > 0 THEN
        v_avg_rating := v_total_rating / (v_num_ratings * 3); -- Assuming 3 rating categories and a scale of 1 to 5 for each
    ELSE
        v_avg_rating := 0;
    END IF;

    -- Log calculated values
    DBMS_OUTPUT.PUT_LINE('Review ID: ' || :NEW.REVIEW_ID || ', Total Rating: ' || v_total_rating || ', Num Ratings: ' || v_num_ratings || ', Avg Rating: ' || v_avg_rating);

    -- Update the Review table with the calculated average rating
    BEGIN
        UPDATE Review
        SET RATING_SCORE = ROUND(v_avg_rating, 1)
        WHERE REVIEW_ID = :NEW.REVIEW_ID;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Rating updated successfully for REVIEW_ID: ' || :NEW.REVIEW_ID);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No data found for REVIEW_ID: ' || :NEW.REVIEW_ID);
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating rating for REVIEW_ID: ' || :NEW.REVIEW_ID);
    END;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Trigger error for REVIEW_ID: ' || :NEW.REVIEW_ID);
END;

-- IF HAVE DATA IN TABLE
UPDATE Review R
SET RATING_SCORE = ROUND(
    (
        SELECT NVL(AVG(R.RATING_SCORE), 0)
        FROM Rating R2
        WHERE R2.REVIEW_ID = R.REVIEW_ID
    ), 1
);

-- ======================================================================================================
-- Tigger for calculated RATING from REVIEW TABLE
-- ======================================================================================================
-- FOR DORMITORY TABLE
CREATE OR REPLACE TRIGGER calculate_dormitory_rating
AFTER INSERT OR UPDATE OR DELETE ON Review
FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_total_rating NUMBER;
    v_num_ratings NUMBER;
    v_avg_rating FLOAT;
BEGIN
    -- Calculate the total rating and count for the specific dormitory
    SELECT NVL(SUM(RATING_SCORE), 0), NVL(COUNT(*), 0)
    INTO v_total_rating, v_num_ratings
    FROM Review
    WHERE DORM_ID = :NEW.DORM_ID;

    -- Calculate the average rating
    IF v_num_ratings > 0 THEN
        v_avg_rating := v_total_rating / v_num_ratings;
    ELSE
        v_avg_rating := 0;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Dormitory ID: ' || :NEW.DORM_ID || ', Total Rating: ' || v_total_rating || ', Num Ratings: ' || v_num_ratings || ', Avg Rating: ' || v_avg_rating);

    -- Update the Dormitory table with the calculated average rating
    BEGIN
        UPDATE Dormitory
        SET RATING_SCORE = ROUND(v_avg_rating, 1)
        WHERE DORM_ID = :NEW.DORM_ID;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Dormitory rating updated successfully for DORM_ID: ' || :NEW.DORM_ID);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No data found for DORM_ID: ' || :NEW.DORM_ID);
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error updating dormitory rating for DORM_ID: ' || :NEW.DORM_ID);
    END;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Trigger error for DORM_ID: ' || :NEW.DORM_ID);
END;

-- IF HAVE DATA IN TABLE
UPDATE Dormitory D
SET RATING_SCORE = ROUND(
    (
        SELECT NVL(AVG(RATING_SCORE), 0)
        FROM Review R
        WHERE R.DORM_ID = D.DORM_ID
    ), 1
);

-- ======================================================================================================
-- DEBUG
-- ======================================================================================================
-- Show all triggers
SELECT * FROM USER_TRIGGERS;

-- Show errors
SHOW ERRORS TRIGGER calculate_review_rating;
SHOW ERRORS TRIGGER calculate_dormitory_rating;

-- Drop
DROP TRIGGER calculate_review_rating;
DROP TRIGGER calculate_dormitory_rating;