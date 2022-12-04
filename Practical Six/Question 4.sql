-- Write a PL-SQL block using cursor to print the empno,ename,sal,deptno of those employees whose sal is greater than 2000.(use cursor for loop to read a Record at a time).

DECLARE
    V_COUNT NUMBER;
    CURSOR EMP_CURSOR IS (SELECT EMPNO, ENAME, DEPTNO, SAL
                          FROM EMP);

BEGIN
    --     OPEN EMP_CURSOR;
    FOR EMP_VAL IN EMP_CURSOR
        LOOP
            IF EMP_VAL.SAL > 2000 THEN
                DBMS_OUTPUT.PUT_LINE(EMP_VAL.EMPNO || '  ' || EMP_VAL.ENAME || '  ' || EMP_VAL.DEPTNO || '  ' ||
                                     EMP_VAL.SAL);
            END IF;
            V_COUNT := V_COUNT + 1;
        END LOOP;

    DBMS_OUTPUT.PUT_LINE('NUM OF ROWS : ' || V_COUNT);
END;