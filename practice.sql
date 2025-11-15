]]]create database depart_ment;
use depart_ment;

create table depart_ments (
    d_id int primary key,              
    d_name varchar(100) not null,      
    location varchar(100) unique,               
    total_staff int check (total_staff >= 0)    
);

insert into depart_ments (d_id, d_name, location, total_staff) values
(1, 'Cardiology', 'Building A', 25),
(2, 'Neurology', 'Building B', 18),
(3, 'Orthopedics', 'Building C', 22),
(4, 'Pediatrics', 'Building D', 15),
(5, 'Radiology', 'Building E', 12);
select * from depart_ments;

create table doctors (
    doctor_id int primary key,                           
    doctor_name varchar(100) not null,                   
    specialization varchar(100),                         
    phone varchar(20) unique,                            
    salary decimal(10,2) check (salary > 10000),         
    d_id int,                                   
    foreign key (d_id) references depart_ments(d_id)
);
insert into doctors(doctor_id, doctor_name, specialization, phone, salary, d_id) values
(101, 'dr.Priya Gour', 'Cardiologist', '6758940356', 56009.00, 1),
(102, 'Dr. Neha Sharma', 'Neurologist', '9988776655', 72000.00, 2),
(103, 'Dr. Arjun Mehta', 'Orthopedic Surgeon', '9123456780', 58000.00, 3),
(104, 'Dr. Kavita Singh', 'Pediatrician', '9000011122', 60000.00, 4),
(105, 'Dr. Suresh Rao', 'Radiologist', '9334455667', 70000.00, 5);
select * from doctors;

delete from depart_ments where  location = 'Building A';



