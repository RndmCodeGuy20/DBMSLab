-- PARAMETER LIST HAS 3 MODES
-- 1. IN
-- 2. OUT
-- 3. INOUT

-- DECLARE
--     I NUMBER;
--     J NUMBER;
--     K NUMBER;
--
--     PROCEDURE ADDITION(NUM1 IN NUMBER, NUM2 IN NUMBER, SUM OUT NUMBER) IS
--     BEGIN
--         SUM := NUM1 + NUM2;
--     END;
-- BEGIN
--     I := 5;
--     J := 5;
--     ADDITION(I, J, K);
--     DBMS_OUTPUT.PUT_LINE('SUM OF I (' || I || ') AND J (' || J || ') IS = ' || K);
-- END;

SELECT ENAME
FROM EMP E
         JOIN DEPT D on E.DEPTNO = D.DEPTNO
WHERE D.DEPTNO = 10;