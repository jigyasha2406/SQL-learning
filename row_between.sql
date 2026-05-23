create database window2;
use window2;
drop database window2;
CREATE TABLE employees_sales (
sale_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
sale_date DATE,
sales_amount INT
);
INSERT INTO employees_sales VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 500),
(2, 'Amit', 'Electronics', '2026-01-03', 700),
(3, 'Amit', 'Electronics', '2026-01-05', 600),
(4, 'Neha', 'Electronics', '2026-01-02', 800),
(5, 'Neha', 'Electronics', '2026-01-04', 900),
(6, 'Neha', 'Electronics', '2026-01-06', 750),
(7, 'Raj', 'Furniture', '2026-01-01', 300),
(8, 'Raj', 'Furniture', '2026-01-03', 450),
(9, 'Raj', 'Furniture', '2026-01-05', 500),
(10, 'Simran', 'Furniture', '2026-01-02', 400),
(11, 'Simran', 'Furniture', '2026-01-04', 550),
(12, 'Simran', 'Furniture', '2026-01-06', 650),
(13, 'Vikas', 'Clothing', '2026-01-01', 200),
(14, 'Vikas', 'Clothing', '2026-01-03', 250),
(15, 'Vikas', 'Clothing', '2026-01-05', 300),
(16, 'Priya', 'Clothing', '2026-01-02', 350),
(17, 'Priya', 'Clothing', '2026-01-04', 400),
(18, 'Priya', 'Clothing', '2026-01-06', 450),
(19, 'Karan', 'Electronics', '2026-01-07', 1000),
(20, 'Karan', 'Electronics', '2026-01-08', 1200);

CREATE TABLE employee_attendance (
attendance_id INT,
employee_name VARCHAR(50),
department VARCHAR(50),
attendance_date DATE,
hours_worked INT
);

INSERT INTO employee_attendance VALUES
(1, 'Amit', 'Electronics', '2026-01-01', 8),
(2, 'Amit', 'Electronics', '2026-01-02', 9),
(3, 'Amit', 'Electronics', '2026-01-03', 7),
(4, 'Neha', 'Electronics', '2026-01-01', 8),
(5, 'Neha', 'Electronics', '2026-01-02', 10),
(6, 'Neha', 'Electronics', '2026-01-03', 9),
(7, 'Raj', 'Furniture', '2026-01-01', 6),
(8, 'Raj', 'Furniture', '2026-01-02', 7),
(9, 'Raj', 'Furniture', '2026-01-03', 8),
(10, 'Simran', 'Furniture', '2026-01-01', 9),
(11, 'Simran', 'Furniture', '2026-01-02', 8),
(12, 'Simran', 'Furniture', '2026-01-03', 10),
(13, 'Vikas', 'Clothing', '2026-01-01', 5),
(14, 'Vikas', 'Clothing', '2026-01-02', 6),
(15, 'Vikas', 'Clothing', '2026-01-03', 7),
(16, 'Priya', 'Clothing', '2026-01-01', 8),
(17, 'Priya', 'Clothing', '2026-01-02', 8),
(18, 'Priya', 'Clothing', '2026-01-03', 9),
(19, 'Karan', 'Electronics', '2026-01-01', 10),
(20, 'Karan', 'Electronics', '2026-01-02', 11);


create database rjdb;

use rjdb;

CREATE TABLE sales (
    id INT,
    sale_date DATE,
    amount INT
);


INSERT INTO sales VALUES
(1, '2026-01-01', 100),
(2, '2026-01-02', 200),
(3, '2026-01-03', 300),
(4, '2026-01-04', 400),
(5, '2026-01-05', 500);

select * from sales;
-- lag- lag is a analytical function which gives one above row from the cureent row
select * ,lag(sale_date,1) over() from sales;
-- lead- lead is a analytical function which gives one below from the current row
select * ,lead(sale_date,1) over() from sales;
select *,lead(sale_date,2) over() from sales;

select *,lead(sale_date,1,0) over(order by amount desc) from sales;

-- row_between - row betweeen is a clause which is used to specify the range of the rows
select *,sum(amount)over( rows between unbounded preceding and current row) from sales;-- unbounded preceding means the first row.
select *,sum(amount)over( rows between 1 preceding and current row) from sales;-- n preceding we can define any number in it.
select *,sum(amount) over(rows between unbounded preceding and 1 following) from sales;-- if we want the sum from the first row till the next row from the current row
-- current row=current row
-- unbound following-last row
-- whenever we have to find the cummulative sum so will use thw row betweeen 
-- -- calculate the sum of current row and the second row
select *,sum(amount)over( rows between current row and 1 following) from sales;
select *,sum(amount)over( order by sale_date rows between current row and 1 following) from sales;-- works same
select *,sum(amount)over( rows between current row and 1 following) from sales;
select * from employees_sales;
select * from employee_attendance;
-- Find total sales by each department.
select *,sum(sales_amount) over(partition by department) from employees_sales;
-- Find average sales per employee.
select *,avg(sales_amount) over(partition by employee_name) from employees_sales;

-- Rank employees by sales within each department.
select employee_name,department,sales_amount,rank () over(partition by department order by sales_amount desc) from employees_sales;

-- Find previous sale amount for each employee.
select *,lag(sales_amount,1) over(partition by employee_name order by sale_date) from employees_sales;
-- Find next sale amount for each employee.
select *,lead(sales_amount,1) over(partition by employee_name order by sale_date) from employees_sales;

-- Calculate running total using ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.
select *,sum(sales_amount) over(partition by employee_name order by sale_date rows between unbounded preceding and current row) from employees_sales;
-- Calculate moving average of current row and previous row.
select *,avg(sales_amount) over(partition by employee_name order by sale_date rows between 1 preceding and current row) from employees_sales;
-- Calculate sum of current row and next row.
select *,avg(sales_amount) over(partition by employee_name order by sale_date rows between current row and 1 following) from employees_sales;
-- Calculate 3-row moving total.
select *,sum(sales_amount) over(partition by employee_name order by sale_date rows between 1 preceding and 1 following ) from employees_sales;
-- Find cumulative hours worked for each employee.
select * From employee_attendance;
select *,sum(hours_worked) over(partition by employee_name order by attendance_date rows between unbounded preceding and current row) from employee_attendance;
-- Find maximum sales within each department.
select * from employees_sales;
select * from
(select *,rank() over(partition by department order by sales_amount desc) as ranking from employees_sales) as t
where ranking=1;
select *,max(sales_amount) over(partition by department) from employees_sales;
-- Assign row numbers within each department.
select *,row_number() over(partition by department) from employees_sales;
-- Find difference between current sale and previous sale.
select sales_amount-lag(sales_amount) over(partition by employee_name order by sale_date) from employees_sales;


SELECT employee_name, sales_amount,
       NTILE(4) OVER(ORDER BY sales_amount DESC) AS bucket
FROM employees_sales;
