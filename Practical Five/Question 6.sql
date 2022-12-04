DECLARE
    V_NUM_1 NUMBER := &V_NUM_1;
    V_NUM2  NUMBER := &V_NUM_2;
    V_TEMP  NUMBER;

BEGIN
    V_TEMP := V_NUM_1;
    V_NUM_1 := V_NUM2;
    V_NUM2 := V_TEMP;
    DBMS_OUTPUT.PUT_LINE('Swapped Numbers : ' || V_NUM_1 || V_NUM2);
END;