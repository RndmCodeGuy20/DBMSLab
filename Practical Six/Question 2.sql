-- Write a PL-SQL block using cursor to print the deptno for those departments where three or more employees are working.

DECLARE
    CURSOR EMP_CURSOR IS (SELECT D.DEPTNO, COUNT(ENAME), DNAME
                          FROM EMP E
                                   FULL OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
                          GROUP BY D.DEPTNO, DNAME);
    V_DEPT_NUM  NUMBER;
    V_NUM_EMP   NUMBER;
    V_DEPT_NAME VARCHAR2(10);
BEGIN
    OPEN EMP_CURSOR;
    LOOP
        FETCH EMP_CURSOR INTO V_DEPT_NUM, V_NUM_EMP, V_DEPT_NAME;
        EXIT WHEN EMP_CURSOR%NOTFOUND;
        IF V_NUM_EMP > 3 THEN
            DBMS_OUTPUT.PUT_LINE(V_DEPT_NUM || '  ' || V_NUM_EMP || '   ' || V_DEPT_NAME);
        END IF;
    END LOOP;
END;