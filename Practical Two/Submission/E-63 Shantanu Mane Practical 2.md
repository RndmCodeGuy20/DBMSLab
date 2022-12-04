<center><h1 style="font-family: 'Walbaum Text'">Shri Ramdeobaba College of Engineering and Management<br>Nagpur 4400013</h1></center>
<center><h1 style="font-family: 'Walbaum Text'">Department of Computer Science Engineering (AIML)</h1></center>
<center><h2 style="font-family: 'Walbaum Text'">Database Management Lab - Practical 2</h2></center>

---

<div style="font-family: 'IBM Plex Sans'; font-size: 24px;padding: 20px 0px 20px 0px">Aim : To study the relational database model and to understand the categorization of SQl statements.
️</div>

#### <div style="font-family: 'IBM Plex Sans';">Connection to Environment</div>

```text
SQL> connect system/system;
Connected.
```

### <div style="font-family: 'IBM Plex Sans';">Joins in SQL</div>

<div style="font-family: 'IBM Plex Sans';">Concat Operator</div>

```sql
SELECT PNAME || ' takes course in ' || CNAME || ' of ' || CREDIT || ' credits.'
FROM COURSE C
         JOIN PARTICIPANT P
              ON C.CID = P.CID;
```

```text
+-------------------------------------------------------+
|PNAME||'TAKESCOURSEIN'||CNAME||'OF'||CREDIT||'CREDITS.'|
+-------------------------------------------------------+
|MALCOLM takes course in ML of 4 credits.               |
|ADRIAN takes course in ML of 4 credits.                |
|DAN takes course in ML of 4 credits.                   |
|TOM takes course in DBMS of 4 credits.                 |
|CHLOE takes course in DBMS of 4 credits.               |
|PETER takes course in DBMS of 4 credits.               |
|MARTHA takes course in DBMS of 4 credits.              |
|ANDY takes course in AI of 4 credits.                  |
|DEXTER takes course in AI of 4 credits.                |
|MARCUS takes course in AI of 4 credits.                |
|LUCIFER takes course in AI of 4 credits.               |
|STEWIE takes course in AI of 4 credits.                |
|LAUREN takes course in OOP of 3 credits.               |
|BRIAN takes course in OOP of 3 credits.                |
|FOSTER takes course in OOP of 3 credits.               |
|BENEDICT takes course in PY of 2 credits.              |
|KEVIN takes course in PY of 2 credits.                 |
|DEBRA takes course in PY of 2 credits.                 |
|AMENADIEL takes course in DSA of 4 credits.            |
|LOIS takes course in DSA of 4 credits.                 |
|LESLEEY takes course in DSA of 4 credits.              |
|RACHAEL takes course in DSA of 4 credits.              |
+-------------------------------------------------------+
```

#### <div style="font-family: 'IBM Plex Sans';">Applying Various Inner Joins on Course and Participants Tables</div>

<div style="font-family: 'IBM Plex Sans';">1. Cross Join</div>

```sql
SELECT *
FROM PARTICIPANT
         CROSS JOIN COURSE;
```

```text
+----+---------+------+----+---+-----+------+
|PID |PNAME    |GENDER|CID |CID|CNAME|CREDIT|
+----+---------+------+----+---+-----+------+
|1001|ANDY     |M     |103 |101|ML   |4     |
|1002|ADRIAN   |M     |101 |101|ML   |4     |
|1003|BENEDICT |M     |105 |101|ML   |4     |
|1004|CHERRY   |F     |null|101|ML   |4     |
|1005|FOSTER   |M     |104 |101|ML   |4     |
|1006|MARTHA   |F     |102 |101|ML   |4     |
|1007|LUCIFER  |M     |103 |101|ML   |4     |
|1008|AMENADIEL|M     |106 |101|ML   |4     |
|1009|LAUREN   |F     |104 |101|ML   |4     |
|1010|CHLOE    |F     |102 |101|ML   |4     |
|1011|DAN      |M     |101 |101|ML   |4     |
|1012|KEVIN    |M     |105 |101|ML   |4     |
|1013|LESLEEY  |F     |106 |101|ML   |4     |
|1014|MARCUS   |M     |103 |101|ML   |4     |
|1015|TOM      |M     |102 |101|ML   |4     |
|1016|RACHAEL  |F     |106 |101|ML   |4     |
|1017|MALCOLM  |M     |101 |101|ML   |4     |
|1018|BRIAN    |M     |104 |101|ML   |4     |
|1019|STEWIE   |M     |103 |101|ML   |4     |
|1020|PETER    |M     |102 |101|ML   |4     |
|1021|LOIS     |F     |106 |101|ML   |4     |
|1022|DEBRA    |F     |105 |101|ML   |4     |
|1023|DEXTER   |M     |103 |101|ML   |4     |
|1001|ANDY     |M     |103 |102|DBMS |4     |
|1002|ADRIAN   |M     |101 |102|DBMS |4     |
|1003|BENEDICT |M     |105 |102|DBMS |4     |
|1004|CHERRY   |F     |null|102|DBMS |4     |
|1005|FOSTER   |M     |104 |102|DBMS |4     |
|1006|MARTHA   |F     |102 |102|DBMS |4     |
|1007|LUCIFER  |M     |103 |102|DBMS |4     |
|1008|AMENADIEL|M     |106 |102|DBMS |4     |
|1009|LAUREN   |F     |104 |102|DBMS |4     |
|1010|CHLOE    |F     |102 |102|DBMS |4     |
|1011|DAN      |M     |101 |102|DBMS |4     |
|1012|KEVIN    |M     |105 |102|DBMS |4     |
|1013|LESLEEY  |F     |106 |102|DBMS |4     |
|1014|MARCUS   |M     |103 |102|DBMS |4     |
|1015|TOM      |M     |102 |102|DBMS |4     |
|1016|RACHAEL  |F     |106 |102|DBMS |4     |
|1017|MALCOLM  |M     |101 |102|DBMS |4     |
|1018|BRIAN    |M     |104 |102|DBMS |4     |
|1019|STEWIE   |M     |103 |102|DBMS |4     |
|1020|PETER    |M     |102 |102|DBMS |4     |
|1021|LOIS     |F     |106 |102|DBMS |4     |
|1022|DEBRA    |F     |105 |102|DBMS |4     |
|1023|DEXTER   |M     |103 |102|DBMS |4     |
|1001|ANDY     |M     |103 |103|AI   |4     |
|1002|ADRIAN   |M     |101 |103|AI   |4     |
|1003|BENEDICT |M     |105 |103|AI   |4     |
|1004|CHERRY   |F     |null|103|AI   |4     |
|1005|FOSTER   |M     |104 |103|AI   |4     |
|1006|MARTHA   |F     |102 |103|AI   |4     |
|1007|LUCIFER  |M     |103 |103|AI   |4     |
|1008|AMENADIEL|M     |106 |103|AI   |4     |
|1009|LAUREN   |F     |104 |103|AI   |4     |
|1010|CHLOE    |F     |102 |103|AI   |4     |
|1011|DAN      |M     |101 |103|AI   |4     |
|1012|KEVIN    |M     |105 |103|AI   |4     |
|1013|LESLEEY  |F     |106 |103|AI   |4     |
|1014|MARCUS   |M     |103 |103|AI   |4     |
|1015|TOM      |M     |102 |103|AI   |4     |
|1016|RACHAEL  |F     |106 |103|AI   |4     |
|1017|MALCOLM  |M     |101 |103|AI   |4     |
|1018|BRIAN    |M     |104 |103|AI   |4     |
|1019|STEWIE   |M     |103 |103|AI   |4     |
|1020|PETER    |M     |102 |103|AI   |4     |
|1021|LOIS     |F     |106 |103|AI   |4     |
|1022|DEBRA    |F     |105 |103|AI   |4     |
|1023|DEXTER   |M     |103 |103|AI   |4     |
|1001|ANDY     |M     |103 |104|OOP  |3     |
|1002|ADRIAN   |M     |101 |104|OOP  |3     |
|1003|BENEDICT |M     |105 |104|OOP  |3     |
|1004|CHERRY   |F     |null|104|OOP  |3     |
|1005|FOSTER   |M     |104 |104|OOP  |3     |
|1006|MARTHA   |F     |102 |104|OOP  |3     |
|1007|LUCIFER  |M     |103 |104|OOP  |3     |
|1008|AMENADIEL|M     |106 |104|OOP  |3     |
|1009|LAUREN   |F     |104 |104|OOP  |3     |
|1010|CHLOE    |F     |102 |104|OOP  |3     |
|1011|DAN      |M     |101 |104|OOP  |3     |
|1012|KEVIN    |M     |105 |104|OOP  |3     |
|1013|LESLEEY  |F     |106 |104|OOP  |3     |
|1014|MARCUS   |M     |103 |104|OOP  |3     |
|1015|TOM      |M     |102 |104|OOP  |3     |
|1016|RACHAEL  |F     |106 |104|OOP  |3     |
|1017|MALCOLM  |M     |101 |104|OOP  |3     |
|1018|BRIAN    |M     |104 |104|OOP  |3     |
|1019|STEWIE   |M     |103 |104|OOP  |3     |
|1020|PETER    |M     |102 |104|OOP  |3     |
|1021|LOIS     |F     |106 |104|OOP  |3     |
|1022|DEBRA    |F     |105 |104|OOP  |3     |
|1023|DEXTER   |M     |103 |104|OOP  |3     |
|1001|ANDY     |M     |103 |105|PY   |2     |
|1002|ADRIAN   |M     |101 |105|PY   |2     |
|1003|BENEDICT |M     |105 |105|PY   |2     |
|1004|CHERRY   |F     |null|105|PY   |2     |
|1005|FOSTER   |M     |104 |105|PY   |2     |
|1006|MARTHA   |F     |102 |105|PY   |2     |
|1007|LUCIFER  |M     |103 |105|PY   |2     |
|1008|AMENADIEL|M     |106 |105|PY   |2     |
|1009|LAUREN   |F     |104 |105|PY   |2     |
|1010|CHLOE    |F     |102 |105|PY   |2     |
|1011|DAN      |M     |101 |105|PY   |2     |
|1012|KEVIN    |M     |105 |105|PY   |2     |
|1013|LESLEEY  |F     |106 |105|PY   |2     |
|1014|MARCUS   |M     |103 |105|PY   |2     |
|1015|TOM      |M     |102 |105|PY   |2     |
|1016|RACHAEL  |F     |106 |105|PY   |2     |
|1017|MALCOLM  |M     |101 |105|PY   |2     |
|1018|BRIAN    |M     |104 |105|PY   |2     |
|1019|STEWIE   |M     |103 |105|PY   |2     |
|1020|PETER    |M     |102 |105|PY   |2     |
|1021|LOIS     |F     |106 |105|PY   |2     |
|1022|DEBRA    |F     |105 |105|PY   |2     |
|1023|DEXTER   |M     |103 |105|PY   |2     |
|1001|ANDY     |M     |103 |106|DSA  |4     |
|1002|ADRIAN   |M     |101 |106|DSA  |4     |
|1003|BENEDICT |M     |105 |106|DSA  |4     |
|1004|CHERRY   |F     |null|106|DSA  |4     |
|1005|FOSTER   |M     |104 |106|DSA  |4     |
|1006|MARTHA   |F     |102 |106|DSA  |4     |
|1007|LUCIFER  |M     |103 |106|DSA  |4     |
|1008|AMENADIEL|M     |106 |106|DSA  |4     |
|1009|LAUREN   |F     |104 |106|DSA  |4     |
|1010|CHLOE    |F     |102 |106|DSA  |4     |
|1011|DAN      |M     |101 |106|DSA  |4     |
|1012|KEVIN    |M     |105 |106|DSA  |4     |
|1013|LESLEEY  |F     |106 |106|DSA  |4     |
|1014|MARCUS   |M     |103 |106|DSA  |4     |
|1015|TOM      |M     |102 |106|DSA  |4     |
|1016|RACHAEL  |F     |106 |106|DSA  |4     |
|1017|MALCOLM  |M     |101 |106|DSA  |4     |
|1018|BRIAN    |M     |104 |106|DSA  |4     |
|1019|STEWIE   |M     |103 |106|DSA  |4     |
|1020|PETER    |M     |102 |106|DSA  |4     |
|1021|LOIS     |F     |106 |106|DSA  |4     |
|1022|DEBRA    |F     |105 |106|DSA  |4     |
|1023|DEXTER   |M     |103 |106|DSA  |4     |
+----+---------+------+----+---+-----+------+
```

<br>
<br>

```sql
-- Without Keyword

SELECT *
FROM PARTICIPANT,
     COURSE;
```

```text
+----+---------+------+----+---+-----+------+
|PID |PNAME    |GENDER|CID |CID|CNAME|CREDIT|
+----+---------+------+----+---+-----+------+
|1001|ANDY     |M     |103 |101|ML   |4     |
|1002|ADRIAN   |M     |101 |101|ML   |4     |
|1003|BENEDICT |M     |105 |101|ML   |4     |
|1004|CHERRY   |F     |null|101|ML   |4     |
|1005|FOSTER   |M     |104 |101|ML   |4     |
|1006|MARTHA   |F     |102 |101|ML   |4     |
|1007|LUCIFER  |M     |103 |101|ML   |4     |
|1008|AMENADIEL|M     |106 |101|ML   |4     |
|1009|LAUREN   |F     |104 |101|ML   |4     |
|1010|CHLOE    |F     |102 |101|ML   |4     |
|1011|DAN      |M     |101 |101|ML   |4     |
|1012|KEVIN    |M     |105 |101|ML   |4     |
|1013|LESLEEY  |F     |106 |101|ML   |4     |
|1014|MARCUS   |M     |103 |101|ML   |4     |
|1015|TOM      |M     |102 |101|ML   |4     |
|1016|RACHAEL  |F     |106 |101|ML   |4     |
|1017|MALCOLM  |M     |101 |101|ML   |4     |
|1018|BRIAN    |M     |104 |101|ML   |4     |
|1019|STEWIE   |M     |103 |101|ML   |4     |
|1020|PETER    |M     |102 |101|ML   |4     |
|1021|LOIS     |F     |106 |101|ML   |4     |
|1022|DEBRA    |F     |105 |101|ML   |4     |
|1023|DEXTER   |M     |103 |101|ML   |4     |
|1001|ANDY     |M     |103 |102|DBMS |4     |
|1002|ADRIAN   |M     |101 |102|DBMS |4     |
|1003|BENEDICT |M     |105 |102|DBMS |4     |
|1004|CHERRY   |F     |null|102|DBMS |4     |
|1005|FOSTER   |M     |104 |102|DBMS |4     |
|1006|MARTHA   |F     |102 |102|DBMS |4     |
|1007|LUCIFER  |M     |103 |102|DBMS |4     |
|1008|AMENADIEL|M     |106 |102|DBMS |4     |
|1009|LAUREN   |F     |104 |102|DBMS |4     |
|1010|CHLOE    |F     |102 |102|DBMS |4     |
|1011|DAN      |M     |101 |102|DBMS |4     |
|1012|KEVIN    |M     |105 |102|DBMS |4     |
|1013|LESLEEY  |F     |106 |102|DBMS |4     |
|1014|MARCUS   |M     |103 |102|DBMS |4     |
|1015|TOM      |M     |102 |102|DBMS |4     |
|1016|RACHAEL  |F     |106 |102|DBMS |4     |
|1017|MALCOLM  |M     |101 |102|DBMS |4     |
|1018|BRIAN    |M     |104 |102|DBMS |4     |
|1019|STEWIE   |M     |103 |102|DBMS |4     |
|1020|PETER    |M     |102 |102|DBMS |4     |
|1021|LOIS     |F     |106 |102|DBMS |4     |
|1022|DEBRA    |F     |105 |102|DBMS |4     |
|1023|DEXTER   |M     |103 |102|DBMS |4     |
|1001|ANDY     |M     |103 |103|AI   |4     |
|1002|ADRIAN   |M     |101 |103|AI   |4     |
|1003|BENEDICT |M     |105 |103|AI   |4     |
|1004|CHERRY   |F     |null|103|AI   |4     |
|1005|FOSTER   |M     |104 |103|AI   |4     |
|1006|MARTHA   |F     |102 |103|AI   |4     |
|1007|LUCIFER  |M     |103 |103|AI   |4     |
|1008|AMENADIEL|M     |106 |103|AI   |4     |
|1009|LAUREN   |F     |104 |103|AI   |4     |
|1010|CHLOE    |F     |102 |103|AI   |4     |
|1011|DAN      |M     |101 |103|AI   |4     |
|1012|KEVIN    |M     |105 |103|AI   |4     |
|1013|LESLEEY  |F     |106 |103|AI   |4     |
|1014|MARCUS   |M     |103 |103|AI   |4     |
|1015|TOM      |M     |102 |103|AI   |4     |
|1016|RACHAEL  |F     |106 |103|AI   |4     |
|1017|MALCOLM  |M     |101 |103|AI   |4     |
|1018|BRIAN    |M     |104 |103|AI   |4     |
|1019|STEWIE   |M     |103 |103|AI   |4     |
|1020|PETER    |M     |102 |103|AI   |4     |
|1021|LOIS     |F     |106 |103|AI   |4     |
|1022|DEBRA    |F     |105 |103|AI   |4     |
|1023|DEXTER   |M     |103 |103|AI   |4     |
|1001|ANDY     |M     |103 |104|OOP  |3     |
|1002|ADRIAN   |M     |101 |104|OOP  |3     |
|1003|BENEDICT |M     |105 |104|OOP  |3     |
|1004|CHERRY   |F     |null|104|OOP  |3     |
|1005|FOSTER   |M     |104 |104|OOP  |3     |
|1006|MARTHA   |F     |102 |104|OOP  |3     |
|1007|LUCIFER  |M     |103 |104|OOP  |3     |
|1008|AMENADIEL|M     |106 |104|OOP  |3     |
|1009|LAUREN   |F     |104 |104|OOP  |3     |
|1010|CHLOE    |F     |102 |104|OOP  |3     |
|1011|DAN      |M     |101 |104|OOP  |3     |
|1012|KEVIN    |M     |105 |104|OOP  |3     |
|1013|LESLEEY  |F     |106 |104|OOP  |3     |
|1014|MARCUS   |M     |103 |104|OOP  |3     |
|1015|TOM      |M     |102 |104|OOP  |3     |
|1016|RACHAEL  |F     |106 |104|OOP  |3     |
|1017|MALCOLM  |M     |101 |104|OOP  |3     |
|1018|BRIAN    |M     |104 |104|OOP  |3     |
|1019|STEWIE   |M     |103 |104|OOP  |3     |
|1020|PETER    |M     |102 |104|OOP  |3     |
|1021|LOIS     |F     |106 |104|OOP  |3     |
|1022|DEBRA    |F     |105 |104|OOP  |3     |
|1023|DEXTER   |M     |103 |104|OOP  |3     |
|1001|ANDY     |M     |103 |105|PY   |2     |
|1002|ADRIAN   |M     |101 |105|PY   |2     |
|1003|BENEDICT |M     |105 |105|PY   |2     |
|1004|CHERRY   |F     |null|105|PY   |2     |
|1005|FOSTER   |M     |104 |105|PY   |2     |
|1006|MARTHA   |F     |102 |105|PY   |2     |
|1007|LUCIFER  |M     |103 |105|PY   |2     |
|1008|AMENADIEL|M     |106 |105|PY   |2     |
|1009|LAUREN   |F     |104 |105|PY   |2     |
|1010|CHLOE    |F     |102 |105|PY   |2     |
|1011|DAN      |M     |101 |105|PY   |2     |
|1012|KEVIN    |M     |105 |105|PY   |2     |
|1013|LESLEEY  |F     |106 |105|PY   |2     |
|1014|MARCUS   |M     |103 |105|PY   |2     |
|1015|TOM      |M     |102 |105|PY   |2     |
|1016|RACHAEL  |F     |106 |105|PY   |2     |
|1017|MALCOLM  |M     |101 |105|PY   |2     |
|1018|BRIAN    |M     |104 |105|PY   |2     |
|1019|STEWIE   |M     |103 |105|PY   |2     |
|1020|PETER    |M     |102 |105|PY   |2     |
|1021|LOIS     |F     |106 |105|PY   |2     |
|1022|DEBRA    |F     |105 |105|PY   |2     |
|1023|DEXTER   |M     |103 |105|PY   |2     |
|1001|ANDY     |M     |103 |106|DSA  |4     |
|1002|ADRIAN   |M     |101 |106|DSA  |4     |
|1003|BENEDICT |M     |105 |106|DSA  |4     |
|1004|CHERRY   |F     |null|106|DSA  |4     |
|1005|FOSTER   |M     |104 |106|DSA  |4     |
|1006|MARTHA   |F     |102 |106|DSA  |4     |
|1007|LUCIFER  |M     |103 |106|DSA  |4     |
|1008|AMENADIEL|M     |106 |106|DSA  |4     |
|1009|LAUREN   |F     |104 |106|DSA  |4     |
|1010|CHLOE    |F     |102 |106|DSA  |4     |
|1011|DAN      |M     |101 |106|DSA  |4     |
|1012|KEVIN    |M     |105 |106|DSA  |4     |
|1013|LESLEEY  |F     |106 |106|DSA  |4     |
|1014|MARCUS   |M     |103 |106|DSA  |4     |
|1015|TOM      |M     |102 |106|DSA  |4     |
|1016|RACHAEL  |F     |106 |106|DSA  |4     |
|1017|MALCOLM  |M     |101 |106|DSA  |4     |
|1018|BRIAN    |M     |104 |106|DSA  |4     |
|1019|STEWIE   |M     |103 |106|DSA  |4     |
|1020|PETER    |M     |102 |106|DSA  |4     |
|1021|LOIS     |F     |106 |106|DSA  |4     |
|1022|DEBRA    |F     |105 |106|DSA  |4     |
|1023|DEXTER   |M     |103 |106|DSA  |4     |
+----+---------+------+----+---+-----+------+
```

<div style="font-family: 'IBM Plex Sans';">2. Equi Join</div>

```sql
SELECT *
FROM PARTICIPANT P
         JOIN
     COURSE C ON P.CID = C.CID;
```

```text
+----+---------+------+---+---+-----+------+
|PID |PNAME    |GENDER|CID|CID|CNAME|CREDIT|
+----+---------+------+---+---+-----+------+
|1017|MALCOLM  |M     |101|101|ML   |4     |
|1002|ADRIAN   |M     |101|101|ML   |4     |
|1011|DAN      |M     |101|101|ML   |4     |
|1015|TOM      |M     |102|102|DBMS |4     |
|1010|CHLOE    |F     |102|102|DBMS |4     |
|1020|PETER    |M     |102|102|DBMS |4     |
|1006|MARTHA   |F     |102|102|DBMS |4     |
|1001|ANDY     |M     |103|103|AI   |4     |
|1023|DEXTER   |M     |103|103|AI   |4     |
|1014|MARCUS   |M     |103|103|AI   |4     |
|1007|LUCIFER  |M     |103|103|AI   |4     |
|1019|STEWIE   |M     |103|103|AI   |4     |
|1009|LAUREN   |F     |104|104|OOP  |3     |
|1018|BRIAN    |M     |104|104|OOP  |3     |
|1005|FOSTER   |M     |104|104|OOP  |3     |
|1003|BENEDICT |M     |105|105|PY   |2     |
|1012|KEVIN    |M     |105|105|PY   |2     |
|1022|DEBRA    |F     |105|105|PY   |2     |
|1008|AMENADIEL|M     |106|106|DSA  |4     |
|1021|LOIS     |F     |106|106|DSA  |4     |
|1013|LESLEEY  |F     |106|106|DSA  |4     |
|1016|RACHAEL  |F     |106|106|DSA  |4     |
+----+---------+------+---+---+-----+------+
```

<br>
<br>

```sql
-- Without Keyword

SELECT *
FROM PARTICIPANT P,
     COURSE C
WHERE C.CID = P.CID;
```

```text
+----+---------+------+---+---+-----+------+
|PID |PNAME    |GENDER|CID|CID|CNAME|CREDIT|
+----+---------+------+---+---+-----+------+
|1017|MALCOLM  |M     |101|101|ML   |4     |
|1002|ADRIAN   |M     |101|101|ML   |4     |
|1011|DAN      |M     |101|101|ML   |4     |
|1015|TOM      |M     |102|102|DBMS |4     |
|1010|CHLOE    |F     |102|102|DBMS |4     |
|1020|PETER    |M     |102|102|DBMS |4     |
|1006|MARTHA   |F     |102|102|DBMS |4     |
|1001|ANDY     |M     |103|103|AI   |4     |
|1023|DEXTER   |M     |103|103|AI   |4     |
|1014|MARCUS   |M     |103|103|AI   |4     |
|1007|LUCIFER  |M     |103|103|AI   |4     |
|1019|STEWIE   |M     |103|103|AI   |4     |
|1009|LAUREN   |F     |104|104|OOP  |3     |
|1018|BRIAN    |M     |104|104|OOP  |3     |
|1005|FOSTER   |M     |104|104|OOP  |3     |
|1003|BENEDICT |M     |105|105|PY   |2     |
|1012|KEVIN    |M     |105|105|PY   |2     |
|1022|DEBRA    |F     |105|105|PY   |2     |
|1008|AMENADIEL|M     |106|106|DSA  |4     |
|1021|LOIS     |F     |106|106|DSA  |4     |
|1013|LESLEEY  |F     |106|106|DSA  |4     |
|1016|RACHAEL  |F     |106|106|DSA  |4     |
+----+---------+------+---+---+-----+------+
```

<div style="font-family: 'IBM Plex Sans';">3. Natural Join</div>

```sql
SELECT *
FROM PARTICIPANT
         NATURAL JOIN
     COURSE;
```

```text
+---+----+---------+------+-----+------+
|CID|PID |PNAME    |GENDER|CNAME|CREDIT|
+---+----+---------+------+-----+------+
|101|1017|MALCOLM  |M     |ML   |4     |
|101|1002|ADRIAN   |M     |ML   |4     |
|101|1011|DAN      |M     |ML   |4     |
|102|1015|TOM      |M     |DBMS |4     |
|102|1010|CHLOE    |F     |DBMS |4     |
|102|1020|PETER    |M     |DBMS |4     |
|102|1006|MARTHA   |F     |DBMS |4     |
|103|1001|ANDY     |M     |AI   |4     |
|103|1023|DEXTER   |M     |AI   |4     |
|103|1014|MARCUS   |M     |AI   |4     |
|103|1007|LUCIFER  |M     |AI   |4     |
|103|1019|STEWIE   |M     |AI   |4     |
|104|1009|LAUREN   |F     |OOP  |3     |
|104|1018|BRIAN    |M     |OOP  |3     |
|104|1005|FOSTER   |M     |OOP  |3     |
|105|1003|BENEDICT |M     |PY   |2     |
|105|1012|KEVIN    |M     |PY   |2     |
|105|1022|DEBRA    |F     |PY   |2     |
|106|1008|AMENADIEL|M     |DSA  |4     |
|106|1021|LOIS     |F     |DSA  |4     |
|106|1013|LESLEEY  |F     |DSA  |4     |
|106|1016|RACHAEL  |F     |DSA  |4     |
+---+----+---------+------+-----+------+
```

#### <div style="font-family: 'IBM Plex Sans';">Applying Various Outer Joins on Course and Participants Tables</div>

<div style="font-family: 'IBM Plex Sans';">1. Left Outer Join</div>

```sql
SELECT *
FROM PARTICIPANT P
         LEFT OUTER JOIN COURSE C on P.CID = C.CID;
```

```text
+----+---------+------+----+----+-----+------+
|PID |PNAME    |GENDER|CID |CID |CNAME|CREDIT|
+----+---------+------+----+----+-----+------+
|1017|MALCOLM  |M     |101 |101 |ML   |4     |
|1011|DAN      |M     |101 |101 |ML   |4     |
|1002|ADRIAN   |M     |101 |101 |ML   |4     |
|1020|PETER    |M     |102 |102 |DBMS |4     |
|1015|TOM      |M     |102 |102 |DBMS |4     |
|1010|CHLOE    |F     |102 |102 |DBMS |4     |
|1006|MARTHA   |F     |102 |102 |DBMS |4     |
|1023|DEXTER   |M     |103 |103 |AI   |4     |
|1019|STEWIE   |M     |103 |103 |AI   |4     |
|1014|MARCUS   |M     |103 |103 |AI   |4     |
|1007|LUCIFER  |M     |103 |103 |AI   |4     |
|1001|ANDY     |M     |103 |103 |AI   |4     |
|1018|BRIAN    |M     |104 |104 |OOP  |3     |
|1009|LAUREN   |F     |104 |104 |OOP  |3     |
|1005|FOSTER   |M     |104 |104 |OOP  |3     |
|1022|DEBRA    |F     |105 |105 |PY   |2     |
|1012|KEVIN    |M     |105 |105 |PY   |2     |
|1003|BENEDICT |M     |105 |105 |PY   |2     |
|1021|LOIS     |F     |106 |106 |DSA  |4     |
|1016|RACHAEL  |F     |106 |106 |DSA  |4     |
|1013|LESLEEY  |F     |106 |106 |DSA  |4     |
|1008|AMENADIEL|M     |106 |106 |DSA  |4     |
|1004|CHERRY   |F     |null|null|null |null  |
+----+---------+------+----+----+-----+------+
```

```sql
SELECT *
FROM PARTICIPANT P,
     COURSE C
WHERE P.CID = C.CID (+);
```

```text
+----+---------+------+----+----+-----+------+
|PID |PNAME    |GENDER|CID |CID |CNAME|CREDIT|
+----+---------+------+----+----+-----+------+
|1017|MALCOLM  |M     |101 |101 |ML   |4     |
|1011|DAN      |M     |101 |101 |ML   |4     |
|1002|ADRIAN   |M     |101 |101 |ML   |4     |
|1020|PETER    |M     |102 |102 |DBMS |4     |
|1015|TOM      |M     |102 |102 |DBMS |4     |
|1010|CHLOE    |F     |102 |102 |DBMS |4     |
|1006|MARTHA   |F     |102 |102 |DBMS |4     |
|1023|DEXTER   |M     |103 |103 |AI   |4     |
|1019|STEWIE   |M     |103 |103 |AI   |4     |
|1014|MARCUS   |M     |103 |103 |AI   |4     |
|1007|LUCIFER  |M     |103 |103 |AI   |4     |
|1001|ANDY     |M     |103 |103 |AI   |4     |
|1018|BRIAN    |M     |104 |104 |OOP  |3     |
|1009|LAUREN   |F     |104 |104 |OOP  |3     |
|1005|FOSTER   |M     |104 |104 |OOP  |3     |
|1022|DEBRA    |F     |105 |105 |PY   |2     |
|1012|KEVIN    |M     |105 |105 |PY   |2     |
|1003|BENEDICT |M     |105 |105 |PY   |2     |
|1021|LOIS     |F     |106 |106 |DSA  |4     |
|1016|RACHAEL  |F     |106 |106 |DSA  |4     |
|1013|LESLEEY  |F     |106 |106 |DSA  |4     |
|1008|AMENADIEL|M     |106 |106 |DSA  |4     |
|1004|CHERRY   |F     |null|null|null |null  |
+----+---------+------+----+----+-----+------+
```

<div style="font-family: 'IBM Plex Sans';">2. Right Outer Join</div>

```sql
SELECT *
FROM PARTICIPANT P
         RIGHT OUTER JOIN COURSE C on P.CID = C.CID
ORDER BY P.PID;
```

```text
+----+---------+------+---+---+-----+------+
|PID |PNAME    |GENDER|CID|CID|CNAME|CREDIT|
+----+---------+------+---+---+-----+------+
|1001|ANDY     |M     |103|103|AI   |4     |
|1002|ADRIAN   |M     |101|101|ML   |4     |
|1003|BENEDICT |M     |105|105|PY   |2     |
|1005|FOSTER   |M     |104|104|OOP  |3     |
|1006|MARTHA   |F     |102|102|DBMS |4     |
|1007|LUCIFER  |M     |103|103|AI   |4     |
|1008|AMENADIEL|M     |106|106|DSA  |4     |
|1009|LAUREN   |F     |104|104|OOP  |3     |
|1010|CHLOE    |F     |102|102|DBMS |4     |
|1011|DAN      |M     |101|101|ML   |4     |
|1012|KEVIN    |M     |105|105|PY   |2     |
|1013|LESLEEY  |F     |106|106|DSA  |4     |
|1014|MARCUS   |M     |103|103|AI   |4     |
|1015|TOM      |M     |102|102|DBMS |4     |
|1016|RACHAEL  |F     |106|106|DSA  |4     |
|1017|MALCOLM  |M     |101|101|ML   |4     |
|1018|BRIAN    |M     |104|104|OOP  |3     |
|1019|STEWIE   |M     |103|103|AI   |4     |
|1020|PETER    |M     |102|102|DBMS |4     |
|1021|LOIS     |F     |106|106|DSA  |4     |
|1022|DEBRA    |F     |105|105|PY   |2     |
|1023|DEXTER   |M     |103|103|AI   |4     |
+----+---------+------+---+---+-----+------+
```

```sql
SELECT *
FROM PARTICIPANT P,
     COURSE C
WHERE P.CID (+) = C.CID;
```

```text
+----+---------+------+---+---+-----+------+
|PID |PNAME    |GENDER|CID|CID|CNAME|CREDIT|
+----+---------+------+---+---+-----+------+
|1001|ANDY     |M     |103|103|AI   |4     |
|1002|ADRIAN   |M     |101|101|ML   |4     |
|1003|BENEDICT |M     |105|105|PY   |2     |
|1005|FOSTER   |M     |104|104|OOP  |3     |
|1006|MARTHA   |F     |102|102|DBMS |4     |
|1007|LUCIFER  |M     |103|103|AI   |4     |
|1008|AMENADIEL|M     |106|106|DSA  |4     |
|1009|LAUREN   |F     |104|104|OOP  |3     |
|1010|CHLOE    |F     |102|102|DBMS |4     |
|1011|DAN      |M     |101|101|ML   |4     |
|1012|KEVIN    |M     |105|105|PY   |2     |
|1013|LESLEEY  |F     |106|106|DSA  |4     |
|1014|MARCUS   |M     |103|103|AI   |4     |
|1015|TOM      |M     |102|102|DBMS |4     |
|1016|RACHAEL  |F     |106|106|DSA  |4     |
|1017|MALCOLM  |M     |101|101|ML   |4     |
|1018|BRIAN    |M     |104|104|OOP  |3     |
|1019|STEWIE   |M     |103|103|AI   |4     |
|1020|PETER    |M     |102|102|DBMS |4     |
|1021|LOIS     |F     |106|106|DSA  |4     |
|1022|DEBRA    |F     |105|105|PY   |2     |
|1023|DEXTER   |M     |103|103|AI   |4     |
+----+---------+------+---+---+-----+------+
```

<div style="font-family: 'IBM Plex Sans';">3. Full Outer Join</div>

```sql
SELECT *
FROM PARTICIPANT P
         FULL OUTER JOIN COURSE C on P.CID = C.CID;
```

```text
+----+---------+------+----+----+-----+------+
|PID |PNAME    |GENDER|CID |CID |CNAME|CREDIT|
+----+---------+------+----+----+-----+------+
|1001|ANDY     |M     |103 |103 |AI   |4     |
|1002|ADRIAN   |M     |101 |101 |ML   |4     |
|1003|BENEDICT |M     |105 |105 |PY   |2     |
|1004|CHERRY   |F     |null|null|null |null  |
|1005|FOSTER   |M     |104 |104 |OOP  |3     |
|1006|MARTHA   |F     |102 |102 |DBMS |4     |
|1007|LUCIFER  |M     |103 |103 |AI   |4     |
|1008|AMENADIEL|M     |106 |106 |DSA  |4     |
|1009|LAUREN   |F     |104 |104 |OOP  |3     |
|1010|CHLOE    |F     |102 |102 |DBMS |4     |
|1011|DAN      |M     |101 |101 |ML   |4     |
|1012|KEVIN    |M     |105 |105 |PY   |2     |
|1013|LESLEEY  |F     |106 |106 |DSA  |4     |
|1014|MARCUS   |M     |103 |103 |AI   |4     |
|1015|TOM      |M     |102 |102 |DBMS |4     |
|1016|RACHAEL  |F     |106 |106 |DSA  |4     |
|1017|MALCOLM  |M     |101 |101 |ML   |4     |
|1018|BRIAN    |M     |104 |104 |OOP  |3     |
|1019|STEWIE   |M     |103 |103 |AI   |4     |
|1020|PETER    |M     |102 |102 |DBMS |4     |
|1021|LOIS     |F     |106 |106 |DSA  |4     |
|1022|DEBRA    |F     |105 |105 |PY   |2     |
|1023|DEXTER   |M     |103 |103 |AI   |4     |
+----+---------+------+----+----+-----+------+
```

```sql
SELECT *
FROM PARTICIPANT P,
     COURSE C
WHERE P.CID (+) = C.CID (+); -- ! WILL GIVE ERROR
```

```text
[72000][1468] ORA-01468: a predicate may reference only one outer-joined table
```

### <div style="font-family: 'IBM Plex Sans';">Set Operations in SQL</div>

```sql
-- CREATE SET 1 OF PARTICIPANTS TABLE
CREATE TABLE PARTICIPANT_1 AS
SELECT *
FROM PARTICIPANT
WHERE PID IN (1001, 1002, 1003, 1005);

-- SHOW PARTICIPANT_1
SELECT *
FROM PARTICIPANT_1;
```

```text
+----+--------+------+---+
|PID |PNAME   |GENDER|CID|
+----+--------+------+---+
|1001|ANDY    |M     |103|
|1002|ADRIAN  |M     |101|
|1003|BENEDICT|M     |105|
|1005|FOSTER  |M     |104|
+----+--------+------+---+
```

```sql
-- CREATE SET 2 OF PARTICIPANTS TABLE
CREATE TABLE PARTICIPANT_2 AS
SELECT *
FROM PARTICIPANT
WHERE PID IN (1004, 1005, 1006, 1007);

-- SHOW PARTICIPANT_2
SELECT *
FROM PARTICIPANT_2;
```

```text
+----+-------+------+----+
|PID |PNAME  |GENDER|CID |
+----+-------+------+----+
|1004|CHERRY |F     |null|
|1005|FOSTER |M     |104 |
|1006|MARTHA |F     |102 |
|1007|LUCIFER|M     |103 |
+----+-------+------+----+
```

<div style="font-family: 'IBM Plex Sans';">1. Union Operator</div>

```sql
(SELECT * FROM PARTICIPANT_1)
UNION
(SELECT * FROM PARTICIPANT_2);
```

```text
+----+--------+------+----+
|PID |PNAME   |GENDER|CID |
+----+--------+------+----+
|1001|ANDY    |M     |103 |
|1002|ADRIAN  |M     |101 |
|1003|BENEDICT|M     |105 |
|1004|CHERRY  |F     |null|
|1005|FOSTER  |M     |104 |
|1006|MARTHA  |F     |102 |
|1007|LUCIFER |M     |103 |
+----+--------+------+----+
```

<div style="font-family: 'IBM Plex Sans';">2. Intersect Operator</div>

```sql
(SELECT * FROM PARTICIPANT_1)
INTERSECT
(SELECT * FROM PARTICIPANT_2);
```

```text
+----+------+------+---+
|PID |PNAME |GENDER|CID|
+----+------+------+---+
|1005|FOSTER|M     |104|
+----+------+------+---+
```

<div style="font-family: 'IBM Plex Sans';">3. Difference Operator</div>

```sql
(SELECT * FROM PARTICIPANT_1)
MINUS
(SELECT * FROM PARTICIPANT_2);
```

```text
+----+--------+------+---+
|PID |PNAME   |GENDER|CID|
+----+--------+------+---+
|1001|ANDY    |M     |103|
|1002|ADRIAN  |M     |101|
|1003|BENEDICT|M     |105|
+----+--------+------+---+
```

<div style="font-family: 'IBM Plex Sans';">4. Intersect Operator (Without Keyword)</div>

```sql
SELECT *
FROM PARTICIPANT_1
MINUS
((SELECT * FROM PARTICIPANT_1)
 MINUS
 (SELECT * FROM PARTICIPANT_2));
```

```text
+----+------+------+---+
|PID |PNAME |GENDER|CID|
+----+------+------+---+
|1005|FOSTER|M     |104|
+----+------+------+---+
```

### <div style="font-family: 'IBM Plex Sans';">Deletions of Foreign Key in Oracle DB</div>

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

```sql
DESCRIBE USER_CONSTRAINTS;
```

```text
Name                                      Null?    Type
----------------------------------------- -------- ----------------------------
OWNER                                              VARCHAR2(120)
CONSTRAINT_NAME                           NOT NULL VARCHAR2(30)
CONSTRAINT_TYPE                                    VARCHAR2(1)
TABLE_NAME                                NOT NULL VARCHAR2(30)
SEARCH_CONDITION                                   LONG
R_OWNER                                            VARCHAR2(120)
R_CONSTRAINT_NAME                                  VARCHAR2(30)
DELETE_RULE                                        VARCHAR2(9)
STATUS                                             VARCHAR2(8)
DEFERRABLE                                         VARCHAR2(14)
DEFERRED                                           VARCHAR2(9)
VALIDATED                                          VARCHAR2(13)
GENERATED                                          VARCHAR2(14)
BAD                                                VARCHAR2(3)
RELY                                               VARCHAR2(4)
LAST_CHANGE                                        DATE
INDEX_OWNER                                        VARCHAR2(30)
INDEX_NAME                                         VARCHAR2(30)
INVALID                                            VARCHAR2(7)
VIEW_RELATED                                       VARCHAR2(14)
```

#### <div style="font-family: 'IBM Plex Sans';">Deleting Foreign Key from Parent Table</div>

```sql
DELETE
FROM COURSE
WHERE CID = 103;
```

```text
23000][2292] ORA-02292: integrity constraint (SHAN.PARTICIPANT_FK_COURSE_CID) violated - child record found
```

##### <div style="font-family: 'IBM Plex Sans';">On Delete Cascade</div>

<div style="font-family: 'IBM Plex Sans';">1. Dropping Constraint From Participant Table</div>

```sql
ALTER TABLE PARTICIPANT
    DROP CONSTRAINT PARTICIPANT_FK_COURSE_CID;
```

<div style="font-family: 'IBM Plex Sans';">2. Adding On Delete Cascade Constraint In Participant Table</div>

```sql
ALTER TABLE PARTICIPANT
    ADD CONSTRAINT PARTICIPANT_FK_COURSE_CID
        FOREIGN KEY (CID) REFERENCES COURSE (CID)
            ON DELETE CASCADE;
```

```sql
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE, DELETE_RULE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'PARTICIPANT';
```

```text
+-----------+-------------------------+---------------+-----------+
|TABLE_NAME |CONSTRAINT_NAME          |CONSTRAINT_TYPE|DELETE_RULE|
+-----------+-------------------------+---------------+-----------+
|PARTICIPANT|SYS_C007187              |C              |null       |
|PARTICIPANT|SYS_C007188              |C              |null       |
|PARTICIPANT|SYS_C007189              |C              |null       |
|PARTICIPANT|PARTICIPANT_CK_PID       |C              |null       |
|PARTICIPANT|PARTICIPANT_CK_GENDER    |C              |null       |
|PARTICIPANT|PARTICIPANT_PK_PID       |P              |null       |
|PARTICIPANT|PARTICIPANT_FK_COURSE_CID|R              |CASCADE    |
+-----------+-------------------------+---------------+-----------+
```

<div style="font-family: 'IBM Plex Sans';">3. Trying to Delete From Participant Table</div>

```sql
DELETE
FROM course
WHERE cid = 102;

SELECT *
FROM COURSE;
```

```text
+---+-----+------+
|CID|CNAME|CREDIT|
+---+-----+------+
|101|ML   |4     |
|103|AI   |4     |
|104|OOP  |3     |
|105|PY   |2     |
|106|DSA  |4     |
+---+-----+------+
```

##### <div style="font-family: 'IBM Plex Sans';">On Delete SET NULL</div>

<div style="font-family: 'IBM Plex Sans';">1. Dropping Constraint From Participant Table</div>

```sql
ALTER TABLE PARTICIPANT
    DROP CONSTRAINT PARTICIPANT_FK_COURSE_CID;
```

<div style="font-family: 'IBM Plex Sans';">2. Adding On Delete Set Null Constraint In Participant Table</div>

```sql
ALTER TABLE PARTICIPANT
    ADD CONSTRAINT PARTICIPANT_FK_COURSE_CID
        FOREIGN KEY (CID) REFERENCES COURSE (CID)
            ON DELETE SET NULL;
```

```sql
SELECT TABLE_NAME, CONSTRAINT_NAME, CONSTRAINT_TYPE, DELETE_RULE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'PARTICIPANT';
```

```text
+-----------+-------------------------+---------------+-----------+
|TABLE_NAME |CONSTRAINT_NAME          |CONSTRAINT_TYPE|DELETE_RULE|
+-----------+-------------------------+---------------+-----------+
|PARTICIPANT|SYS_C007187              |C              |null       |
|PARTICIPANT|SYS_C007188              |C              |null       |
|PARTICIPANT|SYS_C007189              |C              |null       |
|PARTICIPANT|PARTICIPANT_CK_PID       |C              |null       |
|PARTICIPANT|PARTICIPANT_CK_GENDER    |C              |null       |
|PARTICIPANT|PARTICIPANT_PK_PID       |P              |null       |
|PARTICIPANT|PARTICIPANT_FK_COURSE_CID|R              |SET NULL   |
+-----------+-------------------------+---------------+-----------+
```