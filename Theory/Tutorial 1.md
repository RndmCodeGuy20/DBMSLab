# SQL Tutorial 1

SQL stands for Structured Query Language and is considered as a fourth generation non-procedural programming language.

### Create a User in SQL

Oracle 11g ships with a default `system` user which has all the privileges of that of a DBA, to create a user, user must
be logged in as `system`.

> `SHOW USER` can be used to see current user on that system.

To create a user, the current user must be `system` or `DBA`.

```sql
CREATE USER SHANTANU IDENTIFIED BY RNDM;
```

Where `SHANTANU` is the user name and `RNDM` is the password for that user. To verify if the user is created
successfully or not we can run the following command.

```sql
SELECT USERNAME
FROM ALL_USERS;
```

|   Role   | Privileges and Permissions                                                                                                                                   |
|:--------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| CONNECT  | CREATE SESSION                                                                                                                                               |
| RESOURCE | CREATE DATABASE LINK, CREATE ROLE, CREATE SYNONYM,CREATE TABLE, CREATE VIEW, CREATE MATERIALIZED VIEW, CREATE TYPE, CREATE PROCEDURE, CREATE TRIGGER, CREATE |
|   DBA    | ALL system privileges with ADMIN option                                                                                                                      |

To grant a permission or resource to a user, first login as `system` and write the command.

```sql
GRANT CONNECT, RESOURCE TO SHANTANU;
```

### Various SQL Statements and their categories

|               SQL Subset               | Basic statements included           |
|:--------------------------------------:|-------------------------------------|
|    DATA DEFINITION LANGUAGE **DDL**    | ALTER, CREATE, DROP, TRUNCATE       |
|   DATA MANIPULATION LANGUAGE **DML**   | DELETE, INSERT, UPDATE              |
|      DATA QUERY LANGUAGE **DQL**       | SELECT with various clauses/options |
|     DATA CONTROL LANGUAGE **DCL**      | GRANT, REVOKE                       |
| TRANSACTION CONTROL LANGUAGE   **TCL** | COMMIT, ROLLBACK, SAVEPOINT         |

<style>
h1, h2, h3{
font-family: 'Bebas Neue', sans-serif;
}

* {
font-family: 'Inria Sans', sans-serif;
}
</style>