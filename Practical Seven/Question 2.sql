-- Q2. Create a procedure that takes empno and returns ename,sal,job of the respective employee.(scott/tiger)

CREATE OR REPLACE PROCEDURE EMPDATA(EMP_NUM IN NUMBER)
AS
    V_EMP_NAME EMP.ENAME%TYPE;
    V_EMP_SAL  EMP.SAL%TYPE;
    V_EMP_JOB  EMP.JOB%TYPE;
BEGIN
    SELECT ENAME, SAL, JOB INTO V_EMP_NAME, V_EMP_SAL, V_EMP_JOB FROM EMP WHERE EMPNO = EMP_NUM;

    DBMS_OUTPUT.PUT_LINE('EMPLOYEE NAME : ' || V_EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE JOB : ' || V_EMP_JOB);
    DBMS_OUTPUT.PUT_LINE('EMPLOYEE SALARY : ' || V_EMP_SAL);
END;

BEGIN
    EMPDATA(7839);
END;