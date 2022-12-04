-- Write a PL-SQL block using cursor to print bottom five employees as per sal.(Display empno, ename, and sal).

DECLARE
    CURSOR EMP_CURSOR IS SELECT SAL
                         FROM EMP
                         ORDER BY SAL ASC;
    V_SAL NUMBER;
BEGIN
    OPEN EMP_CURSOR;
    FOR V IN 1..5
        LOOP
            FETCH EMP_CURSOR INTO V_SAL;
            DBMS_OUTPUT.PUT_LINE(V_SAL);
        END LOOP;
END;