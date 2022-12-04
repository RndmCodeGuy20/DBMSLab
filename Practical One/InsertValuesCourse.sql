-- INSERTING VALUES IN ORDER
INSERT INTO COURSE (CID, CNAME, CREDIT)
VALUES (101, 'ML', 4);

-- INSERTING VALUES IN DIFFERENT ORDER
INSERT INTO COURSE (CNAME, CID, CREDIT)
VALUES ('DBMS', 102, 4);

-- INSERTING IN ORDER WITHOUT ANY PARAMETER
INSERT INTO COURSE
VALUES (103, 'AI', 4);

-- INSERTING MULTIPLE VALUES AT A TIME
INSERT ALL
    INTO COURSE
VALUES (104, 'OOP', 3)
INTO COURSE
VALUES (105, 'PY', 2)
INTO COURSE
VALUES (106, 'DSA', 4)
SELECT *
FROM DUAL;

COMMIT;