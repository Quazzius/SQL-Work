CREATE TABLE aliases
(alias_id NUMBER(6),
criminal_id NUMBER(6,0),
alias VARCHAR2(10)
);

CREATE TABLE criminals
(criminal_id NUMBER(6,0),
last VARCHAR2(15),
first VARCHAR2(10),
street VARCHAR2(30),
city VARCHAR2(20),
state CHAR(2),
zip CHAR(5),
phone CHAR(10),
v_status CHAR(1) DEFAULT 'n',
p_status CHAR(1) DEFAULT 'n'
);

CREATE TABLE crimes
(crime_id NUMBER(9,0),
criminal_id NUMBER(6,0),
classification CHAR(1),
date_charged DATE,
status CHAR(2),
hearing_date_ DATE,
appeal_cut_date DATE
);

CREATE TABLE sentences
(sentence_id NUMBER(6),
criminal_id NUMBER(6),
type CHAR(1),
prob_id NUMBER(5),
start_date DATE,
end_date DATE,
violations NUMBER(3)
);

CREATE TABLE prob_officers
(prob_id NUMBER(5),
last VARCHAR2(15),
first VARCHAR2(10),
street VARCHAR2(30),
city VARCHAR2(20),
state CHAR(2),
zip CHAR(5),
phone CHAR(10),
email VARCHAR2(30),
status CHAR(1) DEFAULT 'a'
);

CREATE TABLE crime_charges
(charge_id NUMBER(10,0),
crime_id NUMBER(9,0),
crime_code NUMBER(3,0),
charge_status CHAR(2),
fine_amount NUMBER(7,2),
court_fee NUMBER(7,2),
amount_paid NUMBER(7,2),
pay_due_date DATE
); 

CREATE TABLE crime_officers
(crime_id NUMBER(9,0),
officer_id NUMBER(8,0)
);

CREATE TABLE officers
(officer_id NUMBER(8,0),
last VARCHAR2(15),
first VARCHAR2(10),
precinct CHAR(4),
badge VARCHAR2(14),
phone CHAR(10),
status CHAR(1) DEFAULT 'a'
);

CREATE TABLE appeals
(appeal_id NUMBER(5),
crime_id NUMBER(9,0),
filing_date DATE,
hearing_date DATE,
status CHAR(1) DEFAULT 'p'
);

CREATE TABLE crime_codes
(crime_code NUMBER(3,0),
code_description VARCHAR(30)
);

ALTER TABLE crimes
MODIFY (classification CHAR(1) DEFAULT 'u');

ALTER TABLE crimes
ADD (Date_recorded DATE DEFAULT SYSDATE);

ALTER TABLE prob_officers
ADD (pager# CHAR(10));

ALTER TABLE aliases
MODIFY (alias VARCHAR2(20));