DROP TABLE APPEALS;

DROP TABLE CRIME_OFFICERS;

DROP TABLE CRIME_CHARGES;

ALTER TABLE CRIMINALS
  ADD CONSTRAINT criminals_criminalID_pk PRIMARY KEY(criminal_id);
  
ALTER TABLE CRIMINALS
  ADD CONSTRAINT criminals_vstatus_ck CHECK(v_status IN ('Y','N'));
  
ALTER TABLE CRIMINALS 
  ADD CONSTRAINT criminals_pstatus_ck CHECK(p_status IN ('Y','N'));
  
ALTER TABLE CRIMES
  ADD CONSTRAINT crimes_crimeid_pk PRIMARY KEY(crime_id);

ALTER TABLE CRIMES
  ADD CONSTRAINT crimes_criminalid_fk FOREIGN KEY(criminal_id)
      REFERENCES CRIMINALS (criminal_id);

ALTER TABLE CRIMES
  ADD CONSTRAINT crimes_class_ck CHECK(classification IN ('F','M','O','U'));
  
ALTER TABLE CRIMES
  ADD CONSTRAINT crimes_status_ck CHECK(status IN ('CL','CA','IA'));
  
ALTER TABLE ALIASES
  ADD CONSTRAINT aliases_aliasid_pk PRIMARY KEY(alias_id);
  
ALTER TABLE ALIASES
  ADD CONSTRAINT aliases_criminalid_fk FOREIGN KEY(criminal_id)
    REFERENCES criminals (criminal_id);

ALTER TABLE SENTENCES
  ADD CONSTRAINT sentences_sentenceid_pk PRIMARY KEY(sentence_id);
  
ALTER TABLE SENTENCES
  ADD CONSTRAINT sentences_criminalid_fk FOREIGN KEY(criminal_id)
    REFERENCES criminals (criminal_id);
    
ALTER TABLE SENTENCES
  ADD CONSTRAINT sentences_type_ck CHECK(type IN ('J','H','P'));
  
ALTER TABLE PROB_OFFICERS
  ADD CONSTRAINT probofficers_probid_pk PRIMARY KEY(prob_id);
  
ALTER TABLE PROB_OFFICERS
  ADD CONSTRAINT probofficers_status_ck CHECK(status IN ('A','I'));
  
ALTER TABLE OFFICERS
  ADD CONSTRAINT officers_officerid_pk PRIMARY KEY(officer_id);
  
ALTER TABLE OFFICERS
  ADD CONSTRAINT officers_status_ck CHECK(status IN ('A','I'));
  
CREATE TABLE crime_charges
(charge_id NUMBER(10,0),
crime_id NUMBER(9,0),
crime_code NUMBER(3,0),
charge_status CHAR(2),
fine_amount NUMBER(7,2),
court_fee NUMBER(7,2),
amount_paid NUMBER(7,2),
pay_due_date DATE,
  CONSTRAINT crimecharges_chargeid_pk PRIMARY KEY(charge_id),
  CONSTRAINT crimecharges_crimeid_fk FOREIGN KEY(crime_id)
    REFERENCES crimes (crime_id),
  CONSTRAINT crimecharges_chargestatus_ck 
    CHECK(charge_status IN ('PD','GL','NG'))
);

CREATE TABLE crime_officers
(crime_id NUMBER(9,0),
officer_id NUMBER(8,0),
  CONSTRAINT crimeofficers_crimeid_fk FOREIGN KEY(crime_id)
    REFERENCES crimes (crime_id),
  CONSTRAINT crimeofficers_officerid_fk FOREIGN KEY(officer_id)
    REFERENCES officers (officer_id)
);

CREATE TABLE appeals
(appeal_id NUMBER(5),
crime_id NUMBER(9,0),
filing_date DATE,
hearing_date DATE,
status CHAR(1),
  CONSTRAINT appeals_appealid_pk PRIMARY KEY(appeal_id),
  CONSTRAINT appeals_crimeid_fk FOREIGN KEY(crime_id)
    REFERENCES crimes (crime_id),
  CONSTRAINT appeals_status_ck CHECK(status IN ('P','A','D'))
);