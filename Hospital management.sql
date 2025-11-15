create database Hospital_Management;
use Hospital_Management;

# table 1
create table departments(department_id int primary key, department_name varchar(100),
location varchar(100));
insert into departments (department_id, department_name, location) values
(1, 'Cardiology', 'Block A'),
(2, 'Orthopedics', 'Block B'),
(3, 'Neurology', 'Block C'),
(4, 'Pediatrics', 'Block D'),
(5, 'Dermatology', 'Block E');
select * from departments;

#table 2
create table doctors( doctor_id int primary key, doctor_name varchar(100),
specialization varchar(100), department_id int, phone varchar(20),
foreign key (department_id) references departments(department_id));
insert into doctors (doctor_id, doctor_name, specialization, department_id, phone) VALUES
(101, 'Dr. Rajesh Kumar', 'Cardiologist', 1, '9876543210'),
(102, 'Dr. Priya Singh', 'Orthopedic Surgeon', 2, '9812345678'),
(103, 'Dr. John Watson', 'Neurologist', 3, '9998765432'),
(104, 'Dr. Emily Brown', 'Pediatrician', 4, '9988776655'),
(105, 'Dr. Neha Gupta', 'Dermatologist', 5, '9765432189');
select * from doctors;

# table 3
create table patients( patient_id int primary key, patient_name varchar(100),
gender varchar(10), age int, address varchar(150), phone varchar(20));
INSERT INTO patients (patient_id, patient_name, gender, age, address, phone) VALUES
(201, 'Amit Sharma', 'Male', 35, 'Mumbai', '9001112233'),
(202, 'Sneha Patel', 'Female', 28, 'Delhi', '9002223344'),
(203, 'Robert Lee', 'Male', 45, 'Chennai', '9003334455'),
(204, 'Anjali Mehta', 'Female', 6, 'Pune', '9004445566'),
(205, 'David Kim', 'Male', 30, 'Kolkata', '9005556677');
select * from patients;

#table 4
create table appointments(appointment_id int primary key, patient_id int,doctor_id int,
appointment_date date, diagnosis varchar(255), foreign key (patient_id) references
patients(patient_id),foreign key (doctor_id) references doctors(doctor_id));
insert into appointments (appointment_id, patient_id, doctor_id, appointment_date, diagnosis) VALUES
(301, 201, 101, '2025-01-05', 'High Blood Pressure'),
(302, 202, 102, '2025-01-12', 'Knee Pain'),
(303, 203, 103, '2025-02-10', 'Migraine'),
(304, 204, 104, '2025-03-01', 'Fever and Cough'),
(305, 205, 105, '2025-03-18', 'Skin Allergy');
select * from appointments;

#table 5
create table bills(bill_id int primary key, appointment_id int,
total_amount decimal(10,2), payment_status varchar(50), payment_date date,
foreign key (appointment_id) references appointments(appointment_id));
INSERT INTO bills (bill_id, appointment_id, total_amount, payment_status, payment_date) VALUES
(401, 301, 2500.00, 'Paid', '2025-01-05'),
(402, 302, 1800.00, 'Unpaid', NULL),
(403, 303, 3000.00, 'Paid', '2025-02-10'),
(404, 304, 1500.00, 'Paid', '2025-03-01'),
(405, 305, 2200.00, 'Unpaid', NULL);
select * from bills;

select * from departments;
select * from doctors;
select * from patients;
select * from appointments;
select * from bills;
