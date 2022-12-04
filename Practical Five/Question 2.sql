-- Write a PL-SQL block to find out if a year is a leap year.(A leap year is divisible by 4 but not by 100,or it is divisible by 400)

DECLARE
    V_DATE_INP NUMBER := &V_DATE_INP;
BEGIN
    IF ((MOD(V_DATE_INP, 2) = 0) OR (MOD(V_DATE_INP, 200) = 0)) AND NOT (MOD(V_DATE_INP, 100) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('THE GIVEN YEAR : ' || V_DATE_INP || ' IS A LEAP YEAR');
    ELSE
        DBMS_OUTPUT.PUT_LINE('THE GIVEN YEAR : ' || V_DATE_INP || ' IS NOT A LEAP YEAR');
    END IF;
END;