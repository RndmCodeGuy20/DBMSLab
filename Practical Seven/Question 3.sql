-- Q3. create a procedure that takes deptno as argument and returns the names of all employees in that dept.(scott/tiger)

CREATE OR REPLACE PROCEDURE EMP_NAMES(DEPT_NUM IN NUMBER)
AS
    V_EMP_JOB EMP.JOB%TYPE;
    CURSOR ENAMES_CURSOR IS (SELECT ENAME
                             FROM EMP E
                             WHERE DEPTNO = DEPT_NUM);
    --     CURSOR TEST_CURSOR (DEPT_NUM NUMBER) IS (SELECT ENAME
--                              FROM EMP E
--                                       JOIN DEPT D on E.DEPTNO = D.DEPTNO
--                              WHERE D.DEPTNO = DEPT_NUM)
BEGIN
    FOR EMP_NAME IN ENAMES_CURSOR
        LOOP
            DBMS_OUTPUT.PUT_LINE(EMP_NAME.ENAME);
        END LOOP;
END;

BEGIN
    EMP_NAMES(10);
END;