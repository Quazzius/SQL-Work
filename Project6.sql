SELECT *
FROM aliases
WHERE ALIAS LIKE 'B%';

SELECT crime_id, criminal_id, date_charged, classification
FROM crimes
WHERE date_charged >= '01-OCT-08' AND date_charged <= '31-OCT-08';

SELECT crime_id, criminal_id, date_charged, status
FROM crimes
WHERE status = 'CA' OR status = 'IA';

SELECT crime_id, criminal_id, date_charged, classification
FROM crimes
WHERE classification = 'F';

SELECT crime_id, criminal_id, date_charged, hearing_date
FROM crimes
WHERE hearing_date > 14 + date_charged;

SELECT criminal_id, last, zip
FROM criminals
WHERE zip = '23510'
ORDER BY criminal_id;

SELECT crime_id, criminal_id, date_charged, hearing_date
FROM crimes
WHERE hearing_date IS NULL;

SELECT sentence_id, criminal_id, prob_id
FROM sentences
WHERE prob_id IS NOT NULL;

SELECT crime_id, criminal_id, classification, status
FROM crimes
WHERE classification = 'M' AND status = 'IA';

SELECT charge_id, crime_id, fine_amount, court_fee, amount_paid, fine_amount + court_fee - amount_paid "amount owed"
FROM crime_charges
WHERE fine_amount + court_fee - amount_paid > 0;

SELECT officer_id, last, precinct, status
FROM officers
WHERE status = 'A' AND precinct = 'OCVW' OR precinct = 'GHNT'
ORDER BY precinct, last;