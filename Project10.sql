/*Jeff Flanegan
City Jail 12 
5/3/2019 */

--1
--each officer that reported more than the average number of crimes reported
SELECT  last, first, officer_id
FROM officers JOIN crime_officers USING (officer_id)
GROUP BY last, first, officer_id
HAVING COUNT(officer_id) >ALL (SELECT AVG(COUNT(crime_id))
                               FROM crimes JOIN crime_officers USING (crime_id)
                               GROUP BY officer_id);
                       
--2
--criminals that have committed less than the average number of crimes
-- and are not violent offenders
SELECT  last, first
FROM criminals JOIN crimes USING (criminal_id)
WHERE v_status = 'N'
GROUP BY last, first
HAVING COUNT(criminal_id) <ALL (SELECT AVG(COUNT(crime_id))
                               FROM crimes JOIN criminals USING (criminal_id)
                               GROUP BY criminal_id); 
 
--3
--appeals that have less than the average 
--number of days between filing and hearing dates
SELECT *
FROM appeals
WHERE hearing_date - filing_date < (SELECT AVG(hearing_date - filing_date)
                                    FROM appeals);
                                    
--4
--probation officerrs that have less than the average number if criminals assigned
SELECT first, last
FROM prob_officers JOIN sentences USING (prob_id)
GROUP BY first, last
HAVING COUNT(prob_id) < (SELECT AVG(COUNT(prob_id))
                         FROM sentences
                         GROUP BY prob_id);

--5
--crime that has the highest number of appeals recorded
SELECT classification
FROM crimes
WHERE classification  IN (SELECT classification
                          FROM crimes
                          GROUP BY classification
                          HAVING COUNT(classification)=(SELECT MAX(COUNT(classification))
                                                       FROM crimes
                                                       GROUP BY classification))                         
GROUP BY classification;

--6
--charges that have a fine above average and sum paid below average
SELECT *
FROM crime_charges
WHERE fine_amount > (SELECT AVG(SUM(fine_amount))
                    FROM crime_charges
                    GROUP BY fine_amount)
AND amount_paid < (SELECT AVG(SUM(amount_paid))
                  FROM crime_charges
                  GROUP BY amount_paid);

--7
--criminals who have the same crime code charges as that involved in ID 10089
SELECT first, last
FROM criminals JOIN crimes USING (criminal_id)
JOIN crime_charges USING(crime_id)
WHERE crime_code = (SELECT crime_code
                    FROM crime_charges
                    WHERE crime_id = '10089');

--8
-- correleated subquery shows which criminals have had 
-- at least one probation period assigned
SELECT first, last
FROM criminals c
WHERE c.criminal_id IN (SELECT criminal_id
                        FROM sentences s
                        WHERE s.criminal_id = c.criminal_id
                        AND prob_id IS NOT NULL);

--9
-- officers that have booked the highest number of crimes
SELECT last, first
FROM officers
WHERE officer_id IN (SELECT officer_id
                    FROM crime_officers
                    GROUP BY officer_id
                    HAVING COUNT(officer_id) = (SELECT MAX(COUNT(officer_id))
                                                   FROM crime_officers
                                                   GROUP BY officer_id))
GROUP BY last, first;
                                          
--10
-- update the criminal data warehouse table with values from the criminal table
-- create new rows when data is not matched
MERGE INTO criminals_dw a
  USING criminals b
  ON (a.criminal_id = b.criminal_id)
WHEN MATCHED THEN
  UPDATE SET a.street=b.street, a.city = b.city, a.state = b.state, a.zip = b.zip,
      a.phone = b.phone, a.v_status = b.v_status, a.p_status = b.p_status
WHEN NOT MATCHED THEN
  INSERT (criminal_id, last, first, street, city, state, zip, phone, v_status, p_status)
    VALUES (b.criminal_id, b.last, b.first, b.street, b.city, b.state, b.zip, b.phone, b.v_status, b.p_status);
