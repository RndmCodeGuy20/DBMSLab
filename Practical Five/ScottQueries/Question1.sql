-- An employee no. is entered from keyboard, Write a PL-SQL program to find empno, ename, deptno, sal from emp table. Raise suitable exception, if employee no does not exist.

DECLARE
    V_EMP_ID       NUMBER := &V_EMP_ID;
    V_EMP_NAME     VARCHAR2(20);
    V_EMP_DEPT_NUM NUMBER;
    V_EMP_SAL      NUMBER;
BEGIN
    SELECT EMPNO, ENAME, DEPTNO, SAL
    INTO V_EMP_ID, V_EMP_NAME, V_EMP_DEPT_NUM, V_EMP_SAL
    FROM EMP
    WHERE EMPNO = V_EMP_ID;

    DBMS_OUTPUT.PUT_LINE('EMPLOYEE ID : ' || V_EMP_ID);
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE NAME : ' || V_EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE DEPARTMENT NO. : ' || V_EMP_DEPT_NUM);
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE SALARY : ' || V_EMP_SAL);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO EMPLOYEE FOUND WITH ID : ' || V_EMP_ID);
END;