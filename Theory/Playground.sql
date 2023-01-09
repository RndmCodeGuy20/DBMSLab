SELECT *
FROM TAB
WHERE TNAME = 'COURSE';

SELECT *
FROM USER_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'R';

DECLARE
    i NUMBER := 1;
BEGIN
    LOOP
        EXIT WHEN i > 10;
        DBMS_OUTPUT.PUT_LINE(i);

        i := i + 2;
    END LOOP;
END;


SELECT *
FROM (SELECT SAL
      FROM EMP)
WHERE SAL < 2000;

-- OR

SELECT SAL
FROM EMP
WHERE SAL < 2000;

SELECT COMM
FROM EMP
GROUP BY COMM;


SELECT *
FROM DEPT
WHERE DEPTNO > 20;


SELECT *
FROM EMP E
         RIGHT OUTER JOIN (SELECT * FROM DEPT WHERE DEPTNO = 20) D ON E.DEPTNO = D.DEPTNO;