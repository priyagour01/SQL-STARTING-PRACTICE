create database Employees_1;
use Employees_1;

CREATE TABLE Employees_1 ( emp_id int primary key, emp_name varchar(50),
Salary int, Dept varchar(30), Experience int );

insert into Employees_1 (emp_id, emp_name, Salary, Dept, Experience) values
(1, 'Alice', 60000, 'HR', 5),
(2, 'Bob', 85000, 'IT', 10),
(3, 'Charlie', 40000, 'Finance', 3),
(4, 'David', 75000, 'IT', 8),
(5, 'Emma', 30000, 'Finance', 2);
select * from  Employees_1;
select * ,
case when salary <= 30000 then "Low_salary" when salary between 31000 and 50000 then "medium_salary"
else "High_salary"  end as salary_devision from Employees_1;

# 2 
select *,
case WHEN Experience <= 3 then 'Beginner' when Experience between 4 and 7 then 'Intermediate'
else 'Expert' end as Performance_Level from Employees_1;

#3
select  emp_id, emp_name, Salary, Dept,
case when Dept = 'HR' then 'Human Resources' when Dept = 'IT' THEN 'Information Technology'
when Dept = 'Finance' then 'Financial Services' else Dept end as Full_Dept_Name
from Employees_1;

#4 
#select 800000 as Salary, '15%' as Bonus_Percentage, (800000 * 0.15) as Bonus_Amount;

select emp_id, emp_name, Salary,
case when Salary > 80000 then Salary * 0.15 when Salary between 50000 and 80000 then 
Salary * 0.10 else Salary * 0.05 end as Bonus from Employees_1;

#5
select emp_id, emp_name, Salary,
case when Salary < 40000 then 'Low Tax' when Salary between 40000 and 70000 then 'Medium Tax'
when Salary between 70001 and 100000 then 'High Tax' else 'Very High Tax'
end as Tax_Bracke from Employees_1;

#6
select emp_id, emp_name, Salary, Experience, 
case when Dept is null then 'Department Not Assigned'else Dept end as Department_Status from Employees_1;

#7
create table Students ( ID INT PRIMARY KEY, Name VARCHAR(50), Marks INT);
INSERT into Students (ID, Name, Marks) VALUES
(1, 'Alex', 90),
(2, 'Brian', 70),
(3, 'Chris', 45);
SELECT ID,Name,Marks,
CASE WHEN Marks >= 80 THEN 'Distinction' WHEN Marks BETWEEN 50 AND 79 THEN 'Pass'
ELSE 'Fail' END AS Result FROM Students;

#8
CREATE TABLE Users (
    User_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Status VARCHAR(20)
);
INSERT INTO Users (User_ID, Name, Status)
VALUES
(1, 'John', 'Active'),
(2, 'Mike', 'Suspended'),
(3, 'Emma', 'Inactive');
select User_ID, Name, Status,
case WHEN Status = 'Active' THEN 'Account in Good Standing' WHEN Status = 'Suspended' THEN 'Account Suspended – Contact Support'
WHEN Status = 'Inactive' THEN 'Account Not in Use' ELSE 'Unknown Status'
END AS Account_Status FROM Users;

#9
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer VARCHAR(50),
    Amount INT
);
insert into Orders (Order_ID, Customer, Amount) values
(1, 'John', 1200),
(2, 'Mike', 600),
(3, 'Emma', 400);
select Order_ID, Customer, Amount,
case when Amount > 1000 then '20% Discount' when Amount between 500 and 1000 then '10% Discount'
else '5% Discount' end as Discount_Category from Orders;

#10
CREATE TABLE Shipments (
    Shipment_ID INT PRIMARY KEY,
    Customer VARCHAR(50),
    Expected_Date DATE,
    Delivery_Date DATE
);
INSERT INTO Shipments (Shipment_ID, Customer, Expected_Date, Delivery_Date)
VALUES
(1, 'John', '2025-11-05', '2025-11-04'),   -- Delivered early
(2, 'Mike', '2025-11-06', '2025-11-08'),   -- Delivered late
(3, 'Emma', '2025-11-07', '2025-11-07');   -- Delivered on time

SELECT Shipment_ID, Customer, Expected_Date, Delivery_Date,
CASE WHEN Delivery_Date > Expected_Date THEN 'Late Delivery' WHEN Delivery_Date = Expected_Date 
THEN 'On Time' ELSE 'Early Delivery' END AS Delivery_Status FROM Shipments;

#11
CREATE TABLE Loans (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Income INT,
    CreditScore INT
);
INSERT INTO Loans (Customer_ID, Customer_Name, Income, CreditScore)
VALUES
(1, 'John', 70000, 780),
(2, 'Mike', 50000, 700),
(3, 'Emma', 30000, 620),
(4, 'Sophia', 65000, 730);
SELECT Customer_ID, Customer_Name, Income, CreditScore,
CASE WHEN Income >= 60000 AND CreditScore >= 750 THEN 'Eligible' WHEN (Income BETWEEN 40000 AND 59999) OR 
(CreditScore BETWEEN 650 AND 749) THEN 'Conditionally Eligible' ELSE 'Not Eligible'
END AS Loan_Status FROM Loans;

#12
CREATE TABLE People (
    Person_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
INSERT INTO People (Person_ID, Name, Age)
VALUES
(1, 'John', 16),
(2, 'Mike', 25),
(3, 'Emma', 45),
(4, 'Sophia', 65),
(5, 'Chris', 35);
SELECT Person_ID, Name, Age,
CASE WHEN Age < 18 THEN 'Minor' WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult'
WHEN Age BETWEEN 36 AND 60 THEN 'Adult' ELSE 'Senior Citizen' END AS Age_Group FROM People;

#12
CREATE TABLE Employees_Default (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Dept VARCHAR(50),
    Salary INT
);
INSERT INTO Employees_Default (Emp_ID, Emp_Name, Dept, Salary)
VALUES
(1, 'John', 'HR', 50000),
(2, 'Mike', NULL, 60000),
(3, 'Emma', 'Finance', NULL),
(4, 'Sophia', NULL, NULL);
SELECT Emp_ID, Emp_Name,
CASE WHEN Dept IS NULL THEN 'Department Not Assigned'  ELSE Dept END AS Department_Status,
CASE WHEN Salary IS NULL THEN 30000  ELSE Salary  END AS Updated_Salary FROM Employees_Default;

#13
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price INT
);
INSERT INTO Products (Product_ID, Product_Name, Price)
VALUES
(1, 'Mobile Cover', 300),
(2, 'Headphones', 1200),
(3, 'Smart Watch', 2500),
(4, 'Laptop', 4500),
(5, 'Charger', 600);
SELECT Product_ID, Product_Name, Price,
CASE WHEN Price < 500 THEN 'Budget' WHEN Price BETWEEN 500 AND 1500 THEN 'Standard'
WHEN Price BETWEEN 1501 AND 3000 THEN 'Premium' ELSE 'Luxury'
END AS Product_Category FROM Products;

#15
CREATE TABLE Employee_Overtime (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Salary INT,
    Overtime_Hours INT
);
INSERT INTO Employee_Overtime (Emp_ID, Emp_Name, Salary, Overtime_Hours)
VALUES
(1, 'John', 40000, 3),
(2, 'Mike', 50000, 8),
(3, 'Emma', 60000, 12),
(4, 'Sophia', 35000, 0);
SELECT Emp_ID, Emp_Name, Salary, Overtime_Hours,
CASE WHEN Overtime_Hours BETWEEN 1 AND 5 THEN Overtime_Hours * 200 WHEN Overtime_Hours
BETWEEN 6 AND 10 THEN Overtime_Hours * 300 WHEN Overtime_Hours > 10 THEN Overtime_Hours * 400 ELSE 0
END AS Overtime_Pay, Salary + 
CASE WHEN Overtime_Hours BETWEEN 1 AND 5 THEN Overtime_Hours * 200
WHEN Overtime_Hours BETWEEN 6 AND 10 THEN Overtime_Hours * 300
WHEN Overtime_Hours > 10 THEN Overtime_Hours * 400 ELSE 0 END AS Total_Salary
FROM Employee_Overtime;
SELECT 
    Emp_ID,
    Emp_Name,
    Salary,
    Overtime_Hours,
    CASE
        WHEN Overtime_Hours BETWEEN 1 AND 5 THEN Overtime_Hours * 200
        WHEN Overtime_Hours BETWEEN 6 AND 10 THEN Overtime_Hours * 300
        WHEN Overtime_Hours > 10 THEN Overtime_Hours * 400
        ELSE 0
    END AS Overtime_Pay,
    Salary + 
    CASE
        WHEN Overtime_Hours BETWEEN 1 AND 5 THEN Overtime_Hours * 200
        WHEN Overtime_Hours BETWEEN 6 AND 10 THEN Overtime_Hours * 300
        WHEN Overtime_Hours > 10 THEN Overtime_Hours * 400
        ELSE 0
    END AS Total_Salary
FROM Employee_Overtime;

#16
CREATE TABLE Memberships (
    Member_ID INT PRIMARY KEY,
    Member_Name VARCHAR(50),
    Join_Date DATE,
    Expiry_Date DATE
);
INSERT INTO Memberships (Member_ID, Member_Name, Join_Date, Expiry_Date)
VALUES
(1, 'John', '2024-11-01', '2025-11-01'),
(2, 'Mike', '2024-01-01', '2024-10-01'),
(3, 'Emma', '2025-01-15', '2025-12-31'),
(4, 'Sophia', '2023-05-10', '2024-05-10');
SELECT  Member_ID, Member_Name, Join_Date, Expiry_Date,
CASE WHEN Expiry_Date < CURDATE() THEN 'Expired' ELSE 'Active'
END AS Membership_Status FROM Memberships;

#17
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Total_Spending DECIMAL(10,2)
);
INSERT INTO Customers (Customer_ID, Customer_Name, Total_Spending)
VALUES
(1, 'John', 1500.00),
(2, 'Mike', 700.00),
(3, 'Emma', 300.00),
(4, 'Sophia', 2500.00),
(5, 'David', 100.00);
SELECT Customer_ID, Customer_Name, Total_Spending,
CASE WHEN Total_Spending >= 2000 THEN 'Premium Customer'
WHEN Total_Spending BETWEEN 1000 AND 1999 THEN 'Regular Customer'
WHEN Total_Spending BETWEEN 500 AND 999 THEN 'Occasional Customer' ELSE 'Low Spender'
END AS Spending_Category FROM Customers;

#18
CREATE TABLE Transactions (
    Transaction_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Amount DECIMAL(10,2),
    Country VARCHAR(50),
    Payment_Method VARCHAR(30)
);
INSERT INTO Transactions (Transaction_ID, Customer_Name, Amount, Country, Payment_Method)
VALUES
(1, 'John', 500.00, 'USA', 'Credit Card'),
(2, 'Mike', 12000.00, 'India', 'Credit Card'),
(3, 'Emma', 150.00, 'UK', 'PayPal'),
(4, 'Sophia', 25000.00, 'Nigeria', 'Wire Transfer'),
(5, 'David', 80.00, 'India', 'Debit Card');
SELECT Transaction_ID, Customer_Name, Amount, Country, Payment_Method,
CASE WHEN Amount > 10000 THEN 'Potential Fraud - High Amount'
WHEN Country = 'Nigeria' THEN 'Potential Fraud - Suspicious Country'
WHEN Payment_Method = 'Wire Transfer' AND Amount > 5000 THEN 'Potential Fraud - Wire Transfer'
ELSE 'Legitimate Transaction' END AS Fraud_Status FROM Transactions;

#19
CREATE TABLE Insurance (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Age INT,
    Vehicle_Type VARCHAR(30),
    Base_Premium DECIMAL(10,2)
);
INSERT INTO Insurance (Customer_ID, Customer_Name, Age, Vehicle_Type, Base_Premium)
VALUES
(1, 'John', 25, 'Car', 5000.00),
(2, 'Mike', 40, 'Bike', 3000.00),
(3, 'Emma', 60, 'Car', 6000.00),
(4, 'Sophia', 30, 'SUV', 8000.00),
(5, 'David', 55, 'Bike', 3500.00);
SELECT Customer_ID, Customer_Name, Age, Vehicle_Type, Base_Premium,
CASE WHEN Age < 30 AND Vehicle_Type = 'Car' THEN Base_Premium * 1.2     -- young drivers pay 20% more
WHEN Age BETWEEN 30 AND 50 AND Vehicle_Type = 'Bike' THEN Base_Premium * 1.1  -- mid-age bikers pay 10% more
WHEN Age > 50 THEN Base_Premium * 1.3     -- older people pay 30% more
ELSE Base_Premium                         -- others pay normal
END AS Final_Premium FROM Insurance;

#20
CREATE TABLE Users_Roles (
    User_ID INT PRIMARY KEY,
    User_Name VARCHAR(50),
    Access_Level INT
);
INSERT INTO Users_Roles (User_ID, User_Name, Access_Level)
VALUES
(1, 'John', 1),
(2, 'Mike', 2),
(3, 'Emma', 3),
(4, 'Sophia', 4),
(5, 'David', 5);
SELECT User_ID, User_Name, Access_Level,
CASE WHEN Access_Level = 1 THEN 'Guest User'
WHEN Access_Level = 2 THEN 'Registered User'
WHEN Access_Level = 3 THEN 'Moderator'
WHEN Access_Level = 4 THEN 'Administrator'
WHEN Access_Level >= 5 THEN 'Super Admin' ELSE 'Unknown Role' 
END AS User_Role FROM Users_Roles;












