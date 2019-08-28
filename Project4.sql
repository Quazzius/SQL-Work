CREATE SEQUENCE criminals_criminalid_seq
INCREMENT BY 1
START WITH 1017
NOCACHE;

CREATE SEQUENCE criminals_crimes_seq;

INSERT INTO criminals (criminal_id, last, first, street, city, zip)
VALUES (criminals_criminalid_seq.NEXTVAL, 'Capps', 'Johnny', '1020 Maple', 'Garland', '80527');

SELECT *
FROM criminals;

desc crimes

INSERT INTO crimes (crime_id, criminal_id, classification)
VALUES(criminals_crimes_seq.NEXTVAL, criminals_crimes_seq.CURRVAL, 'M');

ALTER TABLE crimes
DROP CONSTRAINT CRIMES_CRIMINALID_FK;

CREATE INDEX criminals_lname_idx
ON criminals(last);

CREATE INDEX criminals_street_idx
ON criminals(street);

CREATE INDEX criminals_phone_idx
ON criminals(phone);

//a bitmap index would possibly be useful for the columns with single character
//possible values as they have low caridnality.

//synonyms would make every column with an underscore more enjoyable.
//sysnonyms should just make things easier to remember or easier to type.
