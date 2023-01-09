<center><h1 style="font-family: 'Walbaum Text'">Shri Ramdeobaba College of Engineering and Management<br>Nagpur 4400013</h1></center>
<center><h1 style="font-family: 'Walbaum Text'">Department of Computer Science Engineering (AIML)</h1></center>
<center><h2 style="font-family: 'Walbaum Text'">Database Management - Teachers Assessment 1</h2></center>


---

<div style="font-family: 'IBM Plex Sans'; font-size: 24px;padding: 20px 0px 20px 0px">Aim : Write Queries for solving the given questions. ➡️</div>

<div style="font-family: 'IBM Plex Sans';">Query</div>

```sql
DESCRIBE EMP;
```

<div style="font-family: 'IBM Plex Sans';">Output</div>

```text
Name                                      Null?    Type
----------------------------------------- -------- ----------------------------
EMPNO                                     NOT NULL NUMBER(4)
ENAME                                              VARCHAR2(10)
JOB                                                VARCHAR2(9)
MGR                                                NUMBER(4)
HIREDATE                                           DATE
SAL                                                NUMBER(7,2)
COMM                                               NUMBER(7,2)
DEPTNO                                             NUMBER(2)
```

<div style="font-family: 'IBM Plex Sans';">Query</div>

```sql
DESCRIBE DEPT;
```

<div style="font-family: 'IBM Plex Sans';">Output</div>

```text
Name                                      Null?    Type
----------------------------------------- -------- ----------------------------
DEPTNO                                    NOT NULL NUMBER(2)
DNAME                                              VARCHAR2(14)
LOC                                                VARCHAR2(13)
```

---

<div style="font-family: 'IBM Plex Sans'; font-size: 24px;padding: 20px 0px 20px 0px">Queries ➡️</div>

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q1. Count the number of jobs in the organization.</div>

```sql
SELECT COUNT(*) "NUM JOBS"
FROM DEPT;
```

```text
+--------+
|NUM JOBS|
+--------+
|14      |
+--------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q2. Count the number of department in the organization.</div>

```SQL
SELECT COUNT(*) "NUM DEPT"
FROM DEPT;
```

```text
+--------+
|NUM DEPT|
+--------+
|4       |
+--------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q3. Count the number of employees whose commission is null.</div>

```SQL
SELECT COUNT(*) "NUMBER OF EMPLOYEES"
FROM EMP
WHERE COMM IS NULL;
```

```text
+-------------------+
|NUMBER OF EMPLOYEES|
+-------------------+
|10                 |
+-------------------+

```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q4. Count the number of employees whose commission is NOT null.</div>

```SQL
SELECT COUNT(*) "NUMBER OF EMPLOYEES"
FROM EMP
WHERE COMM IS NOT NULL;
```

```text
+-------------------+
|NUMBER OF EMPLOYEES|
+-------------------+
|4                  |
+-------------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q5. Find the names of employees whose names begin with letter J.</div>

```SQL
SELECT EMPNO "ID", ENAME "NAME"
FROM EMP
WHERE ENAME LIKE 'J%';
```

```text
+----+-----+
|ID  |NAME |
+----+-----+
|7566|JONES|
|7900|JAMES|
+----+-----+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q6. Count the number of employees in each department.</div>

```SQL
SELECT DEPTNO "DEPARTMENT NUM", COUNT(*) "NUM OF EMPLOYEES"
FROM EMP
GROUP BY DEPTNO;
```

```text
+--------------+----------------+
|DEPARTMENT NUM|NUM OF EMPLOYEES|
+--------------+----------------+
|30            |6               |
|20            |5               |
|10            |3               |
+--------------+----------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q7. List the unique jobs in emp table.</div>

```SQL
SELECT DISTINCT JOB "DISTINCT JOBS"
FROM EMP;
```

```text
+-------------+
|DISTINCT JOBS|
+-------------+
|CLERK        |
|SALESMAN     |
|PRESIDENT    |
|MANAGER      |
|ANALYST      |
+-------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q8. List the president in emp table.</div>

```SQL
SELECT *
FROM EMP
WHERE JOB = 'PRESIDENT';
```

```text
+-----+-----+---------+----+----------+-------+----+------+
|EMPNO|ENAME|JOB      |MGR |HIREDATE  |SAL    |COMM|DEPTNO|
+-----+-----+---------+----+----------+-------+----+------+
|7839 |KING |PRESIDENT|null|1981-11-17|5000.00|null|10    |
+-----+-----+---------+----+----------+-------+----+------+

```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q9. Find the min and max salary in organization.</div>

```SQL
SELECT MIN(SAL) "MINIMUM SALARY", MAX(SAL) "MAXIMUM SALARY"
FROM EMP;
```

```text
+--------------+--------------+
|MINIMUM SALARY|MAXIMUM SALARY|
+--------------+--------------+
|800           |5000          |
+--------------+--------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q10. Find the average salary in organization.</div>

```SQL
SELECT ROUND(AVG(SAL), 4) "AVERAGE SALARY"
FROM EMP;
```

```text
+--------------+
|AVERAGE SALARY|
+--------------+
|2073.2143     |
+--------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q11. Count the number of employees in each job.</div>

```SQL
SELECT JOB, COUNT(*) "NUM OF EMPLOYEES"
FROM EMP
GROUP BY JOB;
```

```text
+---------+----------------+
|JOB      |NUM OF EMPLOYEES|
+---------+----------------+
|CLERK    |4               |
|SALESMAN |4               |
|PRESIDENT|1               |
|MANAGER  |3               |
|ANALYST  |2               |
+---------+----------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q12. Find min, max,avg and total salary in each job.</div>

```SQL
SELECT JOB,
       MIN(SAL)           "MINIMUM SALARY",
       MAX(SAL)           "MAXIMUM SALARY",
       ROUND(AVG(SAL), 4) "AVERAGE SALARY",
       SUM(SAL)           "TOTAL SALARY"
FROM EMP
GROUP BY JOB;
```

```text
+---------+--------------+--------------+--------------+------------+
|JOB      |MINIMUM SALARY|MAXIMUM SALARY|AVERAGE SALARY|TOTAL SALARY|
+---------+--------------+--------------+--------------+------------+
|CLERK    |800           |1300          |1037.5        |4150        |
|SALESMAN |1250          |1600          |1400          |5600        |
|PRESIDENT|5000          |5000          |5000          |5000        |
|MANAGER  |2450          |2975          |2758.3333     |8275        |
|ANALYST  |3000          |3000          |3000          |6000        |
+---------+--------------+--------------+--------------+------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q13. Find min, max,avg and total salary in each department.</div>

```SQL
SELECT DEPTNO,
       MIN(SAL)           "MINIMUM SALARY",
       MAX(SAL)           "MAXIMUM SALARY",
       ROUND(AVG(SAL), 4) "AVERAGE SALARY",
       SUM(SAL)           "TOTAL SALARY"
FROM EMP
GROUP BY DEPTNO;
```

```text
+------+--------------+--------------+--------------+------------+
|DEPTNO|MINIMUM SALARY|MAXIMUM SALARY|AVERAGE SALARY|TOTAL SALARY|
+------+--------------+--------------+--------------+------------+
|30    |950           |2850          |1566.6667     |9400        |
|20    |800           |3000          |2175          |10875       |
|10    |1300          |5000          |2916.6667     |8750        |
+------+--------------+--------------+--------------+------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q14. Find the names of those employees who are working in department 20 and their job is either clerk or salesman.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB
FROM EMP
WHERE DEPTNO = '20'
  AND JOB IN ('CLERK', 'SALESMAN');
```

```text
+------+--------------+--------------+--------------+------------+
|DEPTNO|MINIMUM SALARY|MAXIMUM SALARY|AVERAGE SALARY|TOTAL SALARY|
+------+--------------+--------------+--------------+------------+
|30    |950           |2850          |1566.6667     |9400        |
|20    |800           |3000          |2175          |10875       |
|10    |1300          |5000          |2916.6667     |8750        |
+------+--------------+--------------+--------------+------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q15. Find the max salary in organization.</div>

```SQL
SELECT *
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);
```

```text
+-----+-----+---------+----+----------+-------+----+------+
|EMPNO|ENAME|JOB      |MGR |HIREDATE  |SAL    |COMM|DEPTNO|
+-----+-----+---------+----+----------+-------+----+------+
|7839 |KING |PRESIDENT|null|1981-11-17|5000.00|null|10    |
+-----+-----+---------+----+----------+-------+----+------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q16. Find the names of those employees whose commission is highest.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB"
FROM EMP
WHERE COMM = (SELECT MAX(COMM) FROM EMP);
```

```text
+-------------+------------+
|EMPLOYEE NAME|EMPLOYEE JOB|
+-------------+------------+
|MARTIN       |SALESMAN    |
+-------------+------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q17. Find the names of those employees whose commission is null.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB"
FROM EMP
WHERE COMM IS NULL;
```

```text
+-------------+------------+
|EMPLOYEE NAME|EMPLOYEE JOB|
+-------------+------------+
|KING         |PRESIDENT   |
|BLAKE        |MANAGER     |
|CLARK        |MANAGER     |
|JONES        |MANAGER     |
|SCOTT        |ANALYST     |
|FORD         |ANALYST     |
|SMITH        |CLERK       |
|ADAMS        |CLERK       |
|JAMES        |CLERK       |
|MILLER       |CLERK       |
+-------------+------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q18. Find the names of employees whose job is either clerk or salesman or manager.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB"
FROM EMP
WHERE JOB IN ('SALESMAN', 'MANAGER');
```

```text
+-------------+------------+
|EMPLOYEE NAME|EMPLOYEE JOB|
+-------------+------------+
|BLAKE        |MANAGER     |
|CLARK        |MANAGER     |
|JONES        |MANAGER     |
|ALLEN        |SALESMAN    |
|WARD         |SALESMAN    |
|MARTIN       |SALESMAN    |
|TURNER       |SALESMAN    |
+-------------+------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q19. Find the names of employees whose joining date is between 17-DEC-80 and 23-MAY-87.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", HIREDATE "HIRING DATE"
FROM EMP
WHERE HIREDATE >= DATE '1980-12-17'
  AND HIREDATE <= DATE '1987-05-23';
```

```text
+-------------+------------+-----------+
|EMPLOYEE NAME|EMPLOYEE JOB|HIRING DATE|
+-------------+------------+-----------+
|KING         |PRESIDENT   |1981-11-17 |
|BLAKE        |MANAGER     |1981-05-01 |
|CLARK        |MANAGER     |1981-06-09 |
|JONES        |MANAGER     |1981-04-02 |
|SCOTT        |ANALYST     |1982-12-09 |
|FORD         |ANALYST     |1981-12-03 |
|SMITH        |CLERK       |1980-12-17 |
|ALLEN        |SALESMAN    |1981-02-20 |
|WARD         |SALESMAN    |1981-02-22 |
|MARTIN       |SALESMAN    |1981-09-28 |
|TURNER       |SALESMAN    |1981-09-08 |
|ADAMS        |CLERK       |1983-01-12 |
|JAMES        |CLERK       |1981-12-03 |
|MILLER       |CLERK       |1982-01-23 |
+-------------+------------+-----------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q20. Find the names of those employees whose second character in the name is A.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB"
FROM EMP
WHERE ENAME LIKE '_A%';
```

```text
+-------------+------------+
|EMPLOYEE NAME|EMPLOYEE JOB|
+-------------+------------+
|WARD         |SALESMAN    |
|MARTIN       |SALESMAN    |
|JAMES        |CLERK       |
+-------------+------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q21. Find the names of employees who are working as clerks.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB"
FROM EMP
WHERE JOB = 'CLERK';
```

```text
+-------------+------------+
|EMPLOYEE NAME|EMPLOYEE JOB|
+-------------+------------+
|SMITH        |CLERK       |
|ADAMS        |CLERK       |
|JAMES        |CLERK       |
|MILLER       |CLERK       |
+-------------+------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q22. Find the names of employee who are working under BLAKE.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", MGR "MANAGER ID"
FROM EMP
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'BLAKE');
```

```text
+-------------+------------+----------+
|EMPLOYEE NAME|EMPLOYEE JOB|MANAGER ID|
+-------------+------------+----------+
|ALLEN        |SALESMAN    |7698      |
|WARD         |SALESMAN    |7698      |
|MARTIN       |SALESMAN    |7698      |
|TURNER       |SALESMAN    |7698      |
|JAMES        |CLERK       |7698      |
+-------------+------------+----------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q23. Find the names of employee who are working in research department.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", DNAME "DEPARTMENT NAME"
FROM EMP E
         INNER JOIN DEPT D on D.DEPTNO = E.DEPTNO
WHERE DNAME = 'RESEARCH';
```

```text
+-------------+------------+---------------+
|EMPLOYEE NAME|EMPLOYEE JOB|DEPARTMENT NAME|
+-------------+------------+---------------+
|FORD         |ANALYST     |RESEARCH       |
|SCOTT        |ANALYST     |RESEARCH       |
|JONES        |MANAGER     |RESEARCH       |
|SMITH        |CLERK       |RESEARCH       |
|ADAMS        |CLERK       |RESEARCH       |
+-------------+------------+---------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q24. Find the name of employee who is getting highest salary.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", SAL "SALARY"
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);
```

```text
+-------------+------------+-------+
|EMPLOYEE NAME|EMPLOYEE JOB|SALARY |
+-------------+------------+-------+
|KING         |PRESIDENT   |5000.00|
+-------------+------------+-------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q25. Display the name of employee earning second highest salary.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", SAL "SALARY"
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP));
```

```text
+-------------+------------+-------+
|EMPLOYEE NAME|EMPLOYEE JOB|SALARY |
+-------------+------------+-------+
|SCOTT        |ANALYST     |3000.00|
|FORD         |ANALYST     |3000.00|
+-------------+------------+-------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q26. Find second highest salary in the organization.</div>

```SQL
SELECT MAX(SAL) "SECOND HIGHEST SALARY"
FROM EMP
WHERE SAL < (SELECT MAX(SAL) FROM EMP);
```

```text
+---------------------+
|SECOND HIGHEST SALARY|
+---------------------+
|3000                 |
+---------------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q27. Find the package of each employee.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", SAL + COALESCE(COMM, 0) "TOTAL PACKAGE"
FROM EMP;
```

```text
+-------------+------------+-------------+
|EMPLOYEE NAME|EMPLOYEE JOB|TOTAL PACKAGE|
+-------------+------------+-------------+
|KING         |PRESIDENT   |5000         |
|BLAKE        |MANAGER     |2850         |
|CLARK        |MANAGER     |2450         |
|JONES        |MANAGER     |2975         |
|SCOTT        |ANALYST     |3000         |
|FORD         |ANALYST     |3000         |
|SMITH        |CLERK       |800          |
|ALLEN        |SALESMAN    |1900         |
|WARD         |SALESMAN    |1750         |
|MARTIN       |SALESMAN    |2650         |
|TURNER       |SALESMAN    |1500         |
|ADAMS        |CLERK       |1100         |
|JAMES        |CLERK       |950          |
|MILLER       |CLERK       |1300         |
+-------------+------------+-------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q28. Find the names of employees whose salary is more than avg salary in department 20.</div>

```SQL
SELECT ENAME AS "EMPLOYEE NAME", JOB "EMPLOYEE JOB", SAL "SALARY"
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
  AND DEPTNO = '20';
```

```text
+-------------+------------+-------+
|EMPLOYEE NAME|EMPLOYEE JOB|SALARY |
+-------------+------------+-------+
|JONES        |MANAGER     |2975.00|
|SCOTT        |ANALYST     |3000.00|
|FORD         |ANALYST     |3000.00|
+-------------+------------+-------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q29. Find top five salaries in emp table.</div>

```SQL
SELECT *
FROM EMP
WHERE ROWNUM < 6
ORDER BY SAL DESC;
```

```text
+-----+-----+---------+----+----------+-------+----+------+
|EMPNO|ENAME|JOB      |MGR |HIREDATE  |SAL    |COMM|DEPTNO|
+-----+-----+---------+----+----------+-------+----+------+
|7839 |KING |PRESIDENT|null|1981-11-17|5000.00|null|10    |
|7788 |SCOTT|ANALYST  |7566|1982-12-09|3000.00|null|20    |
|7566 |JONES|MANAGER  |7839|1981-04-02|2975.00|null|20    |
|7698 |BLAKE|MANAGER  |7839|1981-05-01|2850.00|null|30    |
|7782 |CLARK|MANAGER  |7839|1981-06-09|2450.00|null|10    |
+-----+-----+---------+----+----------+-------+----+------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q30. Find bottom three salaries in emp table.</div>

```SQL
SELECT *
FROM EMP
WHERE ROWNUM < 4
ORDER BY SAL;
```

```text
+-----+-----+---------+----+----------+-------+----+------+
|EMPNO|ENAME|JOB      |MGR |HIREDATE  |SAL    |COMM|DEPTNO|
+-----+-----+---------+----+----------+-------+----+------+
|7782 |CLARK|MANAGER  |7839|1981-06-09|2450.00|null|10    |
|7698 |BLAKE|MANAGER  |7839|1981-05-01|2850.00|null|30    |
|7839 |KING |PRESIDENT|null|1981-11-17|5000.00|null|10    |
+-----+-----+---------+----+----------+-------+----+------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q31. Find the average salary at each department where deptno is less than 30.</div>

```SQL
SELECT DEPTNO "DEPARTMENT NO.", ROUND(AVG(SAL), 2) "AVERAGE SALARY"
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO < 30;
```

```text
+--------------+--------------+
|DEPARTMENT NO.|AVERAGE SALARY|
+--------------+--------------+
|20            |2175          |
|10            |2916.67       |
+--------------+--------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q32. Find 5th largest salary in emp table.</div>

```SQL
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP E1
WHERE 6 = (SELECT COUNT(DISTINCT SAL)
           FROM EMP E2
           WHERE E2.SAL > E1.SAL);
```

```text
+-----+------+--------+-------+
|EMPNO|ENAME |JOB     |SAL    |
+-----+------+--------+-------+
|7844 |TURNER|SALESMAN|1500.00|
+-----+------+--------+-------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q33. Find the details of those employees whose sal is greater than the avg sal in emp table.</div>

```SQL
SELECT ENAME AS "EMPLOYEE NAME", JOB "EMPLOYEE JOB", SAL "SALARY"
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);
```

```text
+-------------+------------+-------+
|EMPLOYEE NAME|EMPLOYEE JOB|SALARY |
+-------------+------------+-------+
|KING         |PRESIDENT   |5000.00|
|BLAKE        |MANAGER     |2850.00|
|CLARK        |MANAGER     |2450.00|
|JONES        |MANAGER     |2975.00|
|SCOTT        |ANALYST     |3000.00|
|FORD         |ANALYST     |3000.00|
+-------------+------------+-------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q34. Find deptno, dname, min, max, avg and total salary in each department.</div>

```SQL
SELECT E.DEPTNO           "DEPARTMENT NO",
       DNAME              "DEPARTMENT NAME",
       MIN(SAL)           "MINIMUM SALARY",
       MAX(SAL)           "MAXIMUM SALARY",
       ROUND(AVG(SAL), 2) "AVAERAGE SALARY"
FROM EMP E
         JOIN
     DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY DNAME, E.DEPTNO;
```

```text
+-------------+---------------+--------------+--------------+---------------+
|DEPARTMENT NO|DEPARTMENT NAME|MINIMUM SALARY|MAXIMUM SALARY|AVAERAGE SALARY|
+-------------+---------------+--------------+--------------+---------------+
|10           |ACCOUNTING     |1300          |5000          |2916.67        |
|20           |RESEARCH       |800           |3000          |2175           |
|30           |SALES          |950           |2850          |1566.67        |
+-------------+---------------+--------------+--------------+---------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q35. Show the output for count function on empno, comm and * .(Justify your answer).</div>

```SQL
SELECT COUNT(EMPNO) "EMPLOYEE COUNT"
FROM EMP;

SELECT COUNT(COMM) "COMMISSION COUNT"
FROM EMP;

SELECT COUNT(*) "ALL COL COUNT"
FROM EMP;
```

```text
+--------------+
|EMPLOYEE COUNT|
+--------------+
|14            |
+--------------+

+----------------+
|COMMISSION COUNT|
+----------------+
|4               |
+----------------+

+-------------+
|ALL COL COUNT|
+-------------+
|14           |
+-------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q36. Find the names of managers of each employee.(display Ename, Mangername)[use self-join].</div>

```SQL
SELECT E.ENAME "EMPLOYEE NAME", M.ENAME "MANAGER NAME"
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO;
```

```text
+-------------+------------+
|EMPLOYEE NAME|MANAGER NAME|
+-------------+------------+
|FORD         |JONES       |
|SCOTT        |JONES       |
|ALLEN        |BLAKE       |
|JAMES        |BLAKE       |
|TURNER       |BLAKE       |
|MARTIN       |BLAKE       |
|WARD         |BLAKE       |
|MILLER       |CLARK       |
|ADAMS        |SCOTT       |
|BLAKE        |KING        |
|CLARK        |KING        |
|JONES        |KING        |
|SMITH        |FORD        |
+-------------+------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q37. Find the experience of each employee.</div>

```SQL
SELECT ENAME "EMPLOYEE NAME", ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE) / 12) "EXPERIENCE (IN YEARS)"
FROM EMP;
```

```text
+-------------+---------------------+
|EMPLOYEE NAME|EXPERIENCE (IN YEARS)|
+-------------+---------------------+
|KING         |41                   |
|BLAKE        |41                   |
|CLARK        |41                   |
|JONES        |42                   |
|SCOTT        |40                   |
|FORD         |41                   |
|SMITH        |42                   |
|ALLEN        |42                   |
|WARD         |42                   |
|MARTIN       |41                   |
|TURNER       |41                   |
|ADAMS        |40                   |
|JAMES        |41                   |
|MILLER       |41                   |
+-------------+---------------------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q38. Find the name of junior most employee.</div>

```SQL
SELECT ENAME "NAME", HIREDATE
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);
```

```text
+-----+----------+
|NAME |HIREDATE  |
+-----+----------+
|ADAMS|1983-01-12|
+-----+----------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q39. Find the name of senior most employee.</div>

```SQL
SELECT ENAME "NAME", HIREDATE
FROM EMP
WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);
```

```text
+-----+----------+
|NAME |HIREDATE  |
+-----+----------+
|SMITH|1980-12-17|
+-----+----------+
```

<div style="font-family: 'IBM Plex Sans'; padding: 30px 0px 15px 0px">Q40. Find the deptno with highest number of employees.</div>

```SQL
SELECT D.DNAME, D.DEPTNO, COUNT(D.DEPTNO) "NUMBER OF EMPLOYEES"
FROM EMP E
         JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME
ORDER BY COUNT(D.DEPTNO) DESC;
```

```text
+----------+------+-------------------+
|DNAME     |DEPTNO|NUMBER OF EMPLOYEES|
+----------+------+-------------------+
|SALES     |30    |6                  |
|RESEARCH  |20    |5                  |
|ACCOUNTING|10    |3                  |
+----------+------+-------------------+
```

<style>
  .normal-text {
    font-family: 'IBM Plex Sans',
  }
</style>