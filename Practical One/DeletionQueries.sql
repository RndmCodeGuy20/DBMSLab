-- DELETE SELECTED TUPLES
-- DELETE
-- FROM PARTICIPANT
-- WHERE CID = 101;

-- DELETE ALL PARTICIPANTS
-- DELETE FROM PARTICIPANT
-- WHERE 1 = 1;

-- ROLLBACK; FOR CTRL+Y

-- UPDATION QUERIES
UPDATE PARTICIPANT
SET PNAME  = 'ADRIANA',
    GENDER = 'F'
WHERE PID = 1002;