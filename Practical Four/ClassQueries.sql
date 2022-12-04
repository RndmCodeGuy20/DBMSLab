-- Q1. Find the name and age of the oldest sailor.

SELECT *
FROM SAILORS
WHERE AGE = (SELECT MAX(AGE) "OLDEST SAILOR AGE"
             FROM SAILORS)

-- Q2. Find the names of sailors who have reserved boat number 103.

SELECT *
FROM SAILORS S,
     RESERVES R
WHERE S.SID = R.SID
  AND R.BID = 103;

-- ALTERNATE METHOD

SELECT *
FROM SAILORS
         JOIN RESERVES USING (SID)
WHERE BID = 103;

-- ALTERNATE METHOD

SELECT *
FROM SAILORS
WHERE SID IN (SELECT SID
              FROM RESERVES
              WHERE BID = 103);

-- ALTERNATE METHOD
-- NOT
SELECT SNAME
FROM SAILORS S
WHERE EXISTS(SELECT * FROM RESERVES R WHERE S.SID = R.SID AND R.BID = 103
          );


-- Q3. Find the sids of sailors who have reserved a red boat.

SELECT *
FROM SAILORS
WHERE SID IN (SELECT SID
              FROM RESERVES
              WHERE BID IN (SELECT BID
                            FROM BOATS
                            WHERE COLOR = 'red'));

-- ALTERNATE METHOD

SELECT SNAME
FROM SAILORS
WHERE SID IN (SELECT SID
              FROM RESERVES
              WHERE BID IN (SELECT BID
                            FROM BOATS
                            WHERE COLOR = 'red'));

-- ALTERNATE METHOD

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

-- ALTERNATE METHOD

SELECT DISTINCT SID, SNAME
FROM SAILORS
         NATURAL JOIN RESERVES
         NATURAL JOIN BOATS
WHERE COLOR = 'red';

-- Q4. Find the colors of boats reserved by Lubber.

SELECT *
FROM BOATS
         NATURAL JOIN RESERVES
         NATURAL JOIN SAILORS
WHERE SNAME = 'Lubber';

-- ALTERNATE METHOD

SELECT *
FROM BOATS B
WHERE EXISTS(SELECT *
             FROM RESERVES R
             WHERE B.BID = R.BID
               AND EXISTS(
                     SELECT * FROM SAILORS S WHERE R.SID = S.SID AND SNAME = 'Lubber'
                 ))

-- ALTERNATE METHOD

-- SELECT SID
-- FROM BOATS B
--          INNER JOIN RESERVES R on B.BID = R.BID
-- INTERSECT
-- SELECT R.SID
-- FROM SAILORS B
--          INNER JOIN RESERVES R on B.SID = R.SID
-- WHERE SNAME = 'Lubber';

-- Q6. Find the names of sailors who have reserved at least one boat.

SELECT DISTINCT SNAME
FROM SAILORS S
         JOIN RESERVES R ON S.SID = R.SID;

-- Q7. Find names of sailors who’ve reserved a red or a green boat.

SELECT *
FROM SAILORS S
WHERE EXISTS(
              SELECT SID
              FROM RESERVES R
              WHERE S.SID = R.SID
                AND EXISTS(
                      SELECT * FROM BOATS B WHERE R.BID = B.BID AND COLOR IN ('red', 'green')
                  )
          )

-- Q9. Find names of all sailors who’ve reserved red boat but not green boat.

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

-- Q10. Find sid’s of all sailors who have a rating of 10 or reserved boat 104.

SELECT S.SID
FROM Sailors S
WHERE S.RATING = 10
UNION
SELECT R.SID
FROM Reserves R
WHERE R.BID = 104;


-- Q11. Find sid’s of all sailors who have a reserved boat 103

SELECT S.SID, SNAME, BID, RATING
FROM SAILORS S
         JOIN RESERVES R ON S.SID = R.SID
WHERE BID = 103;

-- Q12. Find names of sailors with at most one reservation for boat #103.

SELECT S.SNAME
FROM SAILORS S
WHERE EXISTS(
              SELECT BID
              FROM RESERVES R
              WHERE S.SID = R.SID
                AND R.BID = 103);


-- Q14. NAME OF SAILOR WHOSE RATING IS GREATER THAN THAT OF any HORATIO.

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

-- Q16. Find the sailors with the highest rating.

SELECT *
FROM SAILORS
WHERE RATING = (SELECT MAX(RATING) FROM SAILORS);

-- division operator

-- Q17. FIND THE NAME OF ALL SAILORS WHO RESERVED ALL BOATS.

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

-- Q18. Count the number of Sailors.
SELECT COUNT(SNAME)
FROM SAILORS;

-- Q19. Count the number of different sailor names.

SELECT COUNT(DISTINCT SNAME)
FROM SAILORS;

-- 20. Find the average age of all sailors
SELECT AVG(AGE) "AVERAGE AGE OF SAILORS"
FROM SAILORS;

-- Q21. Find the average age of sailors with rating of 10
SELECT AVG(AGE)
FROM SAILORS
WHERE RATING = 10;

-- Q22. Count the number of boats reserved by each sailor (display sailors name and count).
SELECT SNAME, COUNT(BID)
FROM RESERVES R
         JOIN SAILORS S ON R.SID = S.SID
GROUP BY SNAME;

-- Q23. Find the names of the sailors who reserved two or more boats.
SELECT SNAME, COUNT(BID)
FROM RESERVES R
         JOIN SAILORS S ON R.SID = S.SID
GROUP BY SNAME
HAVING COUNT(BID) > 2;

-- 24. Find sailors whose rating is greater than that of some sailor called Horatio.

SELECT *
FROM SAILORS
WHERE SNAME IN (SELECT S1.SNAME
                FROM SAILORS S1,
                     SAILORS S2
                WHERE S1.RATING > S2.RATING
                  AND S2.SNAME = 'Horataio');

-- 25. Find sailors whose rating is better than every sailor called Horatio.

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
-- 26. Find the sailors with the highest rating.

SELECT *
FROM SAILORS
WHERE RATING = (SELECT MAX(RATING)
                FROM SAILORS);

-- 27. For each red boat, find its bid, and the number of reservations.

SELECT BID, COUNT(BID)
FROM RESERVES
GROUP BY BID
HAVING BID IN (SELECT BID
               FROM BOATS
               WHERE COLOR = 'red');

-- 28. Find the average age of sailors for each rating level that has at least two sailors.

SELECT RATING, AVG(AGE) "AVERAGE AGE"
FROM SAILORS
GROUP BY RATING
HAVING COUNT(SNAME) = 2;