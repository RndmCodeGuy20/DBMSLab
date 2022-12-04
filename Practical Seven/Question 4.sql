-- Q1. Write a function that reads date of birth of a person as argument and returns age of the person.

CREATE FUNCTION RET_AGE(DOB IN DATE)
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

BEGIN

END;
