#Subquery
use dummy;

select * from employees e join offices o on e.officecode = o.officecode where country = "USA";

select firstname, lastname from employees where officecode in (select officecode from officeS
where country = "USA");

select * from customers;
select * from orders;

select customerNumber, customerName, creditLimit
from customers
where creditLimit > ( select avg(creditLimit) from customers);

#2
select customerName from customers
where creditLimit = ( select MAX(creditLimit) from customers );

#3
select customerName from customers
where customerNumber in ( select customerNumber from orders );

#4
select customerName from customers
where customerNumber not in (select customerNumber from payments );

#5
select customerName from customers
where creditLimit > any ( select creditLimit from customers where country = 'New York');

select customerName from customers
where creditLimit > any ( select creditLimit from customers where country = 'USA');

select customerName from customers
where creditLimit > any ( select max(creditLimit) from customers where country = 'USA');




 



