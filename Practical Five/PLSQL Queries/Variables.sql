-- Variable in PLSQL

DECLARE
    V_AGE  NUMBER       := 20;
    V_NAME VARCHAR2(20) := 'SHANTANU';
BEGIN
    DBMS_OUTPUT.PUT_LINE('HEY! I AM ' || V_NAME || ', ' || V_AGE);
END;