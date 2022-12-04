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