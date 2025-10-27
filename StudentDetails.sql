create database StudentDetail;
use StudentDetail;
show databases;
create table Students ( id int primary KEY, name varchar(50), age INT, course VARCHAR(50));
ALTER TABLE Students ADD email VARCHAR(100);
ALTER TABLE Students MODIFY age INT;
ALTER TABLE Students DROP COLUMN email;
DROP TABLE Students;