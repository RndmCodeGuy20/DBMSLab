-- Q2. Create a function that takes deptno as argument and return the count of no. of employees working in that department.(scott/tiger schema)

CREATE FUNCTION RET_COUNT_EMP(DEPT_NUM IN NUMBER)
    RETURN NUMBER
AS
    V_COUNT NUMBER;
BEGIN
    SELECT COUNT(*) INTO V_COUNT FROM EMP WHERE DEPTNO = DEPT_NUM;

    RETURN V_COUNT;

END RET_COUNT_EMP;

DECLARE
    EMP_COUNT NUMBER;
BEGIN
    EMP_COUNT := RET_COUNT_EMP(10);

    DBMS_OUTPUT.PUT_LINE('COUNT OF EMP : ' || EMP_COUNT);
END;