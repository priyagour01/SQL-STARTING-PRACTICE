create database Student;
use Student;
show databases;
use Student;
create table Stu(id int, name varchar(255), city char(255), cource char(255));
select * from Stu;
insert into Stu(id,name,city,cource)
values (1 ,"Priya","Indore","Python");
select * from Stu;


# UNIQUE
use cybrom;
show databases;
use cybrom;
select * from info;
create table info1(id int unique , name varchar(40));
# insert into info1(id,name) values (1,"AA"),(1,"BB");
insert into info1(id,name) values (1,"AA"),(2,"BB");
insert into info1(id,name) values (null,"CC");
insert into info1(id,name) values (null,"AA");
select * from info1;

#NOT NULL
create table info2(id int unique not null , name varchar(40) not null);
insert into info2(id,name) values (1,"AA"),(1,"BB");
insert into info2(id,name) values (1,"AA"),(1,"BB");
select * from info2;

#check table
create table info3(id int unique not null, name varchar(40),age int not null
check (age>18));
# insert into info3(id , name , age) values (1, "AA" , 14);
insert into info3(id , name , age) values (1, "AA" , 20);
select * from info3;

# 
create table info4(id int not null unique, name varchar(40) not null,
age int check (age>18), city varchar(40) not null default "Bhopal");

insert into info4 (id , name , age , city) values (1 , "AA" ,20);
# insert into info4 (id , name , age , city) values (1 , "AA" ,20,);
# insert into info4 (id , name , age , city) values (1 , "AA" ,20,"");
insert into info4 (id , name , age , city) values (2 , "AA" ,20,"Indore");

insert into info4(id , name, age) values (1 , "AA", 23);
select * from info4;


 



