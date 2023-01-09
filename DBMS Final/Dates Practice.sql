SELECT *
FROM NLS_SESSION_PARAMETERS;

SELECT EXTRACT(YEAR FROM HIREDATE)  AS "YEAR OF JOINING",
       EXTRACT(MONTH FROM HIREDATE) AS "MONTH OF JOINING",
       EXTRACT(DAY FROM HIREDATE)   AS "DATE OF JOINING"
FROM EMP
WHERE ENAME = 'KING';

SELECT ENAME,
       ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE))      "MONTHS OF WORK",
       ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE) / 12) "YEARS OF WORK",
       SAL
FROM EMP
WHERE SAL > 2000;