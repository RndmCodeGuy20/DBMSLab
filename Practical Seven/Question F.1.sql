-- Q1. Write a function that reads date of birth of a person as argument and returns age of the person.

CREATE OR REPLACE FUNCTION RET_AGE(DOB IN DATE)
    RETURN NUMBER
    IS
    AGE NUMBER;
BEGIN
    SELECT MONTHS_BETWEEN(TRUNC(sysdate),
                          TO_DATE(DOB)
               ) / 365
    INTO AGE
    FROM DUAL;

    RETURN AGE;
END RET_AGE;

DECLARE
    RES NUMBER;
    DOB DATE := SYSDATE;
BEGIN
    RES := SHAN.RET_AGE(DOB => DOB);
    DBMS_OUTPUT.PUT_LINE('AGE OF EMPLOYEE : ' || RES);
END;
