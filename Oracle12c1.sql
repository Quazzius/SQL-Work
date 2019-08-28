CREATE TABLE category
(CatCode varchar2(2),
CatDesc varchar2(10)
);

CREATE TABLE employees
(job_class VARCHAR2(4),
emp# NUMBER(5),
firstname VARCHAR2(12),
Lastname VARCHAR2(18)
);

ALTER TABLE employees
ADD (empdate DATE DEFAULT SYSDATE,
enddate DATE DEFAULT SYSDATE);

ALTER TABLE employees
MODIFY (job_class VARCHAR2(2));

ALTER TABLE employees
DROP COLUMN enddate;

RENAME employees TO jl_emps;

CREATE TABLE book_pricing
AS (SELECT isbn as id, cost, retail, category 
FROM books);

ALTER TABLE book_pricing
SET UNUSED (category);


TRUNCATE TABLE book_pricing;
desc book_pricing

DROP TABLE book_pricing Purge;

DROP TABLE jl_emps;
FLASHBACK TABLE jl_emps
TO BEFORE DROP;
DESC jl_emps
