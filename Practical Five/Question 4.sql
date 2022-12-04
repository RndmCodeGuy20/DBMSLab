DECLARE
    V_NUM integer := 1;

BEGIN
    LOOP
        EXIT WHEN V_NUM > 10;
        IF (mod(V_NUM, 2) != 0) THEN
            dbms_output.put_line(V_NUM);
        END IF;

        V_NUM := V_NUM + 1;
    END LOOP;
END;