-- COMMIT;
-- SELECT *
-- FROM PARTICIPANT
-- ORDER BY PID DESC;

-- HAVING COUNT <= 1
SELECT COUNT(*) "NUM OF PARTICIPANTS", CID "COURSE"
FROM PARTICIPANT
GROUP BY CID
HAVING COUNT(*) <= 1;

SELECT *
FROM PARTICIPANT;

COMMIT;

SELECT *
FROM COURSE
ORDER BY CID ASC;

SELECT *
FROM PARTICIPANT
ORDER BY PID ASC;
--          NATURAL JOIN PARTICIPANT
-- ORDER BY CID ASC;

SELECT USERNAME
FROM ALL_USERS;

SELECT DISTINCT JOB
FROM EMP;

SELECT *
FROM EMP
WHERE DEPTNO = 10;

SELECT *
FROM EMP
WHERE COMM IS NOT NULL
;

SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS;

SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('PARTICIPANT', 'COURSE');


ALTER TABLE COURSE
    MODIFY CID NUMBER(4);

ALTER TABLE COURSE
    MODIFY CNAME VARCHAR2(40);

DELETE
FROM PARTICIPANT
WHERE CID = 101;

DROP TABLE PARTICIPANT PURGE;

-- ALTER TABLE COURSE
--     DROP COLUMN DEPTNAME;

UPDATE COURSE
SET CNAME  = 'QM',
    CREDIT = 3
WHERE CID = 105;