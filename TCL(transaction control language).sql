-- TCL - transaction contol language
-- tansactions are the group of sql statement which works as a unit
-- ACID properties
-- this tcl command ensure my data is correct and accurage by following the 4 properties 
-- 1. a- automacity-all or nothing 3rd
-- 2.c- consistency-valid state always(step by step execution) 4th
-- 3.i-isolation - transaction separate  1st 
-- 4. d-durability-saved permanently     2nd


create database tcl;
use tcl;
create table raj45(id int);
insert into raj45 values(10);
select * from raj45;
-- tcl
start transaction;-- now the tyransaction is stated now this work will be isolated and will not be access at other places.
insert into raj45 values(100),(99);
select * from raj45;
commit;
-- transactions stats when we write "start transaction" keyword
-- transactions starts when we run dml statements ,
-- transaction ends when we use commit or roolback or we run ddl statement 
-- mysql option auto commit- make it disable
SET SQL_SAFE_UPDATES=0;
update raj45 set id=800;
rollback;-- its revert all the pending transaction its undo all transaction .
update raj45 set id=500;

set @@autocommit;
start transaction ;
insert into raj45 values(10),(11),(56),(68);
select * from raj45;
delete from raj45 where id=10;
commit;
start transaction;
insert into raj45 values(768),(689),(400);
select * from raj45;
savepoint raj_45_savepoint_ins;-- used to save all the work till the point you want now if we run rollback then it will be only rollback till this point 
update raj45 set id=1000;
rollback to raj_45_savepoint_ins;
delete from raj45 where id=10;
create table tr(id int);
-- delete drop truncate
-- truncate and drop cannot be rollback
-- delete can be rollback because it is a dml statement
