-- schema.sql
-- =========================================
-- Healthcare Management Database Schema
-- Author: Tochukwu Ikwelle
-- Description: Defines all base tables for healthcaredata_db
-- =========================================

CREATE DATABASE IF NOT EXISTS healthcaredata_db;
USE healthcaredata_db;

-- =====================
-- Patients Table
-- =====================
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    contact_No VARCHAR(20),
    pt_Address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================
-- Doctors Table
-- =====================
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    department_id INT,
    hired_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================
-- Departments Table
-- =====================
CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- =====================
-- Appointments Table
-- =====================
CREATE TABLE appointment (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    reason VARCHAR(255),
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================
-- Medical Records Table
-- =====================
CREATE TABLE medicalrecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis TEXT,
    treatment TEXT,
    record_date DATE DEFAULT (CURRENT_DATE),
    notes TEXT
);

-- =====================
-- Surgery Records Table
-- =====================
CREATE TABLE surgeryrecords (
    surgery_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    surgery_type VARCHAR(100),
    surgery_date DATE,
    outcome VARCHAR(255),
    notes TEXT
);

-- =====================
-- Beds and Rooms
-- =====================
CREATE TABLE bed (
    bed_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT,
    bed_number VARCHAR(10),
    status ENUM('Available', 'Occupied', 'Maintenance') DEFAULT 'Available'
);

CREATE TABLE room (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    ward_id INT,
    room_number VARCHAR(10),
    capacity INT,
    status ENUM('Available', 'Full', 'Maintenance') DEFAULT 'Available'
);

CREATE TABLE wards (
    ward_id INT AUTO_INCREMENT PRIMARY KEY,
    ward_name VARCHAR(100),
    description TEXT
);

CREATE TABLE bedrecords (
    bed_record_id INT AUTO_INCREMENT PRIMARY KEY,
    bed_id INT,
    patient_id INT,
    date_assigned DATE,
    date_released DATE
);

-- =====================
-- Staff & Shifts
-- =====================
CREATE TABLE nurse (
    nurse_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department_id INT,
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE helpers (
    helper_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department_id INT,
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE staff_shift (
    shift_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_type ENUM('Doctor', 'Nurse', 'Helper'),
    staff_id INT,
    shift_date DATE,
    shift_time ENUM('Morning', 'Afternoon', 'Night')
);

CREATE TABLE roomrecords (
    room_record_id INT AUTO_INCREMENT PRIMARY KEY,
    room_id INT,
    patient_id INT,
    date_assigned DATE,
    date_released DATE
);
