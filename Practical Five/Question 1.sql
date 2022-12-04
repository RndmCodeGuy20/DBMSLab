-- Write a PL-SQL block to find greatest among three given numbers.

DECLARE
    V_NUM_1   NUMBER := &V_NUM_1;
    V_NUM_2   NUMBER := &V_NUM_2;
    V_NUM_3   NUMBER := &V_NUM_3;
    V_MAX_NUM NUMBER;
BEGIN
    IF V_NUM_1 > V_NUM_2 AND V_NUM_1 > V_NUM_3 THEN
        V_MAX_NUM := V_NUM_1;
    ELSIF V_NUM_2 > V_NUM_3 AND V_NUM_2 > V_NUM_1 THEN
        V_MAX_NUM := V_NUM_2;
    ELSIF V_NUM_3 > V_NUM_1 AND V_NUM_3 > V_NUM_2 THEN
        V_MAX_NUM := V_NUM_3;
    END IF;

    DBMS_OUTPUT.PUT_LINE('MAXIMUM NUMBER : ' || V_MAX_NUM);
END;