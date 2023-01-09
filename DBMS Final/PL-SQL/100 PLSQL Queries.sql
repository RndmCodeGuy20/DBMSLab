DECLARE
    V_NUM NUMBER := &V_NUM;
BEGIN
    DBMS_OUTPUT.PUT_LINE('YOUR INPUT WAS : ' || V_NUM);
END;


DECLARE
    V_NUM_SMALL NUMBER := &V_NUM_SMALL;
    V_NUM_LARGE NUMBER := &V_NUM_LARGE;
    V_NUM_TEMP  NUMBER;
BEGIN
    IF V_NUM_SMALL > V_NUM_LARGE THEN
        V_NUM_TEMP := V_NUM_SMALL;
        V_NUM_SMALL := V_NUM_LARGE;
        V_NUM_LARGE := V_NUM_TEMP;
    END IF;

    DBMS_OUTPUT.PUT_LINE('SMALLER NUMBER : ' || V_NUM_SMALL);
    DBMS_OUTPUT.PUT_LINE('LARGER NUMBER : ' || V_NUM_LARGE);
END;


DECLARE
    n NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('The value of n inside the loop is: ' || TO_CHAR(n));
        n := n + 1;
        EXIT WHEN n > 5;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('The value of n after exit from the loop is: ' || TO_CHAR(n));
END;


DECLARE
    N NUMBER := 1;
BEGIN
    LOOP
        N := N + 3;
        DBMS_OUTPUT.PUT_LINE(N);

        EXIT WHEN N > 12;
    END LOOP;
END;

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

DECLARE
    V_NUM integer := 1;
BEGIN
    LOOP
        EXIT WHEN V_NUM > 10;
        IF (mod(V_NUM, 2) != 0) THEN
            DBMS_OUTPUT.PUT_LINE(V_NUM);
        END IF;
        V_NUM := V_NUM + 1;
    END LOOP;
END;

DECLARE
    V_NUM integer := 1;
BEGIN
    WHILE V_NUM <= 10
        LOOP
            IF (mod(V_NUM, 2) != 0) THEN
                DBMS_OUTPUT.PUT_LINE(V_NUM);
            END IF;
            V_NUM := V_NUM + 1;
        END LOOP;
END;