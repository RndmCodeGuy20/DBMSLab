DECLARE
    V_ENAME emp.ename%TYPE;
    V_SAL   emp.sal%TYPE;
BEGIN
    SELECT ENAME,
           SAL
    INTO V_ENAME,
        V_SAL
    FROM EMP e1
    WHERE 4 - 1 = (SELECT COUNT(DISTINCT e1.SAL)
                   FROM emp e2
                   WHERE e2.SAL > e1.SAL);
    DBMS_OUTPUT.PUT_LINE(V_ENAME || ' HAS 4TH LARGEST SALARY : ' || V_SAL);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO EMPLOYEE FOUND WITH NAME : ' || V_ENAME);
END;