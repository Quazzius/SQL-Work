//create 8 employees for this role
CREATE USER crimrecords8
IDENTIFIED BY password; 
//not using password expire because it doesnt work in developer

CREATE ROLE c_rec_role;
GRANT CREATE SESSION
TO c_rec_role;

GRANT SELECT, INSERT, UPDATE
ON student.criminals
TO c_rec_role;
GRANT SELECT, INSERT, UPDATE
ON student.crimes
TO c_rec_role;
GRANT SELECT, INSERT, UPDATE
ON student.crime_charges
TO c_rec_role;
GRANT SELECT, INSERT, UPDATE
ON student.aliases
TO c_rec_role;
GRANT SELECT, INSERT, UPDATE
ON student.officers
TO c_rec_role;
GRANT SELECT, INSERT, UPDATE
ON student.crime_codes
TO c_rec_role;

//created crimrecords 1-8 and grant role
GRANT c_rec_role
TO crimrecords8;

//create 7 employees for this role
CREATE USER courtrecord7
IDENTIFIED BY password;
CREATE ROLE crt_rec_role;

GRANT CREATE SESSION
TO crt_rec_role;
GRANT SELECT, INSERT, UPDATE
ON student.appeals
TO crt_rec_role;
GRANT SELECT, INSERT, UPDATE
ON student.sentences
TO crt_rec_role;
GRANT SELECT, INSERT, UPDATE
ON student.prob_officers
TO crt_rec_role;

//created courtrecord 1-7 and grant role
GRANT crt_rec_role 
TO courtrecord7;

//create 4 employees for this role
CREATE USER crimeanal4
IDENTIFIED BY password;
CREATE ROLE c_analysis_role;
GRANT CREATE SESSION
TO c_analysis_role;
GRANT SELECT ANY TABLE
TO c_analysis_role;

//created crimeanal 1-4 and grant role
GRANT c_analysis_role 
TO crimeanal4;

CREATE USER dofficer
IDENTIFIED BY passowrd;
CREATE ROLE d_officer_role;
GRANT CREATE SESSION
TO d_officer_role;
GRANT SELECT, DELETE
ON student.sentences
TO d_officer_role;
GRANT SELECT, DELETE
ON student.crimes
TO d_officer_role;
GRANT SELECT, DELETE
ON student.crime_charges
TO d_officer_role;
GRANT SELECT, DELETE
ON student.appeals
TO d_officer_role;
GRANT d_officer_role
TO dofficer;