Select crime_id, classification, date_charged, hearing_date, 
  (hearing_date - date_charged) 
FROM crimes
WHERE (hearing_date - date_charged) > 14;

SELECT *
FROM project;

INSERT INTO appeals(appeal_id, crime_id, filing_date, hearing_date, status)
VALUES ((APPEALS_ID_SEQ.NEXTVAL), '&crime_id', TO_DATE('&filing_date', 'MM DD, YYYY'), TO_DATE('&hearing_date', 'MM DD, YYYY'), DEFAULT);

SELECT *
FROM appeals
where crime_id = '25344031';