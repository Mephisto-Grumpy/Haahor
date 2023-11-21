-- ================================================
-- Create Table
-- ================================================
-- User
CREATE TABLE
    USERS (
        USER_ID CHAR (10) NOT NULL, -- Primary Key
        FNAME VARCHAR2 (50) NOT NULL,
        SNAME VARCHAR2 (50) NOT NULL,
        USERNAME CHAR (50) NOT NULL,
        PASSWORD CHAR (50) NOT NULL,
        EMAIL CHAR (50) NOT NULL,
        SEX CHAR (1) NOT NULL, -- (M/F)
        -- Add CONSTRAINT
        CONSTRAINT PK_USERS PRIMARY KEY (USER_ID)
    );

-- Login Activity
CREATE TABLE
    LOGIN_ACTIVITY (
        SESSION_ID CHAR (20) NOT NULL, -- Primary Key
        USER_ID CHAR (10) NOT NULL, -- Foreign Key
        LOGIN_TIME DATE NOT NULL,
        IP_ADDRESS CHAR (16) NOT NULL,
        -- Add CONSTRAINT
        CONSTRAINT PK_LOGIN_ACTIVITY PRIMARY KEY (SESSION_ID),
        CONSTRAINT FK_LOGIN_USER FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID)
    );

-- Zone
CREATE TABLE
    ZONE (
        ZONE_ID CHAR (10) NOT NULL, -- Primary Key
        NAME CHAR (50) NOT NULL,
        -- Add CONSTRAINT
        CONSTRAINT PK_ZONE PRIMARY KEY (ZONE_ID)
    );

-- Zone Landmark
CREATE TABLE
    ZONE_LANDMARK (
        ZONE_ID CHAR (10) NOT NULL, -- Primary Key
        LANDMARK CHAR (50) NOT NULL,
        -- Add CONSTRAINT
        CONSTRAINT PK_ZONE_LANDMARK PRIMARY KEY (ZONE_ID, LANDMARK),
        CONSTRAINT FK_ZONE_LANDMARK_ZONE FOREIGN KEY (ZONE_ID) REFERENCES ZONE (ZONE_ID)
    );

-- Dormitory
CREATE TABLE
    DORMITORY (
        DORM_ID CHAR (10) NOT NULL, -- Primary Key
        ZONE_ID CHAR (10) NOT NULL, -- Foreign Key
        NAME CHAR (50) NOT NULL,
        LATITUDE CHAR (20) NOT NULL,
        LONGITUDE CHAR (20) NOT NULL,
        PHONE_NUMBER CHAR (50) NOT NULL,
        -- Rating Calculated
        RATING_SCORE FLOAT, -- Use Trigger
        -- Add CONSTRAINT
        CONSTRAINT PK_DORMITORY PRIMARY KEY (DORM_ID),
        CONSTRAINT FK_DORM_ZONE FOREIGN KEY (ZONE_ID) REFERENCES ZONE (ZONE_ID)
    );

-- Room
CREATE TABLE
    ROOM (
        ROOM_ID CHAR (10) NOT NULL, -- Primary Key
        DORM_ID CHAR (10) NOT NULL, -- Foreign Key
        ROOM_TYPE CHAR (50) NOT NULL,
        ROOM_PRICE NUMBER (10) NOT NULL,
        -- Add CONSTRAINT
        CONSTRAINT PK_ROOM PRIMARY KEY (ROOM_ID),
        CONSTRAINT FK_ROOM_DORM FOREIGN KEY (DORM_ID) REFERENCES DORMITORY (DORM_ID)
    );

-- Facility
CREATE TABLE
    FACILITY (
        FACILITY_ID CHAR (10) NOT NULL, -- Primary Key
        DORM_ID CHAR (10) NOT NULL, -- Foreign Key
        FACILITY_NAME CHAR (100) NOT NULL,
        ADD_ON CHAR (1) NOT NULL, -- (Y/N)
        -- Add CONSTRAINT
        CONSTRAINT PK_FACILITY PRIMARY KEY (FACILITY_ID),
        CONSTRAINT FK_FACILITY_DORM FOREIGN KEY (DORM_ID) REFERENCES DORMITORY (DORM_ID)
    );

-- Review
CREATE TABLE
    REVIEW (
        REVIEW_ID CHAR (10) NOT NULL, -- Primary Key
        USER_ID CHAR (10) NOT NULL, -- Foreign Key
        DORM_ID CHAR (10) NOT NULL, -- Foreign Key
        REVIEW_COMMENT CHAR (500) NOT NULL,
        -- Rating Calculated
        RATING_SCORE FLOAT, -- Use Trigger
        -- Add CONSTRAINT
        CONSTRAINT PK_REVIEW PRIMARY KEY (REVIEW_ID),
        CONSTRAINT FK_REVIEW_USER FOREIGN KEY (USER_ID) REFERENCES USERS (USER_ID),
        CONSTRAINT FK_REVIEW_DORM FOREIGN KEY (DORM_ID) REFERENCES DORMITORY (DORM_ID)
    );

-- Rating
CREATE TABLE
    RATING (
        RATING_ID VARCHAR2 (20) NOT NULL, -- Primary Key
        REVIEW_ID CHAR (10) NOT NULL, -- Foreign Key
        CLEANLINESS_RATE NUMBER (10) NOT NULL,
        COMFORT_RATE NUMBER (10) NOT NULL,
        WORTHINESS_RATE NUMBER (10) NOT NULL,
        -- Add CONSTRAINT
        CONSTRAINT PK_RATING PRIMARY KEY (RATING_ID),
        CONSTRAINT FK_RATING_REVIEW FOREIGN KEY (REVIEW_ID) REFERENCES REVIEW (REVIEW_ID)
    );

-- ================================================
-- Check all PK and FK
-- ================================================
SELECT * FROM USER_CONSTRAINTS;

-- ================================================
-- See details of the table
-- ================================================
DESC DORMITORY;
DESC USERS;
DESC REVIEW;
DESC LOGIN_ACTIVITY;
DESC RATING;
DESC ZONE;
DESC ZONE_LANDMARK;
DESC ROOM;
DESC FACILITY;

-- ================================================
-- Drop Table
-- ================================================
DROP TABLE DORMITORY;
DROP TABLE USERS;
DROP TABLE REVIEW;
DROP TABLE LOGIN_ACTIVITY;
DROP TABLE RATING;
DROP TABLE ZONE;
DROP TABLE ZONE_LANDMARK;
DROP TABLE ROOM;
DROP TABLE FACILITY;

-- ================================================
-- Clear BIN - After Drop Table
-- ================================================
PURGE RECYCLEBIN;