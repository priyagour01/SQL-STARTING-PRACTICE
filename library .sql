create database library;
use library;
show databases;
create table Books(book_id INT PRIMARY KEY AUTO_INCREMENT,  -- unique ID
    title VARCHAR(255) NOT NULL,             -- book ka naam
    author VARCHAR(255),                     -- author ka naam
    publisher VARCHAR(255),                  -- publisher
    year_published YEAR,                     -- publishing year
    total_copies INT DEFAULT 0,              -- total copies
    available_copies INT DEFAULT 0           -- available copies
);

CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    contact_number VARCHAR(15),
    join_date DATE NOT NULL DEFAULT (CURDATE())
);

CREATE TABLE BorrowRecords (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE NOT NULL DEFAULT (CURDATE()),
    due_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

select * from Books;
select * from Books WHERE available_copies > 0;
insert into Members (name, email, contact_number) values ('Priya Gour', 'priya@example.com', '9876543210');
SELECT * FROM Books;
INSERT INTO Books (title, author, publisher, year_published, total_copies, available_copies)
VALUES ('Harry Potter', 'J.K. Rowling', 'Bloomsbury', 2001, 10, 10);
INSERT INTO BorrowRecords (member_id, book_id, borrow_date, due_date)
VALUES (1, 1, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM BorrowRecords;



use dummy;
select * from customers;
select * from customers order by creditlimit desc limit 5 offset 2;




