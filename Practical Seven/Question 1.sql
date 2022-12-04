-- Q1. Write a procedure to display a message hello world!.

CREATE OR REPLACE PROCEDURE HELLOWORLD
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World!');
END;

BEGIN
    HELLOWORLD;
END;

-- EXECUTE HELLOWORLD;