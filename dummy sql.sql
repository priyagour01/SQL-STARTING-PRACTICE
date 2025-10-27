use dummy;
show tables;
select * from customers;
select * from customers where country = "France";
select * from customers where country = "France" and country = "USA";
select * from customers where country = "France" and creditlimit > 50000;
select * from customers where country = "France" or country = "USA";

select * from customers where country in ("USA","France","Australia");
select * from customers where country not in ("USA","France","Australia");


# order by # sequential manner

select * from customers order by customername;
select * from customers where country = "France" order by customername ;
select * from customers where creditlimit > 50000 and country = "Australia" order by creditlimit desc;

# limit and offset 
select * from customers limit 5;
select * from customers order by creditlimit desc;
select * from customers order by creditlimit desc limit 5;
select * from customers order by creditlimit desc limit 1 offset 2;
