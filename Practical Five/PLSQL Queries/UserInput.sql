-- Taking user input in variables.

DECLARE
    V_NAME VARCHAR2(20) := &V_NAME;
    V_AGE  NUMBER       := &V_AGE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('HEY! I AM ' || V_NAME || ', ' || V_AGE);
END;