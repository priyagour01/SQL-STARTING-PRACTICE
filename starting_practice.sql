create database window_function;
use window_function;
CREATE TABLE IF NOT EXISTS sales1(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);
 
INSERT INTO sales1(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);
select * from sales1;   

select * ,
sum(sale) over(partition by sales_employee) as emp_part 
from sales1;   

select * ,
sum(sale) over(partition by fiscal_year) as emp_part from sales1;

select * ,
sum(sale) over(partition by fiscal_year order by sale desc)
 as year_part from sales1;

# 1 rank, dense , lead, lag, row number
#1 rank: it works on row basi
select * ,
rank() over(partition by fiscal_year order by sale desc)
 as rnk from sales1;

#dense : it work on actual ranking based alloocation
select * ,
dense_rank() over(partition by fiscal_year order by sale desc)
as rnk from sales1;

#lead:  it compare the current row to the next rows
select * ,
lead(sale) over (partition by fiscal_year order by sale desc) 
as lead_sale from sales1; 

#lag: current wali ko previas ke sath convert krega
select * ,
lag(sale) over (partition by fiscal_year order by sale desc) 
as lag_sale from sales1; 

#Row number: sequencial or serial number assign krega starting num 1,2,3......
select * ,
row_number() over (partition by fiscal_year order by sale desc) 
as lag_sale from sales1; 


# All
select *,
sum(sale) over(partition by fiscal_year order by sale desc) sum_sale,
max(sale) over(partition by fiscal_year order by sale desc) max_sale,
min(sale) over(partition by fiscal_year order by sale desc) min_sale,
avg(sale) over(partition by fiscal_year order by sale desc) avg_sale,
rank() over(partition by fiscal_year order by sale desc) as rnk,
dense_rank() over(partition by fiscal_year order by sale desc) as drnk,
lead(sale) over(partition by fiscal_year order by sale desc) as lead_sale,
lag(sale) over(partition by fiscal_year order by sale desc) as lag_sale,
row_number() over(partition by fiscal_year order by sale desc) as rownumber
from sales1;

CREATE TABLE saless_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sales_rep VARCHAR(50),
    region VARCHAR(50),
    product VARCHAR(50),
    month VARCHAR(20),
    sales_amount DECIMAL(10,2)
);

INSERT INTO saless_data (sales_rep, region, product, month, sales_amount) VALUES
('Alice', 'North', 'Laptop', 'Jan', 1200.00),
('Bob', 'South', 'Tablet', 'Jan', 800.00),
('Charlie', 'East', 'Laptop', 'Jan', 950.00),
('David', 'West', 'Phone', 'Jan', 600.00),
('Eva', 'North', 'Tablet', 'Feb', 1100.00),
('Alice', 'North', 'Laptop', 'Feb', 1300.00),
('Bob', 'South', 'Tablet', 'Feb', 850.00),
('Charlie', 'East', 'Laptop', 'Feb', 1000.00),
('David', 'West', 'Phone', 'Feb', 700.00),
('Eva', 'North', 'Tablet', 'Mar', 1200.00),
('Alice', 'North', 'Laptop', 'Mar', 1250.00),
('Bob', 'South', 'Tablet', 'Mar', 900.00),
('Charlie', 'East', 'Laptop', 'Mar', 1050.00),
('David', 'West', 'Phone', 'Mar', 650.00),
('Eva', 'North', 'Tablet', 'Apr', 1150.00),
('Alice', 'North', 'Laptop', 'Apr', 1400.00),
('Bob', 'South', 'Tablet', 'Apr', 950.00),
('Charlie', 'East', 'Laptop', 'Apr', 1100.00),
('David', 'West', 'Phone', 'Apr', 800.00),
('Eva', 'North', 'Tablet', 'May', 1180.00),
('Alice', 'North', 'Laptop', 'May', 1350.00);
select * from saless_data;

#1
select month, sales_rep,
SUM(sales_amount) as total_sales,
rank() over (partition by month order by SUM(sales_amount) desc) as sales_rank
from saless_data group by month, sales_rep
order by month, sales_rank;

#2
SELECT sales_rep, month, sales_amount,
SUM(sales_amount) OVER ( PARTITION BY sales_rep ORDER BY CASE month
		        WHEN 'Jan' THEN 1
                WHEN 'Feb' THEN 2
                WHEN 'Mar' THEN 3
                WHEN 'Apr' THEN 4
                WHEN 'May' THEN 5
                WHEN 'Jun' THEN 6
                WHEN 'Jul' THEN 7
                WHEN 'Aug' THEN 8
                WHEN 'Sep' THEN 9
                WHEN 'Oct' THEN 10
                WHEN 'Nov' THEN 11
                WHEN 'Dec' THEN 12 END ) AS running_total FROM saless_data ORDER BY sales_rep, 
CASE month
        WHEN 'Jan' THEN 1
        WHEN 'Feb' THEN 2
        WHEN 'Mar' THEN 3
        WHEN 'Apr' THEN 4
        WHEN 'May' THEN 5
        WHEN 'Jun' THEN 6
        WHEN 'Jul' THEN 7
        WHEN 'Aug' THEN 8
        WHEN 'Sep' THEN 9
        WHEN 'Oct' THEN 10
        WHEN 'Nov' THEN 11
        WHEN 'Dec' THEN 12 END;

#3
select region, sales_rep, month, sales_amount, 
AVG(sales_amount) OVER ( partition by  region ) as avg_region_sales from saless_data
order by region, sales_rep, month;



#4
select sales_rep, month, sales_amount,
lag(sales_amount) over ( partition by sales_rep order by month ) AS previous_month_sales,
sales_amount - lag(sales_amount) over ( partition by sales_rep order by month ) as sales_difference from saless_data
order by sales_rep, month;

#select * ,
#lag(sales_amount) over (partition by sales_rep) as lag_division from school_data;

#5
#SELECT sales_rep, month, sales_amount,
SELECT sales_rep,
#lead(sales_amount) over ( partition by sales_rep order by month ) AS next_month_sales from sales_data;
lead(sales_amount) over ( partition by sales_rep ) as lead_division from sales_data;

#6
SELECT sales_rep, region, month, sales_amount,
ROUND( (sales_amount * 100.0) / SUM(sales_amount) OVER (PARTITION BY region),2 ) AS percentage_contribution
FROM sales_data;

#6
SELECT sales_rep, region, month, sales_amount,
SUM(sales_amount) OVER (PARTITION BY region) AS total_region_sales,
ROUND( (sales_amount * 100.0) / SUM(sales_amount) OVER (PARTITION BY region), 2 ) AS percentage_contribution
FROM sales_data;

#7
SELECT sales_rep, month, sales_amount,
MAX(sales_amount) OVER ( PARTITION BY sales_rep ) AS highest_monthly_sale FROM sales_data;

#8
#select sales_rep, month, sales_amount,
select *,
lag(sales_amount) over ( partition by sales_rep order by month) as lag_amount,
case when lag(sales_amount) over (partition by sales_rep order by month)
> sales_amount then "increased"
when lag (sales_amount) over (partition by sales_rep order by month) < sales_amount
then "decreased" else "not_changed"  end as lag_devision 
from sales_data;


#9
select sales_rep, region, month, sales_amount,
row_number() over ( partition by region, month order by  sales_amount desc ) as row_number_in_region
from sales_data;

#10
#select sales_rep, region, month, sales_amount,
select *,
avg(sales_amount) over ( partition by  region, month ) as avg_sales_in_region, sales_amount - avg(sales_amount) over (
partition by region, month ) as diff_from_avg from sales_data;







        
