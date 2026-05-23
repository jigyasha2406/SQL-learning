-- creating a table
create database const_db;
select database();
use const_db;

-- DDL (data defination language)
create table if not exists test1(id int , age int);
-- DML (data manipulation language)
insert into test1 values (101,32),(102,null);
select * from test1;
insert into test1 values (103,45);
insert into test1 values (101,32),(102,null);
-- constrainsts are the rules which are applied to the table column to prevent the invalid data entry  in the table.
-- not null
create table test2(id int,age int not null);-- means it could not be left blank
insert into test2 values (101,32),(102,null);

-- unique- it can contains multiple null values.
create table test3(id int unique,age int not null);
insert into test3 values(101,32);
insert into test3 values(101,35);-- the id can not be same
insert into test3 values(null,45);
insert into test3 values(null,45);

-- default
create table test4(id int default 100,age int);
insert into test4(age) values(20);
select * from test4;

-- primary key 
create table test5(id int primary key,age int);
insert into test5 values(80,39);
insert into test5 values(80,39);
insert into test5 values(null,56);
-- composite key
create table test6(id int,age int,salary int,primary key(id,age));
insert into test6 values(1,23,50000),(2,45,60000),(1,67,54000);
select * from test6;
desc test6;

-- check constraint
create table if not exists test9(id int , age int check (age>18));
insert into test9 values (1,45);
insert into test9 values(1,12);
create table if not exists test10(id int,age int check (age between 18 and 22));
insert into test10 values(1,10);
insert into test10 values(1,20);


create table student (id int,name varchar(20),cname varchar(20) foreign key cname references class(cname);
insert into student values (1,"rahul",10),(2,"naina",20);
create table class(cname varchar(20) primary key);
insert into class values(10),(20),(30);

create table s_class(cname varchar(20) primary key);
insert into s_class values (10),(8),(9);
create table students(id int,name varchar(20) ,cname varchar(20),
	   foreign key (cname) references s_class(cname));
insert into students values (1,"naina",10);
insert into students values(2,"abhi",12);-- it will give an error because class 12 dosent exists in the class table.
