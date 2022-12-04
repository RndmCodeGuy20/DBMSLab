-- Input a number with a substitution variable, and then print its multiplication table using a While loop.

DECLARE
    V_NUM     NUMBER  := &V_NUM;
    V_COUNTER INTEGER := 1;
BEGIN
    WHILE V_COUNTER <= 10
        LOOP
            DBMS_OUTPUT.PUT_LINE(V_NUM || ' X ' || V_COUNTER || ' = ' || V_NUM * V_COUNTER);
            V_COUNTER := V_COUNTER + 1;
        END LOOP;
END;