# Starting practice
# ye DDL (Data Definition Language)type 1, create hai isme hum 
# database ka stucture create krte hai
create database Shopdb;
use Shopdb;
create table product(p_id int primary key, p_name varchar(100), price decimal(10,2));
#Existing table me column add/delete/modify karta hai
alter table product add category varchar(50);
select * from product;
alter table product modify price int;
#DROP :Table ya object delete karta hai (data ke sath) commands: DROP TABLE student;
#TRUNCATE: Table ke andar ka saara data delete karta hai (structure bacha rehta ha) commands:TRUNCATE TABLE student;

# type 2,DML (Data Manipulation Language) 
#INSERT: table me new record
insert into product values(1, 'Laptop', 55000, 'Electronics'),
(2, 'Mobile', 25000, 'Electronics'),
(3, 'Keyboard', 5000, 'Accessories'),
(4, 'TV', 550000, 'Electronics'),
(5, 'Tablet', 56000, 'Electronics');

# update 
update product set price = 23000.00 where p_id = 2;
set sql_safe_updates = 0;


