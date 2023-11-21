-- ======================================================================================================
-- Tigger for calculated RATING from RATING TABLE 
-- ======================================================================================================
-- FOR REVIEW TABLE
CREATE OR REPLACE TRIGGER calculate_review_rating
AFTER INSERT OR UPDATE ON Rating
FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_total_rating NUMBER;
    v_num_ratings NUMBER;
    v_avg_rating NUMBER;
BEGIN
    -- Calculate the total rating for the specific review
    SELECT SUM(CLEANLINESS_RATE + COMFORT_RATE + WORTHINESS_RATE)
    INTO v_total_rating
    FROM Rating
    WHERE REVIEW_ID = :NEW.REVIEW_ID;

    -- Count the number of ratings for the specific review
    SELECT COUNT(*)
    INTO v_num_ratings
    FROM Rating
    WHERE REVIEW_ID = :NEW.REVIEW_ID;

    -- Calculate the average rating
    IF v_num_ratings > 0 THEN
        v_avg_rating := v_total_rating / (v_num_ratings * 3); -- Assuming 3 rating categories
    ELSE
        v_avg_rating := 0;
    END IF;

    -- Update the Review table with the calculated average rating
    UPDATE Review
    SET RATING_SCORE = v_avg_rating
    WHERE REVIEW_ID = :NEW.REVIEW_ID;

    -- Commit the changes in the autonomous transaction
    COMMIT;
END;

-- IF HAVE DATA IN TABLE
UPDATE Review R
SET RATING_SCORE = (
    SELECT NVL(AVG(RATING_SCORE), 0)
    FROM Rating R2
    WHERE R2.REVIEW_ID = R.REVIEW_ID
);

-- ======================================================================================================
-- Tigger for calculated RATING from REVIEW TABLE
-- ======================================================================================================
-- FOR DORMITORY TABLE
CREATE OR REPLACE TRIGGER calculate_dormitory_rating
AFTER INSERT OR UPDATE ON Review
FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    v_total_rating NUMBER;
    v_num_ratings NUMBER;
    v_avg_rating NUMBER;
BEGIN
    -- Calculate the total rating and count for the specific dormitory
    SELECT NVL(SUM(RATING), 0), NVL(COUNT(*), 0)
    INTO v_total_rating, v_num_ratings
    FROM Review
    WHERE DORM_ID = :NEW.DORM_ID;

    -- Calculate the average rating
    IF v_num_ratings > 0 THEN
        v_avg_rating := v_total_rating / v_num_ratings;
    ELSE
        v_avg_rating := 0;
    END IF;

    -- Update the Dormitory table with the calculated average rating
    UPDATE Dormitory
    SET RATING_SCORE = v_avg_rating
    WHERE DORM_ID = :NEW.DORM_ID;

    -- Commit the changes in the autonomous transaction
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        NULL; -- To handle exceptions gracefully
END;

-- IF HAVE DATA IN TABLE
UPDATE Dormitory D
SET RATING_SCORE = (
    SELECT NVL(AVG(RATING_SCORE), 0)
    FROM Review R
    WHERE R.DORM_ID = D.DORM_ID
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