-- window function is a type of function which will give you the calculation of rows for each row.
-- window function perform a calutaion on multiple rows and gives the calcualted  output  for each row

use shadidb;

select * from employees;
select avg(salary) from employees;

select emp_id, name,salary,avg(salary) over() from employees;

select emp_id , name,salary,max(salary) over() , avg(salary) over(),salary-avg(Salary) over(),salary-max(Salary) over() from employees;

select emp_id,name,count(*) over(),max(salary) over(),min(salary) over(),avg(salary) over() from employees;

select emp_id,name, sum(salary) over(),concat(round((salary/sum(salary) over() )*100),"%") from employees;

select emp_id,name,salary , sum(salary) over(order by salary) from employees;-- it wil work as comulative sum or runnung total
-- running sum means calculating the sum by adding the next one

-- partition by 
select *,sum(salary) over(partition by department),sum(salary) over() from employees; 
select *, sum(salary) over (partition by manager_id),sum(salary) over() from employees;

-- running sum based on the department 
select *,sum(salary) over(partition by department order by salary ),sum(salary) over() from employees; 

-- diand salary is hoe much more or less than the salary of her department
select name,salary,department,sum(salary) over(partition by department) ,salary-department,sum(salary) over(partition by department) from employees; 


create database windowsdb;
use windowsdb;


-- ============================================
--  Create the employees table
-- ============================================
CREATE TABLE employees (
  emp_id    INT,
  name      VARCHAR(50),
  dept      VARCHAR(30),
  salary    INT,
  hire_year INT
);

INSERT INTO employees VALUES
  (1,  'Alice',   'IT',      90000, 2019),
  (2,  'Bob',     'IT',      75000, 2020),
  (3,  'Charlie', 'IT',      82000, 2018),
  (4,  'Diana',   'HR',      68000, 2021),
  (5,  'Eve',     'HR',      72000, 2019),
  (6,  'Frank',   'HR',      65000, 2022),
  (7,  'Grace',   'Sales',   55000, 2020),
  (8,  'Henry',   'Sales',   60000, 2021),
  (9,  'Iris',    'Sales',   58000, 2019),
  (10, 'Jack',    'Finance', 95000, 2017),
  (11, 'Karen',   'Finance', 88000, 2018),
  (12, 'Leo',     'Finance', 91000, 2020);
  
  select * from employees;
  
select *,sum(salary) over(partition by hire_year) from employees;
select *,sum(salary) over(partition by hire_year order by salary ) from employees;

select *,max(salary) over(partition by dept order by hire_year) from employees;

select * , avg(salary) over(partition by dept) ,
case
   when salary< avg(salary) over(partition by dept) then "below average salary"
   else "above average salary"
   end 
   from employees;

-- function related to window
-- row_number-a row number is a window function which is used to assign unique numbers
select *,row_number() over() from employees;
select * ,row_number() over (order by emp_id) from employees;
select *,row_number() over(partition by dept) from employees;

-- rank-- it will assign same rank to the same values and skip the next 
select *,rank() over(partition by dept order by salary) from employees;

select *,row_number() over(),rank() over(order by salary),
dense_rank() over(order by salary) from employees; 

select * , dense_rank() over(partition by dept order by salary desc) from employees;
select * , dense_rank() over(partition by dept order by hire_year) from employees where dense_rank() over(partition by dept order by hire_year)=1;
-- find the max salary of the employement in his detaprtmen
select * from employees;


-- we can not use where in the windows functiongto apply condition because where is only used on the column of the table and where is exceted first at the time of execution.
select * from
(select *, max(salary) over(partition by dept) as deptSalary from employees) as trh
where salary=deptsalary;

select * from (
select * ,rank() over(partition by dept order by salary desc) as rnk from employees) as temp
where rnk=1 ;
-- the person with the second highest salary
select * from(
(select *,dense_rank() over(order by salary desc) as drnk from employees) as temp
where drnk=2;

select * from employees where salary=(select max(salary) from employees where salary <(select max(salary) from employees);


-- always use subquery for calculating the maximum salary.
select max(salary) from employees;
select max(salary) from employees  where salary<(select max(salary) from employees);

select * from(
select * ,dense_rank() over(order by salary) as rnk from employees) as temp
where rnk=4 ;

select *,dense_rank() over(order by salary) from employees;

