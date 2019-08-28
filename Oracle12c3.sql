CREATE SEQUENCE cust_seq
START WITH 1021
NOMAXVALUE
NOMINVALUE
NOCACHE
NOCYCLE;

INSERT INTO customers (customer#, lastname, firstname, zip)
VALUES (cust_seq.NEXTVAL, 'shoulders', 'frank', '23567');

select *
from customers;

CREATE SEQUENCE MY_FIRST_SEQ
INCREMENT BY -3
START WITH 5
MAXVALUE 5
MINVALUE 0
NOCYCLE;

SELECT MY_FIRST_SEQ.NEXTVAL
FROM DUAL;

ALTER SEQUENCE MY_FIRST_SEQ
MINVALUE -1000;

CREATE TABLE email_log
(emailid NUMBER GENERATED AS IDENTITY PRIMARY KEY,
emaildate DATE,
customer# NUMBER(4)
);

INSERT INTO email_log (emaildate, customer#)
VALUES (SYSDATE, 1007);
INSERT INTO email_log (emailid, emaildate, customer#)
VALUES (DEFAULT, SYSDATE, 1008);
INSERT INTO email_log (emailid, emaildate, customer#)
VALUES (25, SYSDATE, 1009);

CREATE SYNONYM numgen
FOR MY_FIRST_SEQ;

SELECT numgen.CURRVAL
FROM dual;

DROP SYNONYM numgen;

DROP SEQUENCE MY_FIRST_SEQ;

CREATE INDEX customers_last_idx
ON customers(lastname);

SELECT index_name
FROM user_indexes;
DROP INDEX customers_last_idx;

CREATE INDEX orders_shipdays_idx
  ON orders(shipdate-orderdate);
