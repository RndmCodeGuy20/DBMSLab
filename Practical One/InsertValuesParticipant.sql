-- INSERTING VALUES IN ORDER
INSERT INTO PARTICIPANT(PID, PNAME, GENDER, CID)
VALUES (1001, 'ANDY', 'M', 103);

-- INSERTING VALUES IN DIFFERENT ORDER
INSERT INTO PARTICIPANT(PNAME, PID, CID, GENDER)
VALUES ('ADRIAN', 1002, 101, 'M');

-- INSERTING WITHOUT PARAMETERS
INSERT INTO PARTICIPANT
VALUES (1003, 'BENEDICT', 'M', 105);

-- INSERTING MULTIPLE VALUES AT ONCE
INSERT ALL
    INTO PARTICIPANT
VALUES (1004, 'CHERRY', 'F', NULL)
INTO PARTICIPANT
VALUES (1005, 'FOSTER', 'M', 104)
INTO PARTICIPANT
VALUES (1006, 'MARTHA', 'F', 102)
SELECT *
FROM DUAL;

-- INSERTING MULTIPLE PARTICIPANTS IN ONE COURSE
INSERT INTO PARTICIPANT
VALUES (1007, 'LUCIFER', 'M', 103);

-- INSERTING ONE STUDENT IN DSA
INSERT INTO PARTICIPANT
VALUES (1008, 'AMENADIEL', 'M', 106);

-- INSERTING MORE VALUES IN THE PARTICIPANTS TABLE
INSERT ALL
    INTO PARTICIPANT
VALUES (1009, 'LAUREN', 'F', 104)
INTO PARTICIPANT
VALUES (1010, 'CHLOE', 'F', 102)
INTO PARTICIPANT
VALUES (1011, 'DAN', 'M', 101)
INTO PARTICIPANT
VALUES (1012, 'KEVIN', 'M', 105)
INTO PARTICIPANT
VALUES (1013, 'LESLEEY', 'F', 106)
INTO PARTICIPANT
VALUES (1014, 'MARCUS', 'M', 103)
INTO PARTICIPANT
VALUES (1015, 'TOM', 'M', 102)
INTO PARTICIPANT
VALUES (1016, 'RACHAEL', 'F', 106)
INTO PARTICIPANT
VALUES (1017, 'MALCOLM', 'M', 101)
INTO PARTICIPANT
VALUES (1018, 'BRIAN', 'M', 104)
INTO PARTICIPANT
VALUES (1019, 'STEWIE', 'M', 103)
INTO PARTICIPANT
VALUES (1020, 'PETER', 'M', 102)
INTO PARTICIPANT
VALUES (1021, 'LOIS', 'F', 106)
INTO PARTICIPANT
VALUES (1022, 'DEBRA', 'F', 105)
INTO PARTICIPANT
VALUES (1023, 'DEXTER', 'M', 103)
SELECT *
FROM DUAL;


COMMIT;