# Add foreign keys relationships to the database

USE healthcaredata_db;

# show relationship b/w patient_id in tables 'appointment' and 'patient' (Appointment: Patient and Doctors)
ALTER TABLE appointment
ADD CONSTRAINT foreign_key_appointment_patient
FOREIGN KEY (patient_Id) 
REFERENCES patients(patient_Id)
ON DELETE cascade
ON UPDATE cascade;

ALTER TABLE appointment
ADD CONSTRAINT foreign_key_appointment_doctor
FOREIGN KEY (doct_Id) 
REFERENCES doctors(doct_Id)
ON DELETE cascade
ON UPDATE cascade;

# Doctors and Department
ALTER TABLE doctors
ADD CONSTRAINT foreign_key_department
FOREIGN KEY (dept_Id)
REFERENCES department (dept_Id)
ON DELETE cascade
ON UPDATE cascade;

ALTER TABLE department
ADD PRIMARY KEY (dept_Id);

# Medical Records: Patients and Doctors
ALTER TABLE medicalrecords
ADD CONSTRAINT fkey_medical_record_patients
FOREIGN KEY (patient_Id)
REFERENCES patients (patient_Id)
ON DELETE cascade
ON UPDATE cascade;
##########################################################
SELECT doct_Id
FROM medicalrecords
WHERE doct_Id NOT IN (SELECT doct_Id FROM doctors);

SET SQL_SAFE_UPDATES = 0;

DELETE FROM medicalrecords
WHERE doct_Id NOT IN (SELECT doct_Id FROM doctors);

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE medicalrecords
ADD CONSTRAINT fkey_medical_record_doctors
FOREIGN KEY (doct_Id)
REFERENCES doctors (doct_Id)
ON DELETE cascade
ON UPDATE cascade;

############################################################
# Surgeryrecords: nurses, surgeons

DESCRIBE doctors;
DESCRIBE surgeryrecords;

ALTER TABLE surgeryrecords
CHANGE COLUMN surgeon_Id doct_Id INT;

SELECT DISTINCT doct_Id
FROM surgeryrecords
WHERE doct_Id NOT IN (SELECT doct_Id FROM doctors);

SET SQL_SAFE_UPDATES = 0;

DELETE FROM surgeryrecords
WHERE doct_Id NOT IN (SELECT doct_Id FROM doctors);

SET SQL_SAFE_UPDATES = 1;

SELECT DISTINCT nurse_Id
FROM surgeryrecords
WHERE nurse_Id NOT IN (SELECT nurse_Id FROM nurse);

SHOW INDEXES FROM nurse;

ALTER TABLE nurse
CHANGE COLUMN `ï»¿nurse_Id` nurse_Id INT;

ALTER TABLE nurse
ADD PRIMARY KEY (nurse_Id);

ALTER TABLE surgeryrecords
ADD CONSTRAINT fkey_surgeryrecords_Nurs
FOREIGN KEY (nurse_Id)
REFERENCES nurse (nurse_Id)
ON DELETE cascade
ON UPDATE cascade;

ALTER TABLE surgeryrecords
ADD CONSTRAINT fkey_surgeryrecords_Doct
FOREIGN KEY (doct_Id)
REFERENCES doctors (doct_Id)
ON DELETE cascade
ON UPDATE cascade;











SHOW COLUMNS FROM department;
SHOW COLUMNS FROM patients;
SHOW COLUMNS FROM appointment;