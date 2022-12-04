<center><h1 >Shri Ramdeobaba College of Engineering and Management<br>Nagpur 4400013</h1></center>
<center><h1 >Department of Computer Science Engineering (AIML)</h1></center>
<center><h2 >Database Management Lab - Practical 3</h2></center>

--- 

<div class="text">Q1. Find the name and age of the oldest sailor.</div>

```sql
SELECT *
FROM SAILORS
WHERE AGE = (SELECT MAX(AGE) "OLDEST SAILOR AGE"
             FROM SAILORS)
```

```text
+---+-----+------+----+
|SID|SNAME|RATING|AGE |
+---+-----+------+----+
|95 |Bob  |3     |63.5|
+---+-----+------+----+
```

<div class="text">Q2. Find the names of sailors who have reserved boat number 103.</div>

```sql
SELECT *
FROM SAILORS S,
     RESERVES R
WHERE S.SID = R.SID
  AND R.BID = 103;

-- OR

SELECT *
FROM SAILORS
         JOIN RESERVES USING (SID)
WHERE BID = 103;

-- OR

SELECT *
FROM SAILORS
WHERE SID IN (SELECT SID
              FROM RESERVES
              WHERE BID = 103);
```

```text
+---+--------+------+----+
|SID|SNAME   |RATING|AGE |
+---+--------+------+----+
|22 |Dustin  |7     |45.0|
|31 |Lubber  |8     |55.5|
|74 |Horataio|9     |35.0|
+---+--------+------+----+
```

<div class="text">Q3. Find the sids of sailors who have reserved a red boat.</div>

```sql
SELECT *
FROM SAILORS
WHERE SID IN (SELECT SID
              FROM RESERVES
              WHERE BID IN (SELECT BID
                            FROM BOATS
                            WHERE COLOR = 'red'));

-- OR

SELECT SNAME
FROM SAILORS S
WHERE EXISTS(
              SELECT *
              FROM RESERVES R
              WHERE S.SID = R.SID
                AND EXISTS(
                      SELECT * FROM BOATS B WHERE R.BID = B.BID AND COLOR = 'red'
                  )
          )

-- OR

SELECT DISTINCT SID, SNAME
FROM SAILORS
         NATURAL JOIN RESERVES
         NATURAL JOIN BOATS
WHERE COLOR = 'red';
```

```text
+---+--------+------+----+
|SID|SNAME   |RATING|AGE |
+---+--------+------+----+
|22 |Dustin  |7     |45.0|
|31 |Lubber  |8     |55.5|
|64 |Horataio|7     |35.0|
+---+--------+------+----+
```

<div class="text">Q4. Find the colors of boats reserved by Lubber.</div>

```sql
SELECT *
FROM BOATS
         NATURAL JOIN RESERVES
         NATURAL JOIN SAILORS
WHERE SNAME = 'Lubber';

-- OR

SELECT *
FROM BOATS B
WHERE EXISTS(SELECT *
             FROM RESERVES R
             WHERE B.BID = R.BID
               AND EXISTS(
                     SELECT * FROM SAILORS S WHERE R.SID = S.SID AND SNAME = 'Lubber'
                 ))
```

```text
+---+---+---------+-----+----------+------+------+----+
|SID|BID|BNAME    |COLOR|DAY       |SNAME |RATING|AGE |
+---+---+---------+-----+----------+------+------+----+
|31 |102|Interlake|red  |1998-11-10|Lubber|8     |55.5|
|31 |104|Marine   |red  |1998-11-12|Lubber|8     |55.5|
|31 |103|Clipper  |green|1998-11-06|Lubber|8     |55.5|
+---+---+---------+-----+----------+------+------+----+
```

<div class="text">Q6. Find the names of sailors who have reserved at least one boat.</div>

```sql
SELECT DISTINCT SNAME
FROM SAILORS S
         JOIN RESERVES R ON S.SID = R.SID;
```

```text
+--------+
|SNAME   |
+--------+
|Lubber  |
|Dustin  |
|Horataio|
+--------+
```

<div class="text">Q7. Find names of sailors who’ve reserved a red or a green boat.</div>

```sql
SELECT *
FROM SAILORS S
WHERE EXISTS(
              SELECT SID
              FROM RESERVES R
              WHERE S.SID = R.SID
                AND EXISTS(
                      SELECT * FROM BOATS B WHERE R.BID = B.BID AND COLOR IN ('red', 'green')
                  )
          );
```

```text
+---+--------+------+----+
|SID|SNAME   |RATING|AGE |
+---+--------+------+----+
|22 |Dustin  |7     |45.0|
|31 |Lubber  |8     |55.5|
|64 |Horataio|7     |35.0|
|74 |Horataio|9     |35.0|
+---+--------+------+----+
```

<div class="text">Q9. Find names of all sailors who’ve reserved red boat but not green boat.</div>

```sql
SELECT *
FROM SAILORS S
WHERE EXISTS(
              SELECT SID
              FROM RESERVES R
              WHERE S.SID = R.SID
                AND EXISTS(
                      SELECT * FROM BOATS B WHERE R.BID = B.BID AND COLOR = 'red' AND COLOR != 'green'
                  )
          );
```

```text
+---+--------+------+----+
|SID|SNAME   |RATING|AGE |
+---+--------+------+----+
|22 |Dustin  |7     |45.0|
|31 |Lubber  |8     |55.5|
|64 |Horataio|7     |35.0|
+---+--------+------+----+
```

<div class="text">Q10. Find sid’s of all sailors who have a rating of 10 or reserved boat 104.</div>

```sql
SELECT S.SID
FROM Sailors S
WHERE S.RATING = 10
UNION
SELECT R.SID
FROM Reserves R
WHERE R.BID = 104;
```

```text
+---+
|SID|
+---+
|22 |
|31 |
|58 |
|71 |
+---+
```

<div class="text">Q11. Find sid’s of all sailors who have a reserved boat 103</div>

```sql
SELECT S.SID, SNAME, BID, RATING
FROM SAILORS S
         JOIN RESERVES R ON S.SID = R.SID
WHERE BID = 103;
```

```text
+---+--------+---+------+
|SID|SNAME   |BID|RATING|
+---+--------+---+------+
|22 |Dustin  |103|7     |
|31 |Lubber  |103|8     |
|74 |Horataio|103|9     |
+---+--------+---+------+
```

<div class="text">Q12. Find names of sailors with at most one reservation for boat #103.</div>

```sql
SELECT S.SNAME
FROM SAILORS S
WHERE EXISTS(
              SELECT BID
              FROM RESERVES R
              WHERE S.SID = R.SID
                AND R.BID = 103);
```

```text
+--------+
|SNAME   |
+--------+
|Dustin  |
|Lubber  |
|Horataio|
+--------+
```

<div class="text">Q14. NAME OF SAILOR WHOSE RATING IS GREATER THAN THAT OF any HORATIO.</div>

```sql
SELECT SNAME, RATING
FROM SAILORS
WHERE RATING > (SELECT MIN(RATING)
                FROM SAILORS
                WHERE SNAME IN (SELECT S1.SNAME
                                FROM SAILORS S1,
                                     SAILORS S2
                                WHERE S1.RATING > S2.RATING
                                  AND S2.SNAME = 'Horataio')
                  AND SNAME = 'Horataio')
  AND SNAME != 'Horataio';
```

```text
+------+------+
|SNAME |RATING|
+------+------+
|Lubber|8     |
|Andy  |8     |
|Rusty |10    |
|Zorba |10    |
+------+------+
```

<div class="text">Q16. Find the sailors with the highest rating.</div>

```sql
SELECT *
FROM SAILORS
WHERE RATING = (SELECT MAX(RATING) FROM SAILORS);
```

```text
+---+-----+------+----+
|SID|SNAME|RATING|AGE |
+---+-----+------+----+
|58 |Rusty|10    |35.0|
|71 |Zorba|10    |16.0|
+---+-----+------+----+
```

<div class="text">Q17. FIND THE NAME OF ALL SAILORS WHO RESERVED ALL BOATS.</div>

```sql
SELECT *
FROM SAILORS S
WHERE NOT EXISTS
    ((SELECT BID
      FROM BOATS B)
     MINUS
     (SELECT R.BID FROM RESERVES R WHERE R.SID = S.SID))

SELECT *
FROM SAILORS S
WHERE NOT EXISTS(
        SELECT * FROM BOATS B WHERE NOT EXISTS(SELECT R.BID FROM RESERVES R WHERE R.BID = B.BID AND R.SID = S.SID)
    )

SELECT S.SID, S.SNAME
FROM RESERVES R
         JOIN SAILORS S on R.SID = S.SID
GROUP BY S.SID, S.SNAME
HAVING COUNT(DISTINCT BID) = (SELECT COUNT(BID)
                              FROM BOATS);

SELECT SID
FROM RESERVES
GROUP BY SID
HAVING COUNT(DISTINCT BID) = (SELECT COUNT(BID) FROM BOATS)
```

```text
+---+------+------+----+
|SID|SNAME |RATING|AGE |
+---+------+------+----+
|22 |Dustin|7     |45.0|
+---+------+------+----+
```

<div class="text">Q18. Count the number of Sailors.</div>

```sql
SELECT COUNT(SNAME)
FROM SAILORS;
```

```text
+------------+
|COUNT(SNAME)|
+------------+
|10          |
+------------+
```

<div class="text">Q19. Count the number of different sailor names.</div>

```sql
SELECT COUNT(DISTINCT SNAME)
FROM SAILORS;
```

```text
+--------------------+
|COUNT(DISTINCTSNAME)|
+--------------------+
|9                   |
+--------------------+
```

<div class="text">20. Find the average age of all sailors</div>

```sql
SELECT AVG(AGE) "AVERAGE AGE OF SAILORS"
FROM SAILORS;
```

```text
+----------------------+
|AVERAGE AGE OF SAILORS|
+----------------------+
|36.9                  |
+----------------------+
```

<div class="text">Q21. Find the average age of sailors with rating of 10</div>

```sql
SELECT AVG(AGE)
FROM SAILORS
WHERE RATING = 10;
```

```text
+--------+
|AVG(AGE)|
+--------+
|25.5    |
+--------+
```

<div class="text">Q22. Count the number of boats reserved by each sailor (display sailors name and count).</div>

```sql
SELECT SNAME, COUNT(BID)
FROM RESERVES R
         JOIN SAILORS S ON R.SID = S.SID
GROUP BY SNAME;
```

```text
+--------+----------+
|SNAME   |COUNT(BID)|
+--------+----------+
|Lubber  |3         |
|Dustin  |4         |
|Horataio|3         |
+--------+----------+
```

<div class="text">Q23. Find the names of the sailors who reserved two or more boats.</div>

```sql
SELECT SNAME, COUNT(BID)
FROM RESERVES R
         JOIN SAILORS S ON R.SID = S.SID
GROUP BY SNAME
HAVING COUNT(BID) > 2;
```

```text
+--------+----------+
|SNAME   |COUNT(BID)|
+--------+----------+
|Lubber  |3         |
|Dustin  |4         |
|Horataio|3         |
+--------+----------+
```

<div class="text">24. Find sailors whose rating is greater than that of some sailor called Horatio.</div>

```sql
SELECT *
FROM SAILORS
WHERE SNAME IN (SELECT S1.SNAME
                FROM SAILORS S1,
                     SAILORS S2
                WHERE S1.RATING > S2.RATING
                  AND S2.SNAME = 'Horataio');
```

```text
+---+--------+------+----+
|SID|SNAME   |RATING|AGE |
+---+--------+------+----+
|31 |Lubber  |8     |55.5|
|32 |Andy    |8     |25.5|
|58 |Rusty   |10    |35.0|
|71 |Zorba   |10    |16.0|
|74 |Horataio|9     |35.0|
|64 |Horataio|7     |35.0|
+---+--------+------+----+
```

<div class="text">25. Find sailors whose rating is better than every sailor called Horatio.</div>

```sql
SELECT SNAME, RATING
FROM SAILORS
WHERE RATING > (SELECT MIN(RATING)
                FROM SAILORS
                WHERE SNAME IN (SELECT S1.SNAME
                                FROM SAILORS S1,
                                     SAILORS S2
                                WHERE S1.RATING > S2.RATING
                                  AND S2.SNAME = 'Horataio')
                  AND SNAME = 'Horataio')
  AND SNAME != 'Horataio';
```

```text
+------+------+
|SNAME |RATING|
+------+------+
|Lubber|8     |
|Andy  |8     |
|Rusty |10    |
|Zorba |10    |
+------+------+
```

<div class="text">26. Find the sailors with the highest rating.</div>

```sql
SELECT *
FROM SAILORS
WHERE RATING = (SELECT MAX(RATING)
                FROM SAILORS);
```

```text
+---+-----+------+----+
|SID|SNAME|RATING|AGE |
+---+-----+------+----+
|58 |Rusty|10    |35.0|
|71 |Zorba|10    |16.0|
+---+-----+------+----+
```

<div class="text">Q27. For each red boat, find its bid, and the number of reservations.</div>

```sql
SELECT BID, COUNT(BID)
FROM RESERVES
GROUP BY BID
HAVING BID IN (SELECT BID
               FROM BOATS
               WHERE COLOR = 'red');
```

```text
+---+----------+
|BID|COUNT(BID)|
+---+----------+
|102|3         |
|104|2         |
+---+----------+
```

<div class="text">Q28. Find the average age of sailors for each rating level that has at least two sailors.</div>

```sql
SELECT RATING, AVG(AGE) "AVERAGE AGE"
FROM SAILORS
GROUP BY RATING
HAVING COUNT(SNAME) = 2;
```

```text
+------+-----------+
|RATING|AVERAGE AGE|
+------+-----------+
|8     |40.5       |
|7     |40         |
|3     |44.5       |
|10    |25.5       |
+------+-----------+
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