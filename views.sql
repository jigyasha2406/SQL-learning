-- views
-- views are called as virtual tables which are used to store the query
-- it do not store any data
create database if not exists viewdb;
use viewdb;


CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id   INT PRIMARY KEY,
    name     VARCHAR(50),
    dept_id  INT,
    salary   DECIMAL(10,2),
    city     VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1,'HR'), (2,'IT'), (3,'Finance');

INSERT INTO employees VALUES
(101,'Aman',    2, 70000, 'Jaipur'),
(102,'Priya',   1, 45000, 'Delhi'),
(103,'Rahul',   2, 90000, 'Mumbai'),
(104,'Sneha',   3, 55000, 'Jaipur'),
(105,'Vikram',  2, 30000, 'Pune');

select * from departments;
select * from employees;

-- use case of views
-- security layes - views are ussed to give the access to specific rows and columns
-- it is used to make comples query easier
-- in views we can write multiple aggregation,write join into a view
-- it is used to make query reusable(once query written in the view we canuse it multiple times)
create view dept_view as select * from departments where dept_id<3;
select * from dept_view;

select * From employees;
create view city_sums as select city,sum(salary) as total from employees group by city;
select * from city_sums where city="jaipur";
-- delete on view

-- restricted the access of the columns to the users
create view  emp_2_col as select emp_id,name from employees;
select * from emp_2_col;
-- inserting value in the views
-- if we perform any ddl statement on the views then the changes made are stored in the original table also
insert into emp_2_col values(107,"yash");
select * from emp_2_col;
select * from employees;
-- simple view or updated view= in this view the changes made in the view through the dml statement are also effect the original data

select * from employees;
delete from emp_2_col
where id=107;
update emp_2_col
set name="aryan" where emp_id=101;

-- a view genrally become non-updatable (read only) if its defination contains any of the following:
-- group by 
-- aggregation function
-- distinct
-- set operation
-- joins (in many dbms you can update only one side, some dbms dosent allow it )
-- window functiona
-- computeted/derieved column

-- views built on the top of the other non-updated view
select * from departments;
 create view group_dept as select dept_id,count(*) from employees group by dept_id;
 select * from group_dept;
insert into group_dept values(4,6);

-- join 
-- we can update the join view of the one table at a time we cannot upadte the both column of the the table together
create view join_ed as select e.emp_id,e.name,d.dept_name from employees as e
join departments as d on e.dept_id=d.dept_id;
select * from join_ed;
insert into join_ed values(101,"ghhh","finance");
update join_ed
set dept_name="human resource" where emp_id=102;
delete from join_ed 
where id=102;
update join_ed
set dept_name="human resource" , emp_id=203, name="happy";
insert into join_ed(emp_id,name) values(107,"anuj");

