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
