<center><h1 >Shri Ramdeobaba College of Engineering and Management<br>Nagpur 4400013</h1></center>
<center><h1 >Department of Computer Science Engineering (AIML)</h1></center>
<center><h2 >Database Management Lab - Practical 3</h2></center>

---

<!-- TOC -->

    * [A. Sequences](#a-sequences)
    * [B. Views](#b-views)
      * [Questions On Views](#questions-on-views)
    * [C. SYNONYMS](#c-synonyms)
    * [D. INDEXES](#d-indexes)

<!-- TOC -->

<div class="text aim">Aim : To study the relational database model and to understand the categorization of SQl statements.
️</div>

---

### A. Sequences

<div class="text">Create a Sequence</div>

```sql
CREATE SEQUENCE S1;
```

<div class="text">Get Next Value of Sequence</div>

```sql
SELECT S1.nextval "NEXT"
FROM DUAL;
```

```text
+----+
|NEXT|
+----+
|1   |
+----+
```

<div class="text">Get Current Value of Sequence</div>

```sql
SELECT S1.currval "CURRENT"
FROM DUAL;
```

```text
+-------+
|CURRENT|
+-------+
|1      |
+-------+
```

<div class="text">Create Sequence with custom start and end values</div>

```sql
CREATE SEQUENCE S2
    START WITH 1
    MAXVALUE 20
    INCREMENT BY 2;
```

```sql
SELECT S2.nextval
FROM DUAL;
```

```text
+-------+
|NEXT   |
+-------+
|1      |
+-------+

+-------+
|NEXT   |
+-------+
|3      |
+-------+
```

<div class="text">Create REVERSE Sequence with custom start and end values</div>

```sql
CREATE SEQUENCE S3
    MINVALUE 1
    MAXVALUE 10
    INCREMENT BY -1;
```

```sql
SELECT S3.nextval "NEXT"
FROM DUAL;
```

```text
+-------+
|NEXT   |
+-------+
|10     |
+-------+

+-------+
|NEXT   |
+-------+
|9      |
+-------+
```

<div class="text">Create REVERSE Sequence with custom start and end values</div>

```sql
CREATE SEQUENCE S3
    MINVALUE 1
    MAXVALUE 10
    INCREMENT BY -1;
```

```sql
SELECT S3.nextval "NEXT"
FROM DUAL;
```

```text
+-------+
|NEXT   |
+-------+
|10     |
+-------+

+-------+
|NEXT   |
+-------+
|9      |
+-------+
```

### B. Views

<div class="text">Create a View of the 'Course' table</div>

```sql
CREATE VIEW V1 AS
SELECT *
FROM COURSE
WHERE CREDIT > 2;
```

```sql
SELECT *
FROM V1;
```

```text
+---+-----+------+
|CID|CNAME|CREDIT|
+---+-----+------+
|101|ML   |4     |
|103|AI   |4     |
|104|OOP  |3     |
|106|DSA  |4     |
|102|DBMS |4     |
+---+-----+------+
```

<div class="text">Create a View of the 'Course' table with custom columns</div>

```sql
CREATE VIEW V2 AS
SELECT CID, CNAME
FROM COURSE;
```

```sql
SELECT *
FROM V2;
```

```text
+---+-----+
|CID|CNAME|
+---+-----+
|103|AI   |
|102|DBMS |
|106|DSA  |
|101|ML   |
|104|OOP  |
|105|PY   |
+---+-----+
```

<div class="text quote">This operation is possible in views but will only affect the view.</div>

```sql
INSERT INTO V2
VALUES (107, 'NLP');
```

```sql
DELETE
FROM V2
WHERE CNAME = 'NLP';
```

<div class="text">Create a READ ONLY View of the 'Course' table</div>

```sql
CREATE VIEW V3 AS
SELECT *
FROM PARTICIPANT
WITH READ ONLY;
```

```sql
SELECT *
FROM V3;
```

```text
+----+---------+------+----+
|PID |PNAME    |GENDER|CID |
+----+---------+------+----+
|1001|ANDY     |M     |103 |
|1002|ADRIAN   |M     |101 |
|1003|BENEDICT |M     |105 |
|1004|CHERRY   |F     |null|
|1005|FOSTER   |M     |104 |
|1007|LUCIFER  |M     |103 |
|1008|AMENADIEL|M     |106 |
|1009|LAUREN   |F     |104 |
|1011|DAN      |M     |101 |
|1012|KEVIN    |M     |105 |
|1013|LESLEEY  |F     |106 |
|1014|MARCUS   |M     |103 |
|1016|RACHAEL  |F     |106 |
|1017|MALCOLM  |M     |101 |
|1018|BRIAN    |M     |104 |
|1019|STEWIE   |M     |103 |
|1021|LOIS     |F     |106 |
|1022|DEBRA    |F     |105 |
|1023|DEXTER   |M     |103 |
+----+---------+------+----+
```

<div class="text">Create a View using a sub query</div>

```sql
CREATE VIEW V4 ("MIN", "MAX")
AS
SELECT MIN(CREDIT), MAX(CREDIT)
FROM COURSE;
```

```sql
SELECT *
FROM V4;
```

```text
+---+---+
|MIN|MAX|
+---+---+
|2  |4  |
+---+---+
```

<div class="text">Create a View using on two JOINED tables</div>

```sql
CREATE VIEW V5
AS
SELECT PID, PNAME, C.CID, CNAME
FROM COURSE C,
     PARTICIPANT P
WHERE C.CID = P.CID;
```

```sql
SELECT *
FROM V5;
```

```text
+----+---------+---+-----+
|PID |PNAME    |CID|CNAME|
+----+---------+---+-----+
|1001|ANDY     |103|AI   |
|1002|ADRIAN   |101|ML   |
|1003|BENEDICT |105|PY   |
|1005|FOSTER   |104|OOP  |
|1007|LUCIFER  |103|AI   |
|1008|AMENADIEL|106|DSA  |
|1009|LAUREN   |104|OOP  |
|1011|DAN      |101|ML   |
|1012|KEVIN    |105|PY   |
|1013|LESLEEY  |106|DSA  |
|1014|MARCUS   |103|AI   |
|1016|RACHAEL  |106|DSA  |
|1017|MALCOLM  |101|ML   |
|1018|BRIAN    |104|OOP  |
|1019|STEWIE   |103|AI   |
|1021|LOIS     |106|DSA  |
|1022|DEBRA    |105|PY   |
|1023|DEXTER   |103|AI   |
+----+---------+---+-----+
```

#### Questions On Views

<div class="text">Q1. View to find total, min, max, avg salary.</div>

```sql
CREATE VIEW AGGREGATE_VIEW (MAXIMUM_SAL, MINIMUM_SAL, AVERAGE_SAL, TOTAL_SAL) AS
SELECT MAX(SAL), MIN(SAL), ROUND(AVG(SAL), 4), SUM(SAL)
FROM EMP;
```

```sql
SELECT *
FROM AGGREGATE_VIEW;
```

```text
+-----------+-----------+-----------+---------+
|MAXIMUM_SAL|MINIMUM_SAL|AVERAGE_SAL|TOTAL_SAL|
+-----------+-----------+-----------+---------+
|5000       |800        |2073.2143  |29025    |
+-----------+-----------+-----------+---------+
```

<div class="text">Q2. View displays deptno, deptname, enum and ename</div>

```sql
CREATE VIEW EMPDATA_VIEW (DEPT_NUM, DEPT_NAME, EMP_NUM, EMP_NAME) AS
SELECT D.DEPTNO, DNAME, EMPNO, ENAME
FROM DEPT D,
     EMP E
WHERE D.DEPTNO = E.DEPTNO;
```

```sql
SELECT *
FROM EMPDATA_VIEW;
```

```text
+--------+----------+-------+--------+
|DEPT_NUM|DEPT_NAME |EMP_NUM|EMP_NAME|
+--------+----------+-------+--------+
|10      |ACCOUNTING|7782   |CLARK   |
|10      |ACCOUNTING|7934   |MILLER  |
|10      |ACCOUNTING|7839   |KING    |
|20      |RESEARCH  |7902   |FORD    |
|20      |RESEARCH  |7788   |SCOTT   |
|20      |RESEARCH  |7566   |JONES   |
|20      |RESEARCH  |7369   |SMITH   |
|20      |RESEARCH  |7876   |ADAMS   |
|30      |SALES     |7521   |WARD    |
|30      |SALES     |7654   |MARTIN  |
|30      |SALES     |7844   |TURNER  |
|30      |SALES     |7900   |JAMES   |
|30      |SALES     |7499   |ALLEN   |
|30      |SALES     |7698   |BLAKE   |
+--------+----------+-------+--------+
```

<div class="text">Q3. Create a view which displays the names of all employees working in deptno. 13.</div>

```sql
CREATE VIEW EMP_VIEW (EMP_NAME, DEPT_NUM) AS
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO = 30
WITH CHECK OPTION;
```

```sql
SELECT *
FROM EMP_VIEW;
```

```text
+--------+--------+
|EMP_NAME|DEPT_NUM|
+--------+--------+
|BLAKE   |30      |
|ALLEN   |30      |
|WARD    |30      |
|MARTIN  |30      |
|TURNER  |30      |
|JAMES   |30      |
+--------+--------+
```

```sql
UPDATE EMP_VIEW
SET EMP_VIEW.DEPT_NUM = 80
WHERE EMP_VIEW.DEPT_NUM = 30;
```

<div class="text">Q4. Create a view which should display details of all clerks present in emp table. (with check option view)</div>

```sql
CREATE VIEW CLERK_VIEW
AS
SELECT *
FROM EMP
WHERE JOB = 'CLERK'
WITH CHECK OPTION;
```

```sql
SELECT *
FROM CAT
WHERE TABLE_TYPE = 'VIEW';
```

```text
+--------------+----------+
|TABLE_NAME    |TABLE_TYPE|
+--------------+----------+
|V6            |VIEW      |
|V5            |VIEW      |
|V4            |VIEW      |
|V3            |VIEW      |
|V2            |VIEW      |
|V1            |VIEW      |
|TEST_VIEW_RO  |VIEW      |
|EMP_VIEW      |VIEW      |
|EMPDATA_VIEW  |VIEW      |
|AGGREGATE_VIEW|VIEW      |
+--------------+----------+
```

### C. SYNONYMS

<div class="text">Create a synonym on the HR schema</div>

```sql
CREATE SYNONYM S1 FOR EMP;
```

```sql
SELECT *
FROM S1;
```

```text
+-----+------+---------+----+----------+-------+-------+------+
|EMPNO|ENAME |JOB      |MGR |HIREDATE  |SAL    |COMM   |DEPTNO|
+-----+------+---------+----+----------+-------+-------+------+
|7839 |KING  |PRESIDENT|null|1981-11-17|5000.00|null   |10    |
|7698 |BLAKE |MANAGER  |7839|1981-05-01|2850.00|null   |30    |
|7782 |CLARK |MANAGER  |7839|1981-06-09|2450.00|null   |10    |
|7566 |JONES |MANAGER  |7839|1981-04-02|2975.00|null   |20    |
|7788 |SCOTT |ANALYST  |7566|1982-12-09|3000.00|null   |20    |
|7902 |FORD  |ANALYST  |7566|1981-12-03|3000.00|null   |20    |
|7369 |SMITH |CLERK    |7902|1980-12-17|800.00 |null   |20    |
|7499 |ALLEN |SALESMAN |7698|1981-02-20|1600.00|300.00 |30    |
|7521 |WARD  |SALESMAN |7698|1981-02-22|1250.00|500.00 |30    |
|7654 |MARTIN|SALESMAN |7698|1981-09-28|1250.00|1400.00|30    |
|7844 |TURNER|SALESMAN |7698|1981-09-08|1500.00|0.00   |30    |
|7876 |ADAMS |CLERK    |7788|1983-01-12|1100.00|null   |20    |
|7900 |JAMES |CLERK    |7698|1981-12-03|950.00 |null   |30    |
|7934 |MILLER|CLERK    |7782|1982-01-23|1300.00|null   |10    |
+-----+------+---------+----+----------+-------+-------+------+
```

<div class="text">Describing a synonym</div>

```text
SQL> DESCRIBE S1;
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

<div class="text">Describing user synonym</div>

```text
SQL> DESCRIBE USER_SYNONYMS;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SYNONYM_NAME                              NOT NULL VARCHAR2(30)
 TABLE_OWNER                                        VARCHAR2(30)
 TABLE_NAME                                NOT NULL VARCHAR2(30)
 DB_LINK                                            VARCHAR2(128)
```

<div class="text">Creating a public synonym</div>

```sql
CREATE PUBLIC SYNONYM SP FOR DEPT;
```

```sql
SELECT *
FROM SP;
```

```text
+------+----------+--------+
|DEPTNO|DNAME     |LOC     |
+------+----------+--------+
|10    |ACCOUNTING|NEW YORK|
|20    |RESEARCH  |DALLAS  |
|30    |SALES     |CHICAGO |
|40    |OPERATIONS|BOSTON  |
+------+----------+--------+
```

### D. INDEXES

<div class="text">Conditional Query without indexing</div>

```TEXT
SQL> set autotrace on;
SP2-0618: Cannot find the Session Identifier.  Check PLUSTRACE role is enabled
SP2-0611: Error enabling STATISTICS report
SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE ENAME = 'BLAKE';
```

```TEXT
ENAME
----------
BLAKE


Execution Plan
----------------------------------------------------------
Plan hash value: 3956160932

--------------------------------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |      |     1 |     6 |     3   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| EMP  |     1 |     6 |     3   (0)| 00:00:01 |
--------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - filter("ENAME"='BLAKE')
```

<div class="text">Conditional Query WITH indexing</div>

```TEXT
SQL> CREATE INDEX EMP_ENAME ON EMP(ENAME);

Index created.
```

```TEXT
SQL> SELECT ENAME
  2  FROM EMP
  3  WHERE ENAME = 'BLAKE';

ENAME
----------
BLAKE


Execution Plan
----------------------------------------------------------
Plan hash value: 1221021741

------------------------------------------------------------------------------
| Id  | Operation        | Name      | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------
|   0 | SELECT STATEMENT |           |     1 |     6 |     1   (0)| 00:00:01 |
|*  1 |  INDEX RANGE SCAN| EMP_ENAME |     1 |     6 |     1   (0)| 00:00:01 |
------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - access("ENAME"='BLAKE')
```

<div class="text">Conditional Query WITH indexing</div>

```TEXT
SQL> CREATE INDEX EMP_SAL ON EMP(SAL);

Index created.
```

```TEXT
SQL> SELECT SAL FROM EMP WHERE SAL = 2000;

no rows selected


Execution Plan
----------------------------------------------------------
Plan hash value: 2103511451

----------------------------------------------------------------------------
| Id  | Operation        | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
----------------------------------------------------------------------------
|   0 | SELECT STATEMENT |         |     1 |     4 |     1   (0)| 00:00:01 |
|*  1 |  INDEX RANGE SCAN| EMP_SAL |     1 |     4 |     1   (0)| 00:00:01 |
----------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - access("SAL"=2000)
```

<div class="text">Conditional Query WITHOUT indexing</div>

```TEXT
SQL> SELECT * FROM EMP WHERE JOB = 'CLERK';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7876 ADAMS      CLERK           7788 12-JAN-83       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10


Execution Plan
----------------------------------------------------------
Plan hash value: 3956160932

--------------------------------------------------------------------------
| Id  | Operation         | Name | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------
|   0 | SELECT STATEMENT  |      |     3 |   114 |     3   (0)| 00:00:01 |
|*  1 |  TABLE ACCESS FULL| EMP  |     3 |   114 |     3   (0)| 00:00:01 |
--------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - filter("JOB"='CLERK')
```

<div class="text">Conditional Query WITH indexing</div>

```TEXT
SQL> CREATE INDEX EMP_JOB ON EMP(JOB);

Index created.
```

```TEXT
SQL> SELECT * FROM EMP WHERE JOB = 'CLERK';

     EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM     DEPTNO
---------- ---------- --------- ---------- --------- ---------- ---------- ----------
      7369 SMITH      CLERK           7902 17-DEC-80        800                    20
      7876 ADAMS      CLERK           7788 12-JAN-83       1100                    20
      7900 JAMES      CLERK           7698 03-DEC-81        950                    30
      7934 MILLER     CLERK           7782 23-JAN-82       1300                    10


Execution Plan
----------------------------------------------------------
Plan hash value: 3938969085

---------------------------------------------------------------------------------------
| Id  | Operation                   | Name    | Rows  | Bytes | Cost (%CPU)| Time     |
---------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT            |         |     3 |   114 |     2   (0)| 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| EMP     |     3 |   114 |     2   (0)| 00:00:01 |
|*  2 |   INDEX RANGE SCAN          | EMP_JOB |     3 |       |     1   (0)| 00:00:01 |
---------------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   2 - access("JOB"='CLERK')
```

```text
SQL> CREATE UNIQUE INDEX DEPT_DNAME ON SCOTT.DEPT(DNAME);  
 
Index created. 

SQL> CREATE BITMAP INDEX DEPT_DNAME ON SCOTT.DEPT(DNAME);   

Index created.
```

<style>
h3{
    font-size: 22px;
}

h1, h2, h3{
    font-family: 'Walbaum Text'
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