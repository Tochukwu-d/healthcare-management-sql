# Add foreign keys relationships to the database

USE healthcaredata_db;

# show relationship b/w patient_id in tables 'appointment' and 'patient'
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

SHOW COLUMNS FROM patients;
SHOW COLUMNS FROM appointment;