-- CREATE SET 1 OF PARTICIPANTS TABLE
CREATE TABLE PARTICIPANT_1 AS
SELECT *
FROM PARTICIPANT
WHERE PID IN (1001, 1002, 1003, 1005);
-- SHOW PARTICIPANT_1
SELECT *
FROM PARTICIPANT_1;

-- CREATE SET 2 OF PARTICIPANTS TABLE
CREATE TABLE PARTICIPANT_2 AS
SELECT *
FROM PARTICIPANT
WHERE PID IN (1004, 1005, 1006, 1007);
-- SHOW PARTICIPANT_2
SELECT *
FROM PARTICIPANT_2;

-- CROSS JOIN ON P1 AND P2
SELECT *
FROM PARTICIPANT_1 P1
         CROSS JOIN PARTICIPANT_2 P2;

-- EQUI JOIN ON P1 AND P2
SELECT *
FROM PARTICIPANT_1 P1
         JOIN PARTICIPANT_2 P2 ON P1.PID = P2.PID;

-- EQUI JOIN ON P1 AND P2
SELECT *
FROM PARTICIPANT_1 P1
   , PARTICIPANT_2 P2
WHERE P1.PID = P2.PID;

-- NATURAL JOIN ON P1 AND P2
SELECT *
FROM PARTICIPANT_1 P1
         NATURAL JOIN PARTICIPANT_2 P2;

-- LEFT OUTER JOIN ON P1 AND P2
SELECT *
FROM PARTICIPANT_1 P1
         LEFT OUTER JOIN PARTICIPANT_2 P2 ON P1.PID = P2.PID;

-- LEFT OUTER JOIN ON P1 AND P2 W/O KEYWORD
SELECT *
FROM PARTICIPANT_1 P1,
     PARTICIPANT_2 P2
WHERE P1.PID = P2.PID (+);

-- RIGHT OUTER JOIN ON P1 AND P2
SELECT *
FROM PARTICIPANT_1 P1
         RIGHT OUTER JOIN PARTICIPANT_2 P2 ON P1.PID = P2.PID;

-- RIGHT OUTER JOIN ON P1 AND P2 W/O KEYWORD
SELECT *
FROM PARTICIPANT_1 P1,
     PARTICIPANT_2 P2
WHERE P1.PID (+) = P2.PID;

-- FULL OUTER JOIN ON P1 AND P2
SELECT *
FROM PARTICIPANT_1 P1
         FULL OUTER JOIN PARTICIPANT_2 P2 ON P1.PID = P2.PID
ORDER BY P1.PID ASC;

-- FULL OUTER JOIN ON P1 AND P2 W/O KEYWORD !!! WILL GIVE AN ERROR
SELECT *
FROM PARTICIPANT_1 P1,
     PARTICIPANT_2 P2
WHERE P1.PID (+) = P2.PID (+);
