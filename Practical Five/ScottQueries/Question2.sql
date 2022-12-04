-- An employee no. is entered from keyboard; Write a PL-SQL program to find grade of an employee in emp relation based on employee salary.
-- If sal > 3000$ then grade is A
-- If sal > 2000$ then grade is B
-- If sal > 1000$ then grade is C
-- Otherwise grade is D raise suitable exception, if employee name does not exist.

DECLARE
    V_EMP_NO  NUMBER(10) := &V_EMP_NO;
    V_EMP_SAL NUMBER;
BEGIN
    SELECT SAL
    INTO V_EMP_SAL
    FROM EMP
    WHERE EMPNO = V_EMP_NO;

    IF V_EMP_SAL > 3000 THEN
        DBMS_OUTPUT.PUT_LINE('GRADE : A');
    ELSIF V_EMP_SAL > 2000 THEN
        DBMS_OUTPUT.PUT_LINE('GRADE : B');
    ELSIF V_EMP_SAL > 1000 THEN
        DBMS_OUTPUT.PUT_LINE('GRADE : C');
    ELSE
        DBMS_OUTPUT.PUT_LINE('GRADE : D');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('NO EMPLOYEE FOUND WITH ID : ' || V_EMP_NO);
END;