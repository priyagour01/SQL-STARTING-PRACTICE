create database StudentDetail;
use StudentDetail;
show databases;
create table Students ( id int primary KEY, name varchar(50), age INT, course VARCHAR(50));
update Students set age = 23 where id = 1;
ALTER TABLE Students ADD email VARCHAR(100); 
ALTER TABLE Students MODIFY age INT;

# ye dono comand delete krta hai 
# ALTER TABLE Students DROP COLUMN email;
# DROP TABLE Students;

insert into Students (id, name, age, course, email) values (1, 'Priya', 22, 'MCA', 'priya@gmail.com');
select * from Students;