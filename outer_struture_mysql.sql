create database cybrom;
use cybrom;
show databases;
use cybrom;
create table info(id int , name varchar(255), city char(255), salary decimal(5,2), curr_date date );
select * from info;
insert into info (id, name, city, salary, curr_date)
values(1, "Priya", "Bhopal", 200, "2025-10-07"),(2, "Atika", "Nagpur", 400, "2025-10-07");
select * from info;