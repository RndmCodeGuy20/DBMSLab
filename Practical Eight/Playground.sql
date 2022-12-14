SELECT *
FROM BOATS;

SELECT *
FROM SAILORS;

SELECT BID, count(BID)
FROM RESERVES
GROUP BY BID;


SELECT SNAME, BNAME
FROM SAILORS S
         FULL JOIN RESERVES R ON S.SID = R.SID
         FULL JOIN BOATS B on R.BID = B.BID
WHERE B.BID IN (SELECT BID
                FROM SAILORS S2
                         JOIN RESERVES R2 on S2.SID = R2.SID
                WHERE S2.SID = 22);


SELECT COUNT(SNAME)
FROM SAILORS S2
         JOIN RESERVES R2 on S2.SID = R2.SID
WHERE S2.SID = 22;

SELECT S.SID, S.SNAME
FROM RESERVES R
         JOIN SAILORS S on R.SID = S.SID
GROUP BY S.SID, S.SNAME
HAVING COUNT(DISTINCT BID) = (SELECT COUNT(BID)
                              FROM BOATS);

CREATE OR REPLACE VIEW SAMPLE_VIEW AS
(
SELECT SNAME, RATING
FROM SAILORS
    );

SELECT *
FROM SAMPLE_VIEW;

SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 20;