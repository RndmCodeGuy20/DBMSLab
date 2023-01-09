-- 1) Display all the records in emp table?

SELECT *
FROM EMP;

-- 2) Display all the records in emp table where employee belongs to deptno 10?

SELECT *
FROM EMP
WHERE DEPTNO = 10;

-- 3) Display all the records in emp table where employee does not belong to deptno 30?

SELECT *
FROM EMP
MINUS
(SELECT * FROM EMP WHERE DEPTNO = 30)

SELECT *
FROM EMP
WHERE DEPTNO != 30;

-- 4) Display total number of records in Emp table?

SELECT COUNT(*) "TOTAL ROWS"
FROM EMP;

-- 5) Display emp table with salary descending order?

SELECT ENAME, SAL
FROM EMP
ORDER BY SAL DESC;

-- 6) Display first five records in employee table?

SELECT *
FROM EMP
WHERE ROWNUM < 5;

-- 7) Display all the records in emp table order by ascending deptno, descending salary?

SELECT *
FROM EMP
ORDER BY DEPTNO, SAL DESC;

-- 8) Display all employees those who were joined in year 1981?

SELECT *
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = '1981';

-- 9) Display COMM in emp table. Display zero in place of null.

SELECT COALESCE(COMM, 0) "COMMISION"
FROM EMP;

-- 10) Display the records in emp table where MGR in 7698,7566 and sal should be greater then 1500

SELECT *
FROM EMP
WHERE MGR IN (7698, 7566)
INTERSECT
SELECT *
FROM EMP
WHERE SAL > 1500;

-- 11) Display all employees where employees hired before 01-JAN-1981

SELECT *
FROM EMP
WHERE HIREDATE < DATE'1981-01-01';

-- 12) Display all employees with how many years they have been servicing in the company?

SELECT ENAME,
       ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE) / 12) "YEARS IN SERVICE"
FROM EMP;

-- 13) Display all employees those were not joined in 1981?

SELECT *
FROM EMP
MINUS
(SELECT *
 FROM EMP
 WHERE EXTRACT(YEAR FROM HIREDATE) = '1981');

SELECT *
FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) != '1981';

-- 14) Display all employees where their hiredate belongs to third quarter?

SELECT *
FROM EMP
WHERE CEIL(EXTRACT(MONTH FROM HIREDATE) / 3) = 3;

-- 15) Display all employees where their salary is less then the Ford’s salary?

SELECT *
FROM EMP
WHERE SAL < (SELECT SAL
             FROM EMP
             WHERE ENAME = 'FORD');

-- 16) Display all the records in EMP table along with the rowid?

SELECT ENAME, ROWID
FROM EMP;

-- 17) Display all records in EMP table those were joined before SCOTT joined?

SELECT *
FROM EMP
WHERE HIREDATE < (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'SCOTT');

-- 18) Display all employees those who were joined in third quarter of 1981?

SELECT *
FROM EMP
WHERE CEIL(EXTRACT(MONTH FROM HIREDATE) / 3) = 3
  AND EXTRACT(YEAR FROM HIREDATE) = '1981';

-- 19) Add 3 months with hiredate in EMP table and display the result?

SELECT ENAME, ADD_MONTHS(HIREDATE, 3) "HIREDATE MONTH PLUS 3"
FROM EMP;

-- 20) Display the date for next TUESDAY in hiredate column?

SELECT NEXT_DAY(HIREDATE, 'TUESDAY') "NEXT TUESDAY AFTER HIREDATE"
FROM EMP;

-- 21) Find the date, 15 days after today’s date.

SELECT SYSDATE + 15
FROM DUAL;

-- 22) Write a query to display current date?

SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') "TODAY'S DATE"
FROM DUAL;

-- 23) Display distinct job from emp table?

SELECT DISTINCT JOB
FROM EMP;

-- 24) Display all the records in emp table where employee hired after 28-SEP-81 and before 03-DEC-81?

SELECT *
FROM EMP
WHERE HIREDATE > DATE'1981-09-28'
  AND HIREDATE < DATE'1981-12-03';

-- 25) Write a query that displays the employee’s names with the first letter capitalized and all other letters lowercase for all employees whose name starts with J, A, or M

SELECT INITCAP(ENAME) "INITIAL CAPITAL"
FROM EMP
WHERE ENAME LIKE 'M%'
   OR ENAME LIKE 'A%'
   OR ENAME LIKE4 'M%';


-- 26) Display all jobs that are in department 10. Include the location of department in the output.

SELECT DISTINCT E.JOB, LOC
FROM EMP E
         JOIN DEPT D ON D.DEPTNO = E.DEPTNO
WHERE D.DEPTNO = 10;

-- 27) Write a query to display the employee name, department name of all employees who earn a commission

SELECT ENAME, DNAME
FROM EMP E
         JOIN DEPT D on D.DEPTNO = E.DEPTNO
WHERE COMM IS NOT NULL;

-- 28) Display the empno, ename, sal, and salary increased by 15%.

SELECT EMPNO, ENAME, SAL + (15 / 100 * SAL) "SAL + 15%"
FROM EMP;

-- 29) Display ename, sal, grade. Use emp, salgrade table
--
-- 30) Display all employees and corresponding managers

SELECT E.ENAME "EMPLOYEE", M.ENAME "MANAGER"
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO;

-- 31) Display all the departments where employee salary greater then average salary of that department.

SELECT *
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

-- 32) Display all employees whose salary greater then the manager salary?

SELECT E.ENAME "EMPLOYEE",
       E.SAL   "EMPLOYEE SALARY",
       M.ENAME "MANAGER",
       M.SAL   "MANAGER SALARY"
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO
  AND E.SAL > M.SAL;

-- 33) Display employees where length of ename is 5

SELECT ENAME
FROM EMP
WHERE ENAME LIKE '_____';

-- 34) Display all employees where ename start with J and ends with S

SELECT ENAME
FROM EMP
WHERE ENAME LIKE 'J%S';

-- 35) Display all employees where employee does not belong to 10,20,40

SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO NOT IN (10, 20, 40);

-- 36) Display all employees where jobs does not belong to PRESIDENT and MANAGER?

SELECT ENAME, JOB
FROM EMP
WHERE JOB NOT IN ('PRESIDENT', 'MANAGER');

-- 37) Display the maximum salary in the emp table

SELECT MAX(SAL)
FROM EMP;

-- 38) Display average salary for job SALESMAN

SELECT AVG(SAL)
FROM EMP
WHERE JOB = 'SALESMAN';

-- 39) Display all three figures salary in emp table

SELECT *
FROM EMP
WHERE SAL <= 999;

-- 40) Display all records in emp table for employee who does not receive any commission

SELECT *
FROM EMP
WHERE COMM IS NULL;

-- 41) Display all ename where first character could be anything, but second character should be L?

SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

-- 42) Display nth highest and nth lowest salary in emp table?

SELECT SAL "NTH LOWEST"
FROM EMP E1
WHERE 1 = (SELECT COUNT(*)
           FROM EMP E2
           WHERE E1.SAL > E2.SAL);

SELECT SAL "NTH HIGHEST"
FROM EMP E1
WHERE 0 = (SELECT COUNT(*)
           FROM EMP E2
           WHERE E2.SAL > E1.SAL);

-- 43) Display all the departments where department has 3 employees?

SELECT DEPTNO, COUNT(*) "NUMBER OF EMPLOYEES"
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(*) = 3;

-- 44) Display emp name and corresponding subordinates. Use CONNECT BY clause.

-- SELECT *
-- FROM EMP E1,
--      EMP E2
-- CONNECT BY E1.EMPNO;

-- 45) Display sum of salary for each department. The output should be in one record

SELECT DEPTNO, SUM(SAL)
FROM EMP
GROUP BY DEPTNO;

-- 46) Display all department with Minimum salary and maximum salary?

SELECT DEPTNO,
       MIN(SAL),
       MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

-- 47) Display all ename, sal, deptno,dname from emp, dept table where all department which has employees as well as department does not have any employees. This query should include non matching rows.

SELECT ENAME, SAL, D.DEPTNO, DNAME
FROM EMP E
         FULL OUTER JOIN DEPT D on E.DEPTNO = D.DEPTNO;

-- 48) Display all ename, sal, deptno from emp, dept table where all employees which has matching department as well as employee does not have any departments. This query should include non matching rows.

SELECT ENAME, SAL, D.DEPTNO, DNAME
FROM EMP E
         FULL OUTER JOIN DEPT D on E.DEPTNO = D.DEPTNO;

-- Note: In the below query, employee will always have matching record in dept table. Emp, dept table may not be good example to answer this question.

-- 49) Display all ename, sal, deptno from emp, dept table where all employees which has matching and non matching department as well as all departments in dept table which has matching and non matching employees. This query should include non matching rows on both the tables.


-- Note: In the below query, employee will always have matching record in dept table. Emp, dept table may not be good example to answer this question.
--
-- 50) Display all ename, empno, dname, loc from emp, dept table without joining two tables
--
-- 51) Display all the departments where department does not have any employees

SELECT DNAME
FROM EMP E
         RIGHT JOIN DEPT D on D.DEPTNO = E.DEPTNO
GROUP BY DNAME
HAVING COUNT(ENAME) = 0;

-- 52) Display all the departments where department does have atleast one employee

SELECT DNAME
FROM EMP E
         RIGHT JOIN DEPT D on D.DEPTNO = E.DEPTNO
GROUP BY DNAME
HAVING COUNT(ENAME) > 0;

-- 53) Display all employees those who are not managers?

SELECT DISTINCT EMPNO
FROM EMP
MINUS
SELECT DISTINCT MGR
FROM EMP;

-- 54) Display ename, deptno from emp table with format of {ename} belongs to {deptno}
--
-- 55) Display total number of employees hired for 1980,1981,1982. The output should be in one record.
--
-- 56) Display ename, deptno from employee table. Also add another column in the same query and it should display ten for dept 10, twenty for dept 20, thirty for dept 30, fourty for dept 40
--
-- 57) Display all the records in emp table. The ename should be lower case. The job first character should be upper case and rest of the character in job field should be lower case.
--
-- 58) Display all employees those who have joined in first week of the month ?
--
-- 59) Display all empoyees those who have joined in the 49th week of the year?
--
-- 60) Display empno, deptno, salary, salary difference between current record and previous record in emp table. Deptno should be in descending order.
--
-- 61) Create table emp1 and copy the emp table for deptno 10 while creating the table
--
-- 62) Create table emp2 with same structure of emp table. Do not copy the data
--
-- 63) Insert new record in emp1 table, Merge the emp1 table on emp table.
--
-- 64) Display all the records for deptno which belongs to employee name JAMES?
--
-- 65) Display all the records in emp table where salary should be less then or equal to ADAMS salary?
--
-- 66) Display all employees those were joined before employee WARD joined?
--
-- 67) Display all subordinate those who are working under BLAKE?
--
-- 68) Display all subordinate(all levels) for employee BLAKE?
--
-- 69) Display all record in emp table for deptno which belongs to KING's Job?
--
-- 70) Display the employees for empno which belongs to job PRESIDENT?
--
-- 71) Display list of ename those who have joined in Year 81 as MANAGER?
--
-- 72) Display who is making highest commission?
--
-- 73) Display who is senior most employee? How many years has been working?
--
-- 74) Display who is most experienced and least experienced employee?
--
-- 75) Display ename, sal, grade, dname, loc for each employee.
--
-- 76) Display all employee whose location is DALLAS?

SELECT *
FROM EMP E
         LEFT JOIN DEPT D on E.DEPTNO = D.DEPTNO
WHERE LOC = 'DALLAS';

-- 77) Display ename, job, dname, deptno for each employee by using INLINE view?
--
-- 78) List ename, job, sal and department of all employees whose salary is not within the salary grade?
--
-- 79) Use EMP and EMP1 table. Query should have only three columns. Display empno,ename,sal from both tables inluding duplicates.
--
-- 80) Delete emp table for detpno 10 and 20.
--
-- 81) Delete all employees those are not getting any commission?
--
-- 82) Delete all employees those who employeed more then 28 years
--
-- 83) Add duplicate records in emp1 table. Delete the duplicate records in emp1 table.
--
-- 84) Delete the employees where employee salary greater then average salary of department salary?
--
-- 85) Delete all employees those who are reporting to BLAKE?
--
-- 86) Delete all levels of employees those who are under BLAKE?
--
-- 87) Delete all employees those who are only managers?
--
-- 88) Remove the department in dept table where dept does not have any employees?
--
-- 89) Remove all grade 2 employees in emp table?
--
-- 90) Remove all the employees in SMITH's department
--
-- 91) Remove least paid employee who are reporting to BLAKE ?
--
-- 92) Remove all employees who were joined before SMITH joined?
--
-- 93) Rename the employee name JONES to ANDY
--
-- 94) Change the WARD's hiredate to one day ahead

SELECT (HIREDATE + 1)
FROM EMP
WHERE ENAME = 'WARD';

-- 95) Update MARTIN salary same as SMITH's salary
--
-- 96) Increase the salary 5% for employee those who are earning commission less then 1000

SELECT *
FROM EMP
WHERE COMM < 1000;

-- 97) Increase 250$ commission for BLAKE's team

SELECT *
FROM EMP
WHERE MGR = (SELECT EMPNO
             FROM EMP
             WHERE ENAME = 'BLAKE');

-- 98) Increase 100$ for employee who is making more then averAge salary of his department?

SELECT E1.ENAME
FROM EMP E1
WHERE E1.SAL > (SELECT AVG(SAL)
                FROM EMP E2
                WHERE E1.DEPTNO = E2.DEPTNO);

-- 99) Increase 1% salary for employee who is making lowest salary in dept 10

SELECT MIN(SAL) + (1 / 100 * MIN(SAL))
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 10;

-- 100) Reduce the commission amount from employee salary for each employee who were joined after ALLEN joined.

SELECT ENAME, SAL - 10
FROM EMP
WHERE HIREDATE > (SELECT HIREDATE
                  FROM EMP
                  WHERE ENAME = 'ALLEN');

-- 101) Increase commission 10$ for employees those who are located in NEW YORK.

SELECT ENAME, COALESCE(COMM, 0) + 10
FROM EMP E
         JOIN DEPT D on E.DEPTNO = D.DEPTNO
WHERE LOC = 'NEW YORK';