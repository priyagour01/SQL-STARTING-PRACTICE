create database Employeess;
use Employeess;
create table Employeess(emp_id int primary key, emp_name varchar(50), 
dept_id int);
insert into Employeess (emp_id, emp_name, dept_id) values 
(1, 'Priya', 10),
(2, 'Aman', 20),
(3, 'Ravi', 30);
select * from Employeess;

create table departments(dept_id int primary key, dept_name varchar(50));
insert into Departments (dept_id, dept_name) values
(10, 'HR'),
(20, 'IT'),
(40, 'Finance');
select * from departments;