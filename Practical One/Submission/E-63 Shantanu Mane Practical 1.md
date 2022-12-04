<center><h1 style="font-family: 'Walbaum Text'">Shri Ramdeobaba College of Engineering and Management<br>Nagpur 4400013</h1></center>
<center><h1 style="font-family: 'Walbaum Text'">Department of Computer Science Engineering (AIML)</h1></center>
<center><h2 style="font-family: 'Walbaum Text'">Database Management Lab - Practical 1</h2></center>

---

<div style="font-family: 'IBM Plex Sans'; font-size: 24px;padding: 20px 0px 20px 0px">Aim : To study the relational database model and to understand the categorization of SQl statements.
️</div>

#### <div style="font-family: 'IBM Plex Sans';">Connection to Environment</div>

```text
SQL> connect system/system;
Connected.
```

<div style="font-family: 'IBM Plex Sans';">Check Current User</div>

```text
SQL> SHOW USER;
USER is "SYSTEM"
```

<div style="font-family: 'IBM Plex Sans';">Create New Local User</div>

```text
SQL> CREATE USER shan IDENTIFIED BY shan;
User Created.
```

<div style="font-family: 'IBM Plex Sans';">Display All Users</div>

```TEXT
SQL> SELECT USERNAME FROM ALL_USERS
```

```text
+----------------+
|USERNAME        |
+----------------+
|XS$NULL         |
|SCOTT           |
|SHAN            |
|APEX_040000     |
|APEX_PUBLIC_USER|
|FLOWS_FILES     |
|HR              |
|MDSYS           |
|ANONYMOUS       |
|XDB             |
|CTXSYS          |
|APPQOSSYS       |
|DBSNMP          |
|ORACLE_OCM      |
|DIP             |
|OUTLN           |
|SYSTEM          |
|SYS             |
+----------------+
```

<div style="font-family: 'IBM Plex Sans';">Grant Resources to all Users</div>

```text
SQL> GRANT CONNECT, RESOURCE TO SHAN;
GRANT SUCCEEDED
```

<div style="font-family: 'IBM Plex Sans';">Connect to Shan User</div>

```text
SQL> connect shan/shan;
Connected.
```

```text
SQL> SHOW USER;
USER is "SHAN"
```

---

<div style="font-family: 'IBM Plex Sans';">Exploring In-Built Schemas</div>

```sql
DESC EMP;
```

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

```sql
DESCRIBE DEPT;
```

```text
Name                                      Null?    Type
----------------------------------------- -------- ----------------------------
DEPTNO                                    NOT NULL NUMBER(2)
DNAME                                              VARCHAR2(14)
LOC                                                VARCHAR2(13)
```

<br>
---
<br>

<div style="font-family: 'IBM Plex Sans';">Querying the In-Built Tables</div>

```sql
SELECT *
FROM EMP;
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

```sql
SELECT *
FROM DEPT;
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

---

<div style="font-family: 'IBM Plex Sans';">Conditional Query Using `WHERE` Clause</div>

```sql
SELECT *
FROM DEPT
WHERE DEPTNO = 10;
```

```text
+------+----------+--------+
|DEPTNO|DNAME     |LOC     |
+------+----------+--------+
|10    |ACCOUNTING|NEW YORK|
+------+----------+--------+
```

```sql
SELECT *
FROM EMP
WHERE DEPTNO = 10;
```

```text
+-----+------+---------+----+----------+-------+----+------+
|EMPNO|ENAME |JOB      |MGR |HIREDATE  |SAL    |COMM|DEPTNO|
+-----+------+---------+----+----------+-------+----+------+
|7839 |KING  |PRESIDENT|null|1981-11-17|5000.00|null|10    |
|7782 |CLARK |MANAGER  |7839|1981-06-09|2450.00|null|10    |
|7934 |MILLER|CLERK    |7782|1982-01-23|1300.00|null|10    |
+-----+------+---------+----+----------+-------+----+------+
```

<div style="font-family: 'IBM Plex Sans';">Printing One Column(s)</div>

```sql
SELECT JOB
FROM EMP;
```

```text
+---------+
|JOB      |
+---------+
|PRESIDENT|
|MANAGER  |
|MANAGER  |
|MANAGER  |
|ANALYST  |
|ANALYST  |
|CLERK    |
|SALESMAN |
|SALESMAN |
|SALESMAN |
|SALESMAN |
|CLERK    |
|CLERK    |
|CLERK    |
+---------+
```

<div style="font-family: 'IBM Plex Sans';">Printing One Column(s) With Distinct Values</div>

```sql
SELECT DISTINCT JOB
FROM EMP;
```

```text
+---------+
|JOB      |
+---------+
|CLERK    |
|SALESMAN |
|PRESIDENT|
|MANAGER  |
|ANALYST  |
+---------+
```

<div style="font-family: 'IBM Plex Sans';">Printing NULL Values from a Table</div>

```sql
SELECT *
FROM EMP
WHERE COMM IS NULL;
```

```text
+-----+------+---------+----+----------+-------+----+------+
|EMPNO|ENAME |JOB      |MGR |HIREDATE  |SAL    |COMM|DEPTNO|
+-----+------+---------+----+----------+-------+----+------+
|7839 |KING  |PRESIDENT|null|1981-11-17|5000.00|null|10    |
|7698 |BLAKE |MANAGER  |7839|1981-05-01|2850.00|null|30    |
|7782 |CLARK |MANAGER  |7839|1981-06-09|2450.00|null|10    |
|7566 |JONES |MANAGER  |7839|1981-04-02|2975.00|null|20    |
|7788 |SCOTT |ANALYST  |7566|1982-12-09|3000.00|null|20    |
|7902 |FORD  |ANALYST  |7566|1981-12-03|3000.00|null|20    |
|7369 |SMITH |CLERK    |7902|1980-12-17|800.00 |null|20    |
|7876 |ADAMS |CLERK    |7788|1983-01-12|1100.00|null|20    |
|7900 |JAMES |CLERK    |7698|1981-12-03|950.00 |null|30    |
|7934 |MILLER|CLERK    |7782|1982-01-23|1300.00|null|10    |
+-----+------+---------+----+----------+-------+----+------+
```

<div style="font-family: 'IBM Plex Sans';">Printing NON NULL Values from a Table</div>

```sql
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;
```

```text
+-----+------+--------+----+----------+-------+-------+------+
|EMPNO|ENAME |JOB     |MGR |HIREDATE  |SAL    |COMM   |DEPTNO|
+-----+------+--------+----+----------+-------+-------+------+
|7499 |ALLEN |SALESMAN|7698|1981-02-20|1600.00|300.00 |30    |
|7521 |WARD  |SALESMAN|7698|1981-02-22|1250.00|500.00 |30    |
|7654 |MARTIN|SALESMAN|7698|1981-09-28|1250.00|1400.00|30    |
|7844 |TURNER|SALESMAN|7698|1981-09-08|1500.00|0.00   |30    |
+-----+------+--------+----+----------+-------+-------+------+
```

---

<div style="font-family: 'IBM Plex Sans';">Working With Custom Tables - COURSE</div>

```sql
CREATE TABLE COURSE
(
    CID    NUMBER(3)    NOT NULL,
    CNAME  VARCHAR2(30) NOT NULL,
    CREDIT NUMBER(1),
    CONSTRAINT COURSE_PK_CID PRIMARY KEY (CID),
    CONSTRAINT COURSE_CK_CID CHECK (CID BETWEEN 101 AND 149),
    CONSTRAINT COURSE_CK_CREDIT CHECK (CREDIT BETWEEN 1 AND 5),
    CONSTRAINT COURSE_UQ_CNAME UNIQUE (CNAME)
);
```

<div style="font-family: 'IBM Plex Sans';">Working With Custom Tables - PARTICIPANT</div>

```sql
CREATE TABLE PARTICIPANT
(
    PID    NUMBER(4)    NOT NULL,
    PNAME  VARCHAR2(25) NOT NULL,
    GENDER CHAR(1)      NOT NULL,
    CID    NUMBER(3),
    CONSTRAINT PARTICIPANT_PK_PID PRIMARY KEY (PID),
    CONSTRAINT PARTICIPANT_CK_PID CHECK (PID BETWEEN 1001 AND 9999),
    CONSTRAINT PARTICIPANT_CK_GENDER CHECK (GENDER IN ('M', 'F')),
    CONSTRAINT PARTICIPANT_FK_COURSE_CID FOREIGN KEY
        (CID) REFERENCES COURSE (CID)
);
```

<div style="font-family: 'IBM Plex Sans';">Describing the Database - COURSE</div>

```sql
DESCRIBE COURSE;
```

```text
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 CID                                       NOT NULL NUMBER(3)
 CNAME                                     NOT NULL VARCHAR2(30)
 CREDIT                                             NUMBER(1)
```

<div style="font-family: 'IBM Plex Sans';">Describing the Database - PARTICIPANT</div>

```sql
DESCRIBE PARTICIPANT;
```

```text
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 PID                                       NOT NULL NUMBER(4)
 PNAME                                     NOT NULL VARCHAR2(25)
 GENDER                                    NOT NULL CHAR(1)
 CID                                                NUMBER(3)
```

### <div style="font-family: 'IBM Plex Sans';">Inserting Values in Schemas Course and Participant</div>

<div style="font-family: 'IBM Plex Sans';">INSERTING VALUES IN ORDER</div>

```sql
INSERT INTO COURSE (CID, CNAME, CREDIT)
VALUES (101, 'ML', 4);
```

```sql
INSERT INTO PARTICIPANT(PID, PNAME, GENDER, CID)
VALUES (1001, 'ANDY', 'M', 103);
```

<div style="font-family: 'IBM Plex Sans';">INSERTING VALUES IN DIFFERENT ORDER</div>

```sql
INSERT INTO COURSE (CNAME, CID, CREDIT)
VALUES ('DBMS', 102, 4);
```

```sql
INSERT INTO PARTICIPANT(PNAME, PID, CID, GENDER)
VALUES ('ADRIAN', 1002, 101, 'M');
```

<div style="font-family: 'IBM Plex Sans';">INSERTING IN ORDER WITHOUT ANY PARAMETER</div>

```sql
INSERT INTO COURSE
VALUES (103, 'AI', 4);
```

```sql
INSERT INTO PARTICIPANT
VALUES (1003, 'BENEDICT', 'M', 105);
```

<div style="font-family: 'IBM Plex Sans';">INSERTING MULTIPLE VALUES AT A TIME</div>

```sql
INSERT ALL
    INTO COURSE
VALUES (104, 'OOP', 3)
INTO COURSE
VALUES (105, 'PY', 2)
INTO COURSE
VALUES (106, 'DSA', 4)
SELECT *
FROM DUAL;

INSERT ALL
    INTO PARTICIPANT
VALUES (1004, 'CHERRY', 'F', NULL)
INTO PARTICIPANT
VALUES (1005, 'FOSTER', 'M', 104)
INTO PARTICIPANT
VALUES (1006, 'MARTHA', 'F', 102)
SELECT *
FROM DUAL;
```

<div style="font-family: 'IBM Plex Sans';">INSERTING MULTIPLE PARTICIPANTS IN ONE COURSE</div>

```SQL
INSERT INTO PARTICIPANT
VALUES (1007, 'LUCIFER', 'M', 103);
```

```sql
INSERT ALL
    INTO PARTICIPANT
VALUES (1009, 'LAUREN', 'F', 104)
INTO PARTICIPANT
VALUES (1010, 'CHLOE', 'F', 102)
INTO PARTICIPANT
VALUES (1011, 'DAN', 'M', 101)
INTO PARTICIPANT
VALUES (1012, 'KEVIN', 'M', 105)
INTO PARTICIPANT
VALUES (1013, 'LESLEEY', 'F', 106)
INTO PARTICIPANT
VALUES (1014, 'MARCUS', 'M', 103)
INTO PARTICIPANT
VALUES (1015, 'TOM', 'M', 102)
INTO PARTICIPANT
VALUES (1016, 'RACHAEL', 'F', 106)
INTO PARTICIPANT
VALUES (1017, 'MALCOLM', 'M', 101)
INTO PARTICIPANT
VALUES (1018, 'BRIAN', 'M', 104)
INTO PARTICIPANT
VALUES (1019, 'STEWIE', 'M', 103)
INTO PARTICIPANT
VALUES (1020, 'PETER', 'M', 102)
INTO PARTICIPANT
VALUES (1021, 'LOIS', 'F', 106)
INTO PARTICIPANT
VALUES (1022, 'DEBRA', 'F', 105)
INTO PARTICIPANT
VALUES (1023, 'DEXTER', 'M', 103)
SELECT *
FROM DUAL;
```

<div style="font-family: 'IBM Plex Sans';">Result</div>

```sql
SELECT *
FROM COURSE;
```

```text
+---+-----+------+
|CID|CNAME|CREDIT|
+---+-----+------+
|101|ML   |4     |
|102|DBMS |4     |
|103|AI   |4     |
|104|OOP  |3     |
|105|PY   |2     |
|106|DSA  |4     |
+---+-----+------+
```

```SQL
SELECT *
FROM PARTICIPANT;
```

```text
+----+---------+------+----+
|PID |PNAME    |GENDER|CID |
+----+---------+------+----+
|1001|ANDY     |M     |103 |
|1002|ADRIANA  |F     |101 |
|1003|BENEDICT |M     |105 |
|1004|CHERRY   |F     |null|
|1005|FOSTER   |M     |104 |
|1006|MARTHA   |F     |102 |
|1007|LUCIFER  |M     |103 |
|1008|AMENADIEL|M     |106 |
|1009|LAUREN   |F     |104 |
|1010|CHLOE    |F     |102 |
|1011|DAN      |M     |101 |
|1012|KEVIN    |M     |105 |
|1013|LESLEEY  |F     |106 |
|1014|MARCUS   |M     |103 |
|1015|TOM      |M     |102 |
|1016|RACHAEL  |F     |106 |
|1017|MALCOLM  |M     |101 |
|1018|BRIAN    |M     |104 |
|1019|STEWIE   |M     |103 |
|1020|PETER    |M     |102 |
|1021|LOIS     |F     |106 |
|1022|DEBRA    |F     |105 |
|1023|DEXTER   |M     |103 |
+----+---------+------+----+
```

!!! `COMMIT;` After adding or updating data!

#### <div style="font-family: 'IBM Plex Sans';">Checking The Constraints in our DB</div>

<div style="font-family: 'IBM Plex Sans';">ALL CONSTRAINTS</div>

```sql
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS;
```

```text
+------------------------------+------------------------------+---------------+
|TABLE_NAME                    |CONSTRAINT_NAME               |CONSTRAINT_TYPE|
+------------------------------+------------------------------+---------------+
|DEPT                          |SYS_C006997                   |P              |
|EMP                           |SYS_C006998                   |C              |
|EMP                           |SYS_C006999                   |P              |
|EMP                           |SYS_C007000                   |R              |
|EMP                           |SYS_C007001                   |R              |
|DEMO_USERS                    |DEMO_USERS_PK                 |P              |
|DEMO_CUSTOMERS                |SYS_C007003                   |C              |
|DEMO_CUSTOMERS                |SYS_C007004                   |C              |
|DEMO_CUSTOMERS                |SYS_C007005                   |C              |
|DEMO_CUSTOMERS                |DEMO_CUST_CREDIT_LIMIT_MAX    |C              |
|DEMO_CUSTOMERS                |DEMO_CUSTOMERS_PK             |P              |
|DEMO_ORDERS                   |SYS_C007008                   |C              |
|DEMO_ORDERS                   |SYS_C007009                   |C              |
|DEMO_ORDERS                   |DEMO_ORDER_TOTAL_MIN          |C              |
|DEMO_ORDERS                   |DEMO_ORDER_PK                 |P              |
|DEMO_ORDERS                   |DEMO_ORDERS_CUSTOMER_ID_FK    |R              |
|DEMO_ORDERS                   |DEMO_ORDERS_USER_ID_FK        |R              |
|DEMO_PRODUCT_INFO             |SYS_C007014                   |C              |
|DEMO_PRODUCT_INFO             |DEMO_PRODUCT_INFO_PK          |P              |
|DEMO_ORDER_ITEMS              |SYS_C007016                   |C              |
|DEMO_ORDER_ITEMS              |SYS_C007017                   |C              |
|DEMO_ORDER_ITEMS              |SYS_C007018                   |C              |
|DEMO_ORDER_ITEMS              |SYS_C007019                   |C              |
|DEMO_ORDER_ITEMS              |SYS_C007020                   |C              |
|DEMO_ORDER_ITEMS              |DEMO_ORDER_ITEMS_PK           |P              |
|DEMO_ORDER_ITEMS              |DEMO_ORDER_ITEMS_FK           |R              |
|DEMO_ORDER_ITEMS              |DEMO_ORDER_ITEMS_PRODUCT_ID_FK|R              |
|APEX$_ACL                     |SYS_C007024                   |C              |
|APEX$_ACL                     |SYS_C007025                   |C              |
|APEX$_ACL                     |SYS_C007026                   |C              |
|APEX$_ACL                     |SYS_C007027                   |C              |
|APEX$_ACL                     |SYS_C007028                   |C              |
|APEX$_ACL                     |SYS_C007029                   |C              |
|APEX$_ACL                     |APEX$_ACL_PRIV_CK             |C              |
|APEX$_ACL                     |APEX$_ACL_PK                  |P              |
|APEX$_WS_WEBPG_SECTIONS       |SYS_C007032                   |C              |
|APEX$_WS_WEBPG_SECTIONS       |SYS_C007033                   |C              |
|APEX$_WS_WEBPG_SECTIONS       |SYS_C007034                   |C              |
|APEX$_WS_WEBPG_SECTIONS       |SYS_C007035                   |C              |
|APEX$_WS_WEBPG_SECTIONS       |SYS_C007036                   |C              |
|APEX$_WS_WEBPG_SECTIONS       |APEX$_WS_WEBPG_SECTION_TYPE_CK|C              |
|APEX$_WS_WEBPG_SECTIONS       |APEX$_WS_WEBPG_SECTION_LINK_CK|C              |
|APEX$_WS_WEBPG_SECTIONS       |APEX$_WS_WEBPG_SECTION_3D_CK  |C              |
|APEX$_WS_WEBPG_SECTIONS       |APEX$_WS_WEBPG_SECTIONS_PK    |P              |
|APEX$_WS_ROWS                 |SYS_C007041                   |C              |
|APEX$_WS_ROWS                 |SYS_C007042                   |C              |
|APEX$_WS_ROWS                 |SYS_C007043                   |C              |
|APEX$_WS_ROWS                 |SYS_C007044                   |C              |
|APEX$_WS_ROWS                 |SYS_C007045                   |C              |
|APEX$_WS_ROWS                 |APEX$_WS_ROWS_PK              |P              |
|APEX$_WS_HISTORY              |SYS_C007047                   |C              |
|APEX$_WS_HISTORY              |SYS_C007048                   |C              |
|APEX$_WS_HISTORY              |SYS_C007049                   |C              |
|APEX$_WS_NOTES                |SYS_C007050                   |C              |
|APEX$_WS_NOTES                |SYS_C007051                   |C              |
|APEX$_WS_NOTES                |SYS_C007052                   |C              |
|APEX$_WS_NOTES                |APEX$_WS_NOTES_CL_CK          |C              |
|APEX$_WS_NOTES                |APEX$_WS_NOTES_PK             |P              |
|APEX$_WS_NOTES                |APEX$_WS_NOTES_FK             |R              |
|APEX$_WS_LINKS                |SYS_C007056                   |C              |
|APEX$_WS_LINKS                |SYS_C007057                   |C              |
|APEX$_WS_LINKS                |SYS_C007058                   |C              |
|APEX$_WS_LINKS                |SYS_C007059                   |C              |
|APEX$_WS_LINKS                |SYS_C007060                   |C              |
|APEX$_WS_LINKS                |APEX$_WS_LINKS_CL_CK          |C              |
|APEX$_WS_LINKS                |APEX$_WS_LINKS_SH_CK          |C              |
|APEX$_WS_LINKS                |APEX$_WS_LINKS_PK             |P              |
|APEX$_WS_LINKS                |APEX$_WS_LINKS_FK             |R              |
|APEX$_WS_TAGS                 |SYS_C007065                   |C              |
|APEX$_WS_TAGS                 |SYS_C007066                   |C              |
|APEX$_WS_TAGS                 |SYS_C007067                   |C              |
|APEX$_WS_TAGS                 |APEX$_WS_TAGS_CL_CK           |C              |
|APEX$_WS_TAGS                 |APEX$_WS_TAGS_PK              |P              |
|APEX$_WS_TAGS                 |APEX$_WS_TAGS_FK              |R              |
|APEX$_WS_FILES                |SYS_C007071                   |C              |
|APEX$_WS_FILES                |SYS_C007072                   |C              |
|APEX$_WS_FILES                |SYS_C007073                   |C              |
|APEX$_WS_FILES                |SYS_C007074                   |C              |
|APEX$_WS_FILES                |SYS_C007075                   |C              |
|APEX$_WS_FILES                |APEX$_WS_FILES_CL_CK          |C              |
|APEX$_WS_FILES                |APEX$_WS_FILES_PK             |P              |
|APEX$_WS_FILES                |APEX$_WS_FILES_FK             |R              |
|APEX$_WS_WEBPG_SECTION_HISTORY|SYS_C007079                   |C              |
|APEX$_WS_WEBPG_SECTION_HISTORY|SYS_C007080                   |C              |
|APEX$_WS_WEBPG_SECTION_HISTORY|SYS_C007081                   |C              |
|APEX$_WS_WEBPG_SECTION_HISTORY|SYS_C007082                   |C              |
|APEX$_WS_WEBPG_SECTION_HISTORY|SYS_C007083                   |C              |
|PERSON                        |SYS_C007084                   |P              |
|TEST                          |SYS_C007087                   |P              |
|BIN$8TK192CYRM+cG3IiuWbNBA==$0|BIN$icvnKcgxRMmCi/ZioBfRCA==$0|C              |
|BIN$8TK192CYRM+cG3IiuWbNBA==$0|BIN$AgOU5GwTQ7m7ZtzX06b/oQ==$0|C              |
|BIN$8TK192CYRM+cG3IiuWbNBA==$0|BIN$3DodkNB4RVGaMZ7ijQRYGg==$0|C              |
|BIN$8TK192CYRM+cG3IiuWbNBA==$0|BIN$p+kWAtvjS8yR8DPQ9N1Qpw==$0|C              |
|BIN$8TK192CYRM+cG3IiuWbNBA==$0|BIN$GIq9miPaQCmUyijfcJnPUA==$0|P              |
|BIN$8TK192CYRM+cG3IiuWbNBA==$0|BIN$oy69ao+NR1ay2MOdm0N0nA==$0|U              |
|BIN$J804f/KrQVC4my/Lfb/RKw==$0|BIN$j4n0kWXEReOlZkNYK0wJpA==$0|C              |
|BIN$J804f/KrQVC4my/Lfb/RKw==$0|BIN$MuDy5/ViS7KU54ovBKNOaw==$0|C              |
|BIN$J804f/KrQVC4my/Lfb/RKw==$0|BIN$V2YWLPzwQfOTmUe40IzIzg==$0|C              |
|BIN$J804f/KrQVC4my/Lfb/RKw==$0|BIN$dV48eSLBTv+he3xG6wmqbQ==$0|C              |
|BIN$J804f/KrQVC4my/Lfb/RKw==$0|BIN$DYwLxRInR1WF0Vy2//dZCA==$0|C              |
|BIN$J804f/KrQVC4my/Lfb/RKw==$0|BIN$sxgngVITS1qfPRrehHJoRQ==$0|P              |
|PARTICIPANT_1                 |SYS_C007127                   |C              |
|PARTICIPANT_1                 |SYS_C007128                   |C              |
|PARTICIPANT_1                 |SYS_C007129                   |C              |
|PARTICIPANT_2                 |SYS_C007130                   |C              |
|PARTICIPANT_2                 |SYS_C007131                   |C              |
|PARTICIPANT_2                 |SYS_C007132                   |C              |
|V3                            |SYS_C007147                   |O              |
|COURSE                        |SYS_C007168                   |C              |
|COURSE                        |SYS_C007169                   |C              |
|COURSE                        |COURSE_CK_CID                 |C              |
|COURSE                        |COURSE_CK_CREDIT              |C              |
|COURSE                        |COURSE_PK_CID                 |P              |
|COURSE                        |COURSE_UQ_CNAME               |U              |
|PARTICIPANT                   |SYS_C007174                   |C              |
|PARTICIPANT                   |SYS_C007175                   |C              |
|PARTICIPANT                   |SYS_C007176                   |C              |
|PARTICIPANT                   |PARTICIPANT_CK_PID            |C              |
|PARTICIPANT                   |PARTICIPANT_CK_GENDER         |C              |
|PARTICIPANT                   |PARTICIPANT_PK_PID            |P              |
|PARTICIPANT                   |PARTICIPANT_FK_COURSE_CID     |R              |
+------------------------------+------------------------------+---------------+
```

<div style="font-family: 'IBM Plex Sans';">CONSTRAINTS IN PARTICIPANT AND COURSE</div>

```sql
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME IN ('PARTICIPANT', 'COURSE');
```

```text
+-----------+-------------------------+---------------+
|TABLE_NAME |CONSTRAINT_NAME          |CONSTRAINT_TYPE|
+-----------+-------------------------+---------------+
|COURSE     |SYS_C007168              |C              |
|COURSE     |SYS_C007169              |C              |
|COURSE     |COURSE_CK_CID            |C              |
|COURSE     |COURSE_CK_CREDIT         |C              |
|COURSE     |COURSE_PK_CID            |P              |
|COURSE     |COURSE_UQ_CNAME          |U              |
|PARTICIPANT|SYS_C007174              |C              |
|PARTICIPANT|SYS_C007175              |C              |
|PARTICIPANT|SYS_C007176              |C              |
|PARTICIPANT|PARTICIPANT_CK_PID       |C              |
|PARTICIPANT|PARTICIPANT_CK_GENDER    |C              |
|PARTICIPANT|PARTICIPANT_PK_PID       |P              |
|PARTICIPANT|PARTICIPANT_FK_COURSE_CID|R              |
+-----------+-------------------------+---------------+
```

---

### <div style="font-family: 'IBM Plex Sans';">Lab Queries</div>

<div style="font-family: 'IBM Plex Sans';">Q1. Display details of all the male participants.</div>

```sql
SELECT *
FROM PARTICIPANT
WHERE GENDER = 'M';
```

```text
+----+---------+------+---+
|PID |PNAME    |GENDER|CID|
+----+---------+------+---+
|1001|ANDY     |M     |103|
|1003|BENEDICT |M     |105|
|1005|FOSTER   |M     |104|
|1007|LUCIFER  |M     |103|
|1008|AMENADIEL|M     |106|
|1011|DAN      |M     |101|
|1012|KEVIN    |M     |105|
|1014|MARCUS   |M     |103|
|1015|TOM      |M     |102|
|1017|MALCOLM  |M     |101|
|1018|BRIAN    |M     |104|
|1019|STEWIE   |M     |103|
|1020|PETER    |M     |102|
|1023|DEXTER   |M     |103|
+----+---------+------+---+
```

<div style="font-family: 'IBM Plex Sans';">Q2. Display male participants in order of their CID.</div>

```sql
SELECT *
FROM PARTICIPANT
WHERE GENDER = 'M'
ORDER BY CID ASC;
```

```text
+----+---------+------+---+
|PID |PNAME    |GENDER|CID|
+----+---------+------+---+
|1011|DAN      |M     |101|
|1017|MALCOLM  |M     |101|
|1020|PETER    |M     |102|
|1015|TOM      |M     |102|
|1007|LUCIFER  |M     |103|
|1023|DEXTER   |M     |103|
|1001|ANDY     |M     |103|
|1019|STEWIE   |M     |103|
|1014|MARCUS   |M     |103|
|1005|FOSTER   |M     |104|
|1018|BRIAN    |M     |104|
|1003|BENEDICT |M     |105|
|1012|KEVIN    |M     |105|
|1008|AMENADIEL|M     |106|
+----+---------+------+---+
```

<div style="font-family: 'IBM Plex Sans';">Q3. Display participants whose CID is NULL.</div>

```sql
SELECT *
FROM PARTICIPANT
WHERE CID IS NULL;
```

```text
+----+------+------+----+
|PID |PNAME |GENDER|CID |
+----+------+------+----+
|1004|CHERRY|F     |null|
+----+------+------+----+
```

<div style="font-family: 'IBM Plex Sans';">Q4. Display participants whose CID is NOT NULL.</div>

```sql
SELECT *
FROM PARTICIPANT
WHERE CID IS NOT NULL;
```

```text
+----+---------+------+---+
|PID |PNAME    |GENDER|CID|
+----+---------+------+---+
|1001|ANDY     |M     |103|
|1002|ADRIANA  |F     |101|
|1003|BENEDICT |M     |105|
|1005|FOSTER   |M     |104|
|1006|MARTHA   |F     |102|
|1007|LUCIFER  |M     |103|
|1008|AMENADIEL|M     |106|
|1009|LAUREN   |F     |104|
|1010|CHLOE    |F     |102|
|1011|DAN      |M     |101|
|1012|KEVIN    |M     |105|
|1013|LESLEEY  |F     |106|
|1014|MARCUS   |M     |103|
|1015|TOM      |M     |102|
|1016|RACHAEL  |F     |106|
|1017|MALCOLM  |M     |101|
|1018|BRIAN    |M     |104|
|1019|STEWIE   |M     |103|
|1020|PETER    |M     |102|
|1021|LOIS     |F     |106|
|1022|DEBRA    |F     |105|
|1023|DEXTER   |M     |103|
+----+---------+------+---+
```

<div style="font-family: 'IBM Plex Sans';">Q5. Display courses whose CREDIT is greater than 3.</div>

```sql
SELECT CID "COURSE ID", CNAME "COURSE NAME", CREDIT
FROM COURSE
WHERE CREDIT > 3;
```

```text
+---------+-----------+------+
|COURSE ID|COURSE NAME|CREDIT|
+---------+-----------+------+
|101      |ML         |4     |
|102      |DBMS       |4     |
|103      |AI         |4     |
|106      |DSA        |4     |
+---------+-----------+------+
```

<div style="font-family: 'IBM Plex Sans';">Q6. Display courses whose name starts with 'D'.</div>

```sql
SELECT CID "COURSE ID", CNAME "COURSE NAME", CREDIT
FROM COURSE
WHERE CNAME LIKE 'D%';
```

```text
+---------+-----------+------+
|COURSE ID|COURSE NAME|CREDIT|
+---------+-----------+------+
|102      |DBMS       |4     |
|106      |DSA        |4     |
+---------+-----------+------+
```

<div style="font-family: 'IBM Plex Sans';">Q7. Display courses whose name has 2nd letter 'A'.</div>

```sql
SELECT CID "COURSE ID", CNAME "COURSE NAME", CREDIT
FROM COURSE
WHERE CNAME LIKE '_A%';
```

```text
No rows selected.
```

<div style="font-family: 'IBM Plex Sans';">Q7. Display info of those who have taken DBMS.</div>

```sql
SELECT PID "ID", PNAME "PARTICIPANT NAME", C.CNAME, C.CID
FROM COURSE C
         JOIN PARTICIPANT P ON C.CID = P.CID
WHERE CNAME = 'DBMS';
```

```text
+----+----------------+-----+---+
|ID  |PARTICIPANT NAME|CNAME|CID|
+----+----------------+-----+---+
|1006|MARTHA          |DBMS |102|
|1010|CHLOE           |DBMS |102|
|1015|TOM             |DBMS |102|
|1020|PETER           |DBMS |102|
+----+----------------+-----+---+
```

### <div style="font-family: 'IBM Plex Sans';">Changing Metadata of the table `ALTER` clause.</div>

<div style="font-family: 'IBM Plex Sans';">Changing datatypes of columns.</div>

```sql
ALTER TABLE COURSE
    MODIFY CID NUMBER(4);
```

```sql
ALTER TABLE COURSE
    MODIFY CNAME VARCHAR2(40);
```

```TEXT
Name                                      Null?    Type
----------------------------------------- -------- ----------------------------
CID                                       NOT NULL NUMBER(4)
CNAME                                     NOT NULL VARCHAR2(40)
CREDIT                                             NUMBER(1)
```

<div style="font-family: 'IBM Plex Sans';">Adding columns.</div>

```sql
ALTER TABLE COURSE
    ADD DEPTNAME VARCHAR2(30);
```

```text
Name                                      Null?    Type
----------------------------------------- -------- ----------------------------
CID                                       NOT NULL NUMBER(4)
CNAME                                     NOT NULL VARCHAR2(40)
CREDIT                                             NUMBER(1)
DEPTNAME                                           VARCHAR2(30)
```

<div style="font-family: 'IBM Plex Sans';">Deleting Data.</div>

```sql
DELETE
FROM PARTICIPANT
WHERE CID = 101;
```

```text
+----+---------+------+----+
|PID |PNAME    |GENDER|CID |
+----+---------+------+----+
|1001|ANDY     |M     |103 |
|1003|BENEDICT |M     |105 |
|1004|CHERRY   |F     |null|
|1005|FOSTER   |M     |104 |
|1006|MARTHA   |F     |102 |
|1007|LUCIFER  |M     |103 |
|1008|AMENADIEL|M     |106 |
|1009|LAUREN   |F     |104 |
|1010|CHLOE    |F     |102 |
|1012|KEVIN    |M     |105 |
|1013|LESLEEY  |F     |106 |
|1014|MARCUS   |M     |103 |
|1015|TOM      |M     |102 |
|1016|RACHAEL  |F     |106 |
|1018|BRIAN    |M     |104 |
|1019|STEWIE   |M     |103 |
|1020|PETER    |M     |102 |
|1021|LOIS     |F     |106 |
|1022|DEBRA    |F     |105 |
|1023|DEXTER   |M     |103 |
+----+---------+------+----+
```

<div style="font-family: 'IBM Plex Sans';">Deleting Columns.</div>

```sql
ALTER TABLE PARTICIPANT
    DROP COLUMN GENDER;
```

```text
+----+---------+----+
|PID |PNAME    |CID |
+----+---------+----+
|1001|ANDY     |103 |
|1002|ADRIANA  |101 |
|1003|BENEDICT |105 |
|1004|CHERRY   |null|
|1005|FOSTER   |104 |
|1006|MARTHA   |102 |
|1007|LUCIFER  |103 |
|1008|AMENADIEL|106 |
|1009|LAUREN   |104 |
|1010|CHLOE    |102 |
|1011|DAN      |101 |
|1012|KEVIN    |105 |
|1013|LESLEEY  |106 |
|1014|MARCUS   |103 |
|1015|TOM      |102 |
|1016|RACHAEL  |106 |
|1017|MALCOLM  |101 |
|1018|BRIAN    |104 |
|1019|STEWIE   |103 |
|1020|PETER    |102 |
|1021|LOIS     |106 |
|1022|DEBRA    |105 |
|1023|DEXTER   |103 |
+----+---------+----+
```

<div style="font-family: 'IBM Plex Sans';">Q. Update the name and credit of course with CID 105.</div>

```sql
UPDATE COURSE
SET CNAME  = 'QM',
    CREDIT = 3
WHERE CID = 105;
```

```text
+---+-----+------+--------+
|CID|CNAME|CREDIT|DEPTNAME|
+---+-----+------+--------+
|101|ML   |4     |null    |
|102|DBMS |4     |null    |
|103|AI   |4     |null    |
|104|OOP  |3     |null    |
|105|QM   |3     |null    |
|106|DSA  |4     |null    |
+---+-----+------+--------+
```
