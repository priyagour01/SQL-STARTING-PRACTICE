create database School;
use School;
create table Students ( student_id int primary key, name varchar(50), age int, course varchar(50));
desc Students;
INSERT INTO Students VALUES (1, 'Priya', 22, 'MCA','priya@gmail.com');
INSERT INTO Students VALUES (2, 'Sonu', 21, 'BCA','priya@gmail.com');
INSERT INTO Students VALUES (3, 'atika', 45, 'MCA', 'priya@gmail.com');
INSERT INTO Students VALUES (4, 'Soniya', 21, 'BCA','priya@gmail.com');
INSERT INTO Students VALUES (5, 'seeta', 22, 'MCA','priya@gmail.com');
INSERT INTO Students VALUES (6, 'srasti', 21, 'BCA','priya@gmail.com');
SELECT * FROM Students;
UPDATE Students SET age = 25 WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 2;
ALTER TABLE Students ADD email VARCHAR(100);
SELECT * FROM Students WHERE age > 20;
SELECT * FROM Students ORDER BY age DESC;
SELECT * FROM Students LIMIT 6;

UPDATE Students SET email = 'priyaaa@gmail.com' WHERE student_id = 1;

DELETE FROM Students WHERE student_id = 5;