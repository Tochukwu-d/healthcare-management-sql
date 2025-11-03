show tables from healthcaredata_db;

# to view the table structure and information
describe appointment;
describe patients;
describe department;

# check number of records in tables
SELECT 'appointment' AS table_name, COUNT(*) AS total_records FROM appointment
UNION
SELECT 'patients', COUNT(*) FROM patients
UNION
SELECT 'bed', COUNT(*) FROM bed
UNION
SELECT 'bedrecords', COUNT(*) FROM bedrecords
UNION
SELECT 'department', COUNT(*) FROM department
UNION
SELECT 'doctors', COUNT(*) FROM doctors
UNION
SELECT 'helpers', COUNT(*) FROM helpers
UNION
SELECT 'medicalrecords', COUNT(*) FROM medicalrecords
UNION
SELECT 'nurse', COUNT(*) FROM nurse
UNION
SELECT 'room', COUNT(*) FROM room
UNION
SELECT 'roomrecords', COUNT(*) FROM roomrecords
UNION
SELECT 'staffshift', COUNT(*) FROM staffshift
UNION
SELECT 'surgeryrecords', COUNT(*) FROM surgeryrecords
UNION
SELECT 'wards', COUNT(*) FROM wards;



 
