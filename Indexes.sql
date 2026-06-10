-- indexes
-- indexes is a object which is used to improve the speed to  data reteival from a table.
drop database indexdb;
create database indexdb;
use indexdb;
create table employees(id int,name varchar(200),age int);
insert into employees values(1,"abc",90),(3,"def",100),(2,"abhi",23),(5,"naina",7899),(6,"shyam",100),(4,"tushar",60);
explain select * from employees where name="tushar"; 
-- types
-- 1. clustered index- when we make a column a primary key , it automatically sort the data 
alter table employees
add primary key (id);

select * from employees;-- because it store the data in the binary tree format
-- non clustered index - when we want to query on other different columns other from primary key.
-- non clustered index can contain duplicate, not sorted data.
-- non clusters index is a type of index in which a sperate data structure will be created .
-- in non clustred a new table is create and searching is done on the basis of the refrence of that object in the new table.

show indexes from employees;
create index age_idnx on employees(age);

explain select * from employees where age=100;
-- composite index
create index comp_index on employees(age,name);
-- in composite index the accessing will work on both together , we can not use then separetly specially the 2nd value .
explain select * from employyes where age=100 and name="def";
explain select * from employees where name="def";-- it will give an error
-- group by 
-- join
-- single row multi row
-- windows function 
-- rank dense 
-- leg lead
-- view
-- indexces
-- normalization 
-- acid properties












