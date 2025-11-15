create database School_data;
use School_data;
create table student_data(id int primary key, name varchar(50));
select * from student_data;
create table marks(id int, subject varchar(50), marks int);
insert into  student_data(id , name) values (1 , 'A'),(2 , 'B'), (3 , 'C'), (4 , 'D');

insert into marks (id, subject, marks) values(1, 'Math', 90), (2, 'Science', 85), (3, 'English', 80),
(5, 'History', 88);
select * from marks;

select student_data.id, student_data.name, marks.subject, marks.marks from student_data
inner join marks on student_data.id = marks.id;