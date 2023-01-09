-- Q1. Write a PL-SQL block to print deptno, dname, and Count of number of employees working in each department. (use scott schema)

DECLARE
    CURSOR EMP_CURSOR IS (SELECT E.DEPTNO, COUNT(ENAME), DNAME
                          FROM EMP E
                                   JOIN DEPT D on D.DEPTNO = E.DEPTNO
                          GROUP BY E.DEPTNO, DNAME);
    V_DEPT_NUM  NUMBER;
    V_NUM_EMP   NUMBER;
    V_DEPT_NAME VARCHAR2(10);
BEGIN
    OPEN EMP_CURSOR;
    LOOP
        FETCH EMP_CURSOR INTO V_DEPT_NUM, V_NUM_EMP, V_DEPT_NAME;
        DBMS_OUTPUT.PUT_LINE(V_DEPT_NUM || '  ' || V_NUM_EMP || '   ' || V_DEPT_NAME);
        EXIT WHEN EMP_CURSOR%NOTFOUND;
    END LOOP;
END;