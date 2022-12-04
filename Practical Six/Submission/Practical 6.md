<center><h1 >Shri Ramdeobaba College of Engineering and Management<br>Nagpur 440013</h1></center>
<center><h1 >Department of Computer Science Engineering (AIML)</h1></center>
<center><h2 >Database Management Lab - Practical 5</h2></center>

---

<div class="text aim">Aim : To study the relational database model and to understand the categorization of SQl statements.
️</div>

---

### CURSOR Questions

<div class="text">Q1. Write a PL-SQL block to print deptno, dname, and Count of number of employees working in each department. (use scott schema)</div>

```sql
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
        EXIT WHEN EMP_CURSOR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(V_DEPT_NUM || '  ' || V_NUM_EMP || '   ' || V_DEPT_NAME);
    END LOOP;
END;
```

```text
10  3   ACCOUNTING
20  5   RESEARCH
30  6   SALES
```

<div class="text">Q2. Write a PL-SQL block using cursor to print the deptno for those departments where three or more employees are working.</div>

```sql
DECLARE
    CURSOR EMP_CURSOR IS (SELECT D.DEPTNO, COUNT(ENAME), DNAME
                          FROM EMP E
                                   FULL OUTER JOIN DEPT D ON EMP.DEPTNO = D.DEPTNO
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
```

```text
20  5   RESEARCH
30  6   SALES
```

<div class="text">Write a PL-SQL block using cursor to print bottom five employees as per sal.(Display empno, ename, and sal).</div>

```sql
DECLARE
    CURSOR EMP_CURSOR IS SELECT SAL
                         FROM EMP
                         ORDER BY SAL ASC;
    V_SAL NUMBER;
BEGIN
    OPEN EMP_CURSOR;
    FOR V IN 1..5
        LOOP
            FETCH EMP_CURSOR INTO V_SAL;
            DBMS_OUTPUT.PUT_LINE(V_SAL);
        END LOOP;
END;
```

```text
800
950
1100
1250
1250
```

<div class="text">Q4. Write a PL-SQL block using cursor to print the empno,ename,sal,deptno of those employees whose sal is greater than 2000.(use cursor for loop to read a Record at a time).</div>

```sql
DECLARE
    V_COUNT NUMBER;
    CURSOR EMP_CURSOR IS (SELECT EMPNO, ENAME, DEPTNO, SAL
                          FROM EMP);

BEGIN
    --     OPEN EMP_CURSOR;
    FOR EMP_VAL IN EMP_CURSOR
        LOOP
            IF EMP_VAL.SAL > 2000 THEN
                DBMS_OUTPUT.PUT_LINE(EMP_VAL.EMPNO || '  ' || EMP_VAL.ENAME || '  ' || EMP_VAL.DEPTNO || '  ' ||
                                     EMP_VAL.SAL);
            END IF;
            V_COUNT := V_COUNT + 1;
        END LOOP;

    DBMS_OUTPUT.PUT_LINE('NUM OF ROWS : ' || V_COUNT);
END;
```

```text
7839  KING  10  5000
7698  BLAKE  30  2850
7782  CLARK  10  2450
7566  JONES  20  2975
7788  SCOTT  20  3000
7902  FORD  20  3000
NUM OF ROWS : 6
```

<style>
h3{
    font-size: 22px;
}
h1, h2, h3{
    font-family: 'Garamond'
}

.text, h4{
    font-family: 'IBM Plex Sans'; 
}

.aim{
    font-size: 24px;
    padding: 20px 0px 20px 0px;
}

.quote {
    font-family: 'Inria Sans', sans;
    background: #696969;
    padding: 10px 10px;
    border-radius: 2px;
}
</style>