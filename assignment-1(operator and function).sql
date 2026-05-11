CREATE TABLE employees (
emp_id INT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL,
department VARCHAR(50),
job_title VARCHAR(60),
salary DECIMAL(10,2),
hire_date DATE,
birth_date DATE,
phone VARCHAR(20),
city VARCHAR(50),
country VARCHAR(50),
is_active CHAR(1)
);

INSERT INTO employees VALUES
(1,  'Alice',  'Smith',    'alice.smith@gmail.com', 'IT',        'Software Engineer',    85000.00,'2019-03-15','1990-06-20','555-1001','New York',     'USA','Y'),
(2,  'Bob',    'Johnson',  'bob.j@yahoo.com',       'HR',        'HR Manager',           72000.00,'2020-07-01','1985-11-05','555-1002','Chicago',      'USA','Y'),
(3,  'Carol',  'Williams', 'carol.w@gmail.com',     'Finance',   'Accountant',           65000.00,'2018-01-10','1992-03-14','555-1003','Houston',      'USA','Y'),
(4,  'David',  'Brown',    'david.b@outlook.com',   'IT',        'DevOps Engineer',      90000.00,'2021-05-20','1988-09-25','555-1004','Los Angeles',  'USA','Y'),
(5,  'Emma',   'Jones',    'emma.j@gmail.com',      'Marketing', 'Marketing Lead',       78000.00,'2017-11-30','1991-07-08','555-1005','Phoenix',      'USA','Y'),
(6,  'Frank',  'Garcia',   'frank.g@yahoo.com',     'Sales',     'Sales Representative', 55000.00,'2022-02-14','1994-02-28','555-1006','Philadelphia', 'USA','N'),
(7,  'Grace',  'Martinez', 'grace.m@gmail.com',     'IT',        'QA Engineer',          68000.00,'2020-09-01','1993-12-01','555-1007','San Antonio',  'USA','Y'),
(8,  'Henry',  'Davis',    'henry.d@outlook.com',   'Finance',   'Financial Analyst',    76000.00,'2019-06-15','1989-04-17','555-1008','San Diego',    'USA','Y'),
(9,  'Isla',   'Wilson',   'isla.w@gmail.com',      'HR',        'Recruiter',            60000.00,'2021-10-05','1995-08-22','555-1009','Dallas',       'USA','Y'),
(10, 'Jack',   'Moore',    'jack.m@yahoo.com',      'Marketing', 'SEO Specialist',       58000.00,'2023-01-09','1997-01-15','555-1010','San Jose',     'USA','Y'),
(11, 'Karen',  'Taylor',   'karen.t@gmail.com',     'Sales',     'Sales Manager',        82000.00,'2016-04-20','1984-05-30','555-1011','Austin',       'USA','Y'),
(12, 'Liam',   'Anderson', 'liam.a@outlook.com',    'IT',        'Data Scientist',       95000.00,'2020-11-15','1987-10-10','555-1012','Jacksonville', 'USA','Y'),
(13, 'Mia',    'Thomas',   'mia.t@gmail.com',       'Finance',   'Tax Consultant',       71000.00,'2022-06-01','1993-06-15','555-1013','Columbus',     'USA','Y'),
(14, 'Noah',   'Jackson',  'noah.j@yahoo.com',      'IT',        'System Admin',         80000.00,'2018-08-25','1990-02-14','555-1014','Charlotte',    'USA','N'),
(15, 'Olivia', 'White',    'olivia.w@gmail.com',    'HR',        'HR Assistant',         50000.00,'2023-03-20','1998-09-05','555-1015','Indianapolis', 'USA','Y'),
(16, 'Paul',   'Harris',   'paul.h@outlook.com',    'Marketing', 'Content Writer',       52000.00,'2021-07-10','1996-11-20','555-1016','San Francisco','USA','Y'),
(17, 'Quinn',  'Clark',    'quinn.c@gmail.com',     'Sales',     'Sales Representative', 56000.00,'2022-09-15','1995-04-11','555-1017','Seattle',      'USA','Y'),
(18, 'Rachel', 'Lewis',    'rachel.l@yahoo.com',    'Finance',   'Budget Analyst',       73000.00,'2019-12-01','1991-01-30','555-1018','Denver',       'USA','Y'),
(19, 'Sam',    'Robinson', 'sam.r@gmail.com',       'IT',        'Cloud Architect',     105000.00,'2017-05-22','1986-07-19','555-1019','Nashville',    'USA','Y'),
(20, 'Tina',   'Walker',   'tina.w@outlook.com',    'HR',        'Training Manager',     69000.00,'2020-03-08','1988-12-03','555-1020','Baltimore',    'USA','Y'),
(21, 'Uma',    'Hall',     'uma.h@gmail.com',       'Marketing', 'Brand Manager',        77000.00,'2018-10-17','1990-08-25','555-1021','Louisville',   'USA','N'),
(22, 'Victor', 'Young',    'victor.y@yahoo.com',    'Sales',     'Sales Director',       98000.00,'2015-02-10','1980-03-07','555-1022','Portland',     'USA','Y');
-- Find employees with salary between 65,000 and 85,000
select first_name , emp_id ,salary from employees
where salary between 65000 and 85000;
-- List employees in the IT or Finance department
select first_name,department from employees where 
department in ("finance","it");
-- Find employees whose last name ends with &#39;son&#39; 

-- Find active employees (is_active = &#39;Y&#39;) in the IT department
select first_name,department,is_active from employees
where department="it" and is_active="y";

-- Display first_name in UPPERCASE and last_name in lowercase for Finance employees
select upper(first_name),lower(last_name) from employees
where department="finance";

-- Find employees whose first name has more than 4 characters
select first_name from employees
where first_name like "____%";
-- Show full name and its character length for Marketing employees

SELECT emp_id, CONCAT(first_name, ' ', last_name),
char_length(CONCAT(first_name, ' ', last_name)),department
FROM employees
WHERE department = 'Marketing';
-- Display hire year and years-ago for each Finance employee
select emp_id , first_name,hire_date,year(hire_date),2026-year(hire_date) 
from employees
where department="finance";
-- Show each IT employee&#39;s salary rounded to nearest 10,000 and its remainder
select first_name , salary , round(salary,-4),mod(salary,10000)
from employees
where department="it";
-- Find employees using an Outlook email address
select emp_id, first_name, last_name, email
from employees
where email like '%@outlook.com';
-- Find employees hired more than 2,000 days ago (from April 28,2006)
SELECT emp_id, first_name, last_name, hire_date,
DATEDIFF('2026-04-28', hire_date)
FROM employees
WHERE DATEDIFF('2026-04-28', hire_date) > 2000
order by DATEDIFF('2026-04-28', hire_date) desc;
-- Extract the email username (part before &#39;@&#39;) for all HR
select email,substr(email,1,instr(email,'@')-1) from employees;
-- Find non-IT/Finance employees with salary outside the 60,000–80,000 range
SELECT CONCAT(first_name, ' ', last_name) AS full_name,
department, salary
FROM employees
WHERE department NOT IN ('IT', 'Finance')
AND salary NOT BETWEEN 60000 AND 80000
ORDER BY salary DESC;
-- Extract and uppercase the email username; show only those with username length &gt; 6 characters

-- order by is used to sort the data by default its in ascending order an
select * from employees
order by salary desc;

select first_name,department,salary from employees
order by department,salary;

select salary,hire_date,year(hire_date) from employees
order by year(hire_date),salary desc;
-- scalar function are the function which are applied on each row
-- multirow function - applied to mulyiple row -> gives one output also known as aggregate function
-- distinct gives unique values
select distinct department from employees;
select distinct department,salary from employees;


-- calculations on you data =>aggregate function
select count(department) from employees;
select * from address;
select count(district),count(address_id),count(address2) from address;
-- if you are apllyling aggreagte function then you can not directly access any column
select * from employees;
select count(department),count(distinct department) from employees;

select sum(salary),count(salary),avg(salary),max(salary) from employees;

select sum(salary) from employees where department ="finance";
-- group by is a ststement which is used to group similar values together so that we can performthe calculation on that group 
-- eg- department(IT,FINANCE)
select department from employees group by department;
-- we will only apply group by when their are similar kind of data ,we will not apply group by on distinct data
-- distinct will give you uniques values but group by will group the data
select department,count(department),sum(salary) from employees group by department;
select * from employees;
select sum(salary) from employees group by department;
select sum(Salary) from employees
group by department
order by sum(salary);
select job_title,sum(salary) from employees group by job_title;
select * from payment;
-- from this payment table find the total amount and the average amount

select sum(amount), avg(amount) from payment;
-- from this payment table find the number of transaction done bt customer id 1
select count(amount) from payment where customer_id=1;
select count(customer_id) from payment where customer_id=1;
-- find the total tranction done by customer 2 or customer id 5
select count(amount) from payment where customer_id=5 or customer_id=2;
select count(customer_id) from payment where customer_id=2 or customer_id=5;
-- find the average amount spend in the year 2005
select avg(amount) from payment
where year(payment_date) = 2005;

--
select count(amount), sum(amount),avg(amount) from payment where year(payment_date)=2005;
-- find the total tranction done by each customer id

-- find the total transaction and th total the amonut spend after the customer id 3
select count(amount),sum(amount) from payment
where customer_id>3;
-- find the occurance for each amount value 
select amount,count(amount) from payment group by amount;

-- find the total amount given in you data 
select sum(amount) from payment;

-- get the total amount spend in each month
select sum(amount) ,month(payment_date) from payment
group by month(payment_date);
-- get the total amount spend for each month of each year
select sum(amount) ,year(payment_date),month(payment_date) from payment
group by year(payment_date),month(payment_date);
-- get the average sale by each staff
select avg(amount),staff_id,count(staff_id)from payment 
group by staff_id;
-- 1/5/2026
select customer_id,count(payment_id) from payment group by customer_id;
select customer_id from payment  where customer_id>=3 group by customer_id;
select * from payment;


CREATE TABLE sales (
    id INT PRIMARY KEY AUTO_INCREMENT,
    region VARCHAR(50),
    product VARCHAR(50),
    sales_person VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (region, product, sales_person, amount, sale_date) VALUES
('North', 'Laptop', 'Amit', 55000, '2025-01-05'),
('North', 'Mobile', 'Amit', 20000, '2025-01-06'),
('South', 'Laptop', 'Ravi', 60000, '2025-01-07'),
('East', 'Tablet', 'Suman', 15000, '2025-01-08'),
('West', 'Laptop', 'Neha', 58000, '2025-01-09'),

('North', 'Tablet', 'Amit', 12000, '2025-01-10'),
('South', 'Mobile', 'Ravi', 22000, '2025-01-11'),
('East', 'Laptop', 'Suman', 50000, '2025-01-12'),
('West', 'Tablet', 'Neha', 14000, '2025-01-13'),
('North', 'Laptop', 'Amit', 57000, '2025-01-14'),

('South', 'Tablet', 'Ravi', 13000, '2025-01-15'),
('East', 'Mobile', 'Suman', 21000, '2025-01-16'),
('West', 'Laptop', 'Neha', 61000, '2025-01-17'),
('North', 'Mobile', 'Amit', 19000, '2025-01-18'),
('South', 'Laptop', 'Ravi', 62000, '2025-01-19'),

('East', 'Tablet', 'Suman', 16000, '2025-01-20'),
('West', 'Mobile', 'Neha', 23000, '2025-01-21'),
('North', 'Tablet', 'Amit', 11000, '2025-01-22'),
('South', 'Mobile', 'Ravi', 25000, '2025-01-23'),
('East', 'Laptop', 'Suman', 52000, '2025-01-24'),

('West', 'Tablet', 'Neha', 13500, '2025-01-25'),
('North', 'Laptop', 'Amit', 59000, '2025-01-26'),
('South', 'Tablet', 'Ravi', 12500, '2025-01-27'),
('East', 'Mobile', 'Suman', 20500, '2025-01-28'),
('West', 'Laptop', 'Neha', 60000, '2025-01-29'),

('North', 'Mobile', 'Amit', 21000, '2025-01-30'),
('South', 'Laptop', 'Ravi', 63000, '2025-01-31'),
('East', 'Tablet', 'Suman', 17000, '2025-02-01'),
('West', 'Mobile', 'Neha', 24000, '2025-02-02'),
('North', 'Tablet', 'Amit', 12500, '2025-02-03'),

('South', 'Mobile', 'Ravi', 26000, '2025-02-04'),
('East', 'Laptop', 'Suman', 54000, '2025-02-05'),
('West', 'Tablet', 'Neha', 15000, '2025-02-06'),
('North', 'Laptop', 'Amit', 61000, '2025-02-07'),
('South', 'Tablet', 'Ravi', 14000, '2025-02-08');

select * from sales;
select sum(amount) as total_sales from sales;
-- mobile total sales
select sum(amount) as mobile_total_sales from sales where product="mobile";
-- the total sales and avg sales in the north regin but for the product laptop and mobile
select sum(amount),avg(amount) from sales where region="north" and product in ("laptop","mobile");
select sum(amount),avg(amount) from sales where region="north" and (product="laptop" or product="mobile");
-- find out the max amount and the min amount for febraury month
select max(amount),min(amount) from sales where month(sale_date)=2;
select * from sales;

-- find out the total sales we have done for each region 
select sum(amount) , region from sales group by region;
-- find out the avd sales done by each person
select avg(amount) , sales_person from sales group by sales_person;


-- find the total amount and the total transaction for each producct but the amit should not be thr sales person
select sum(amount) , count(amount) , sales_person from sales where sales_person!="amit" group by sales_person;
-- find the number of sales each person for the amount >10000
select count(amount),sales_person from sales where amount>10000 group by sales_person;
-- find the number of transaction done from day 1 to day 7 for any month
SELECT COUNT(*) AS total_transactions
FROM sales
WHERE DAY(sale_date) BETWEEN 1 AND 7;
select * from sales;


-- find the total amount avg amount max amount for each product of each region 
select sum(amount),avg(amount),max(amount),product,region from sales group by product,region;
--  find the total transaction amount for each product where the product should be sold more than 13 times 
select sum(amount), count(product),product from sales group by product having count(product)>=13;

select * from sales;





