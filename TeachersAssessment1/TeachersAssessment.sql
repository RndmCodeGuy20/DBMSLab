-- 1. Count the number of jobs in the organization.
SELECT COUNT(*) "NUM JOBS"
FROM EMP;

-- 2. Count the number of department in the organization.
SELECT COUNT(*) "NUM DEPT"
FROM DEPT;

-- 3. Count the number of employees whose commission is null.
SELECT COUNT(*) "NUMBER OF EMPLOYEES"
FROM EMP
WHERE COMM IS NULL;

-- 4. Count the number of employees whose commission is NOT null.
SELECT COUNT(*) "NUMBER OF EMPLOYEES"
FROM EMP
WHERE COMM IS NOT NULL;

-- 5. Find the names of employees whose names begin with letter J.
SELECT EMPNO "ID", ENAME "NAME"
FROM EMP
WHERE ENAME LIKE 'J%';

-- 6. Count the number of employees in each department.
SELECT DEPTNO "DEPARTMENT NUM", COUNT(*) "NUM OF EMPLOYEES"
FROM EMP
GROUP BY DEPTNO;

-- 7. List the unique jobs in emp table.
SELECT DISTINCT JOB "DISTINCT JOBS"
FROM EMP;

-- 8. List the president in emp table.
SELECT *
FROM EMP
WHERE JOB = 'PRESIDENT';

-- 9. Find the min and max salary in organization.
SELECT MIN(SAL) "MINIMUM SALARY", MAX(SAL) "MAXIMUM SALARY"
FROM EMP;

-- 10. Find the average salary in organization.
SELECT ROUND(AVG(SAL), 4) "AVERAGE SALARY"
FROM EMP;

-- 11. Count the number of employees in each job.
SELECT JOB, COUNT(*) "NUM OF EMPLOYEES"
FROM EMP
GROUP BY JOB;

-- 12. Find min, max,avg and total salary in each job.
SELECT JOB,
       MIN(SAL)           "MINIMUM SALARY",
       MAX(SAL)           "MAXIMUM SALARY",
       ROUND(AVG(SAL), 4) "AVERAGE SALARY",
       SUM(SAL)           "TOTAL SALARY"
FROM EMP
GROUP BY JOB;

-- 13. Find min, max,avg and total salary in each department.
SELECT DEPTNO,
       MIN(SAL)           "MINIMUM SALARY",
       MAX(SAL)           "MAXIMUM SALARY",
       ROUND(AVG(SAL), 4) "AVERAGE SALARY",
       SUM(SAL)           "TOTAL SALARY"
FROM EMP
GROUP BY DEPTNO;

-- 14. Find the names of those employees who are working in department 20 and their job is either clerk or salesman.
SELECT ENAME "EMPLOYEE NAME", JOB
FROM EMP
WHERE DEPTNO = '20'
  AND JOB IN ('CLERK', 'SALESMAN');

-- 15. Find the max salary in organization.
SELECT *
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);

-- 16. Find the names of those employees whose commission is highest.
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB"
FROM EMP
WHERE COMM = (SELECT MAX(COMM) FROM EMP);

-- 17. Find the names of those employees whose commission is null.
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB"
FROM EMP
WHERE COMM IS NULL;

-- 18. Find the names of employees whose job is either clerk or salesman or manager.
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB"
FROM EMP
WHERE JOB IN ('SALESMAN', 'CLERK');

-- 19. Find the names of employees whose joining date is between 17-DEC-80 and 23-MAY-87.
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", HIREDATE "HIRING DATE"
FROM EMP
WHERE HIREDATE >= DATE'1980-12-17'
  AND HIREDATE <= DATE'1987-05-23';

-- 20. Find the names of those employees whose second character in the name is A.
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB"
FROM EMP
WHERE ENAME LIKE '_A%';

-- 21. Find the names of employees who are working as clerks.
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB"
FROM EMP
WHERE JOB = 'CLERK';

-- 22.	Find the names of employee who are working under BLAKE.
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", MGR "MANAGER ID"
FROM EMP
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'BLAKE');

-- 23. Find the names of employee who are working in research department.
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", DNAME "DEPARTMENT NAME"
FROM EMP E
         INNER JOIN DEPT D on D.DEPTNO = E.DEPTNO
WHERE DNAME = 'RESEARCH';

-- 24. Find the name of employee who is getting highest salary.
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", SAL "SALARY"
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP);

-- 25. Display the name of employee earning second highest salary.
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", SAL "SALARY"
FROM EMP
WHERE SAL = (SELECT MAX(SAL) FROM EMP WHERE SAL < (SELECT MAX(SAL) FROM EMP));

-- 26. Find second highest salary in the organization.
SELECT MAX(SAL) "SECOND HIGHEST SALARY"
FROM EMP
WHERE SAL < (SELECT MAX(SAL) FROM EMP);

-- 27. Find the package of each employee.
SELECT ENAME "EMPLOYEE NAME", JOB "EMPLOYEE JOB", SAL + COALESCE(COMM, 0) "TOTAL PACKAGE"
FROM EMP;

-- 28. Find the names of employees whose salary is more than avg salary in department 20.
SELECT ENAME AS "EMPLOYEE NAME", JOB "EMPLOYEE JOB", SAL "SALARY"
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
  AND DEPTNO = '20';

-- 29. Find top five salaries in emp table.
SELECT *
FROM EMP
WHERE ROWNUM < 6
ORDER BY SAL DESC;

-- 30. Find bottom three salaries in emp table
SELECT *
FROM EMP
WHERE ROWNUM < 4
ORDER BY SAL;

-- 31. Find the average salary at each department where dept-no is less than 30.
SELECT DEPTNO "DEPARTMENT NO.", ROUND(AVG(SAL), 2) "AVERAGE SALARY"
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO < 30;

-- 32. Find 5th largest salary in emp table.
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP E1
WHERE 6 = (SELECT COUNT(DISTINCT SAL)
           FROM EMP E2
           WHERE E2.SAL > E1.SAL);

-- 33. Find the details of those employees whose sal is greater than the avg sal in emp table.
SELECT ENAME AS "EMPLOYEE NAME", JOB "EMPLOYEE JOB", SAL "SALARY"
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP);

-- 34. Find deptno, dname, min, max, avg and total salary in each department.
SELECT E.DEPTNO           "DEPARTMENT NO",
       DNAME              "DEPARTMENT NAME",
       MIN(SAL)           "MINIMUM SALARY",
       MAX(SAL)           "MAXIMUM SALARY",
       ROUND(AVG(SAL), 2) "AVAERAGE SALARY"
FROM EMP E
         JOIN
     DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY DNAME, E.DEPTNO;

-- 35. Show the output for count function on empno, comm and * .(Justify your answer)
SELECT COUNT(EMPNO) "EMPLOYEE COUNT"
FROM EMP;

SELECT COUNT(COMM) "COMMISSION COUNT"
FROM EMP;

SELECT COUNT(*) "ALL COL COUNT"
FROM EMP;

-- 36. Find the names of managers of each employee.(display Ename, Mangername)[use self-join]
SELECT E.ENAME "EMPLOYEE NAME", M.ENAME "MANAGER NAME"
FROM EMP E,
     EMP M
WHERE E.MGR = M.EMPNO;

-- 37. Find the experience of each employee.
SELECT ENAME "EMPLOYEE NAME", ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE) / 12) "EXPERIENCE (IN YEARS)"
FROM EMP;

-- 38. Find the name of junior most employee.
SELECT ENAME "NAME", HIREDATE
FROM EMP
WHERE HIREDATE = (SELECT MAX(HIREDATE) FROM EMP);

-- 39. Find the name of senior most employee.
SELECT ENAME "NAME", HIREDATE
FROM EMP
WHERE HIREDATE = (SELECT MIN(HIREDATE) FROM EMP);


-- 40. Find the deptno with highest number of employees.
SELECT D.DNAME, D.DEPTNO, COUNT(D.DEPTNO) "NUMBER OF EMPLOYEES"
FROM EMP E
         JOIN DEPT D ON E.DEPTNO = D.DEPTNO
GROUP BY D.DEPTNO, D.DNAME
ORDER BY COUNT(D.DEPTNO) DESC;