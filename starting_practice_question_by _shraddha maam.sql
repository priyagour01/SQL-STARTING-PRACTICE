create database temp1;
use temp1;
create table student( rollno int primary key, name varchar(50));

select * from student;

insert into student (rollno, name) value 
(101, "Priya"),(102, "Sonu"),(103, "Pari"),(104, "Sayali");
insert into student (rollno, name) values(105, "Shyam");