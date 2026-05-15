-- sub query is a type of query in which the the output of the query depend on the other 
-- subquery is a type of query where a query is present within another query
-- its also called nested subquery
-- eg name of the people in jaipur who has the car same as me
-- two parts-
-- outer query 
-- inner query- will execute first 

create database shadidb;
use shadidb;
create  table  biodata(id int, 
               name varchar(20),
			   age int);
insert into biodata values(1,'rahul',28),(2,'anjali',28),(3,'aishwariya',40),(4,'naina',23);
select * from biodata;
select * from biodata where age=(select age from biodata where name="rahul");

select * from biodata where age=(select max(age) from biodata);
select * from biodata where char_length(name)=(select char_length(name) from biodata where name="rahul");
-- single row subquery- it is a type of sunquery in which the ineer query writtens one row

use sakila;
select * from film;
-- movie name where the rental rate is same for the movie of african egg
select title,rental_Rate from film where rental_rate=(select rental_rate from film where title="african egg");

-- multi row subquery- when the query returns more than one row
-- in multi row subquery we cannot use directly aritnemetic operator
use shadidb;
select * from biodata;
select  * from  biodata where   age in ( select   age  from  biodata where  name ='anjali' or name ='aishwariya');
select  * from  biodata where   age in ( select   age  from  biodata where  name ='anjali' or name ='aishwariya') and  name != 'rahul';
select  * from  biodata where   age  not in ( select   age  from  biodata where  name ='anjali' or name ='aishwariya') and  name != 'rahul';



CREATE TABLE Employees (
EMP_ID INT PRIMARY KEY,
NAME VARCHAR(50),
DEPARTMENT VARCHAR(50),
SALARY INT,
MANAGER_ID INT);

INSERT INTO Employees (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
(101, 'Alice', 'HR', 50000, NULL),
(102, 'Bob', 'IT', 80000, 101),
(103, 'Charlie', 'IT', 75000, 101),
(104, 'Diana', 'Finance', 90000, NULL),
(105, 'Eve', 'HR', 48000, 101),
(106, 'Frank', 'Finance', 95000, 104),
(107, 'Grace', 'IT', 82000, 101);
select * from employees where salary>(select avg(Salary) from employees);
select * from employees where salary=(select max(salary) from employees);
select * from employees where salary>(select salary from employees where emp_id=101);
select department from employees where salary=(select min(salary) from employees);
-- multi row subquery-it returns multiple rows but one column
-- employee who works in hr or it
select * from employees where salary in (select salary from employees where name="alice" or name="bob");
select * from employees where department in (select department from employees where name="alice" or name="bob");
-- any operator - it returns true if at least one condition true
select * from employees where salary>any(select salary from employees where emp_id=103 or emp_id=105);

-- 
select * from employees where salary>any(select salary from employees where department="hr");

select  * from employees where salary>all(select salary from employees where department="hr");
select  * from employees where salary>all(select salary from employees where department="it");# used for all
select  * from employees where salary>any(select salary from employees where department="hr"); # at least and minimum

-- find the emp details who works in it department annd have the salary>the salary of the salry of 101
select * from employees where department="it" and salary>(select salary from employees where emp_id=101);
-- find the name of a person whos salary is greater than all the salaries of hr or it department
select name from employees where salary>all(select salary from employees where department="hr" or department="it");
-- find the employee id and the employee name of the users whos salary is greater than the salary of
-- the any employee working under the manger id 101
select emp_id,name,salary from employees where salary>any(select salary from employees where manager_id=101) ;
-- find out the second highest slarary.
select max(salary )from employees where salary < (select max(salary) from employees);
select * from employees;
create table department(dept_id int,dept_name varchar(20),location varchar(20));
insert into department values(10,"HR","Mumbai") ,(20,"IT","Banglore"),(30,"Finance","Delhi");
select * from department;
select * from employees;
-- employee working in banglore and mumbali
select * from department where location in ("banglore","delhi");
# their should be same number of column or the value
select * from employees where department in(select dept_name from department where location in ("banglore","delhi"));



-- corelated subquery-its a type of subquery where the inner query is executed for each value of the outer query.
-- inner query also reffer to the column of outer query
--  the correlated subquery is also known as depandent subquery
-- for example if we want the average salary of the each employee whose salary is gretaer than the avg salary of its department
-- syntax
-- select * from table where salary(
-- select avg(salary) from table where department=outer.department)

-- find out the employee 
select * From employees;
select * from employees as e where salary>(select avg(salary) from employees where department=e.department);


-- those data of the employee who as the highest as th\
select max(salary) from employees where department="finance";
select * from employees as e where salary=(select max(salary) from employees where department=e.department);

-- find department where all employee earn employee earn abouve 7000
select distinct department from employees as e where
70000<all(select salary from employees where department=e.department);

-- 






