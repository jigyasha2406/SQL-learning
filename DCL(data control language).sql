-- DCL-data control language
select * From mysql.user;
create user ishan identified by "123";
select current_user();
create database testdb4;
use testdb4;
create table emp(id int,name varchar(20));
insert into emp values(20,"abhi"),(21,"naina");
select * from emp;
show grants for ishan;
grant select on testdb4.emp to ishan ; -- used to grant the permission for only select 
grant delete on testdb4.* to ishan ;
-- also create one more table select query error
create table emp2(id int,name varchar(20));
insert into emp2 values (80,"rahul");
-- revoke this delete prevelage from the ishan user
revoke delete on testdb4.* FROM 'ishan'@'%';

-- give select and insert previledge to a particular table
grant select,insert on testdb4.emp to 'ishan'@'%';
-- create a data base with three columns and insert atleat two rows
create table emp3(name varchar(20),id int,department varchar(10));
insert into emp3 values("rahul",1,"HR"),("abhi",2,"Finance"),("neha",3,"IT");
-- now give one column access to the ishan user of select statement 
grant select(name) on testdb4.emp3 to ishan;
-- also give the update to the second and third column
grant update(id,department) on testdb4.emp3 to ishan;
-- remove all the previldges from this ishan user
REVOKE ALL PRIVILEGES ON testdb4.* FROM 'ishan'@'%';
revoke select on  testdb4.emp3 from 'ishan'@'%';
revoke update on  testdb4.emp3 from 'ishan'@'%';
revoke select on testdb4.emp from "ishan"@"%";
revoke insert on testdb4.emp from "ishan"@"%";

-- create 3 user and a rool of then 
create user "ajay" identified by "123";
create user "neha" identified by "123";
create user "rahul" identified by "123";

-- create a role 
create role sale;

-- grant the priveledges to the role
grant select,update,insert on testdb4.* to sale;
-- grant the role to the different users
grant sale to rahul;
grant sale to ajay;
grant sale to neha;
-- set the role to the user
set default role sale to ajay;
set default role sale to rahul;
set default role sale to neha;
-- verifying the access 
show grants for ajay;
show grants for neha;
-- revoke priveldge from on user
revoke sale from "ajay"@"%";





SELECT user, host FROM mysql.user WHERE user = 'ajay';
