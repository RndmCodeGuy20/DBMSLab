-- You went to a video store and rented a DVD that is due in 3 days from the rental date. Input the rental date, rental month, and rental year. Calculate and print the return date, return month, and return year.

DECLARE
    V_DATE DATE;
BEGIN
    SELECT SYSDATE INTO V_DATE FROM DUAL;
    V_DATE := V_DATE + 3;
    DBMS_OUTPUT.PUT_LINE('RETURN DATE : ' || V_DATE);
END;