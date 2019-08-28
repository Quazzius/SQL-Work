// Author: Jeff Flanegan
// CIS 243
// City Jail 9

//1
SELECT criminal_id, last, first, crime_code, fine_amount
FROM criminals JOIN crimes USING(criminal_id)
  JOIN crime_charges USING (crime_id);

SELECT c.criminal_id, c.last, c.first, cch.crime_code, cch.fine_amount
FROM criminals c, crimes cr, crime_charges cch
WHERE c.criminal_id = cr.criminal_id
  AND cr.crime_id = cch.crime_id;

//2
SELECT criminal_id, criminals.last, criminals.first, crimes.classification, crimes.date_charged, appeals.filing_date, appeals.status
FROM criminals LEFT OUTER JOIN crimes USING (criminal_id)
  LEFT OUTER JOIN crime_charges USING (crime_id)
  LEFT OUTER JOIN appeals USING (crime_id);

SELECT c.criminal_id, c.last, c.first, cr.classification, cr.date_charged, a.filing_date, a.status
FROM criminals c, crimes cr, crime_charges cch, appeals a
WHERE c.criminal_id = cr.criminal_id (+)
  AND cr.crime_id = cch.crime_id (+)
  AND cch.crime_id = a.crime_id(+);
  
//3
SELECT criminal_id, last, first, classification, date_charged, crime_code, fine_amount
FROM criminals JOIN crimes USING (criminal_id)
  JOIN crime_charges USING (crime_id)
  WHERE classification = 'O'
ORDER BY criminal_id, date_charged;

SELECT c.criminal_id, c.last, c.first, cr.classification, cr.date_charged, cch.crime_code, cch.fine_amount
FROM criminals c, crimes cr, crime_charges cch
WHERE c.criminal_id = cr.criminal_id
  AND cr.crime_id = cch.crime_id
  AND classification = 'O'
ORDER BY criminal_id, date_charged;

//4
SELECT criminal_id, last, first, v_status, p_status, alias
FROM criminals LEFT OUTER JOIN aliases USING (criminal_id)
ORDER BY last, first;

SELECT c.criminal_id, c.last, c.first, c.v_status, c.p_status, a.alias
FROM criminals c, aliases a
WHERE c.criminal_id = a.criminal_id (+)
ORDER BY last, first;

//5
SELECT c.last, c.first, s.start_date, s.end_date, pc.con_freq
FROM criminals c, sentences s, prob_contact pc
WHERE c.criminal_id = s.criminal_id
  AND s.end_date - s.start_date BETWEEN pc.low_amt AND pc.high_amt;

SELECT c.last, c.first, s.start_date, s.end_date, pc.con_freq
FROM criminals c JOIN sentences s USING (criminal_id)
  JOIN prob_contact pc
    ON s.end_date - s.start_date BETWEEN pc.low_amt AND pc.high_amt;

//6
SELECT p.last, p.first, m.last as mgr_last, m.first as mgr_first
FROM prob_officers p, prob_officers m
 WHERE p.mgr_id = m.prob_id (+)
ORDER BY p.last, p.first;

SELECT p.last, p.first, m.last as mgr_last, m.first as mgr_first
FROM prob_officers p LEFT OUTER JOIN prob_officers m
 ON p.mgr_id = m.prob_id
ORDER BY p.last, p.first;