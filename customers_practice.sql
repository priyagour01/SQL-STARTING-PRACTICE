use dummy;
select * from customers inner join orders
on customers.customernumber = orders.customernumber;

select c.customernumber , c.customername, c.city, o.status
from customers as c inner join orders o on 
c.customernumber =  o.customernumber;

select * from customers;
select * from orders;
select * from orderdetails;

select c.customername, c.country, c.creditlimit, o.status, od.quantityordered
from customers as c inner join orders as o on c.customernumber = 
o.customernumber inner join orderdetails as od on o.ordernumber 
= od.ordernumber;


select c.customername, c.country, c.creditlimit, o.status, (od.quantityordered
* od.priceeach) as total from customers as c inner join orders as o on c.customernumber = 
o.customernumber inner join orderdetails as od on o.ordernumber 
= od.ordernumber;

select c.customername, c.country, c.creditlimit, o.status, (od.quantityordered
* od.priceeach) as total from customers as c inner join orders as o on c.customernumber = 
o.customernumber inner join orderdetails as od on o.ordernumber 
= od.ordernumber order by total desc limit 1 offset 1;

select c.customername, c.country, c.creditlimit, o.status, (od.quantityordered
* od.priceeach) as total from customers as c inner join orders as o on c.customernumber = 
o.customernumber inner join orderdetails as od on o.ordernumber 
= od.ordernumber order by total desc limit 5;

# group by
select c.customername, c.country, c.creditlimit, o.status, sum(od.quantityordered
* od.priceeach) as total from customers as c inner join orders as o on c.customernumber = 
o.customernumber inner join orderdetails as od on o.ordernumber 
= od.ordernumber group by c.customername, c.country, c.creditlimit, o.status;
