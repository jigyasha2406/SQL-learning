create database  if not exists datatypedb;
 use datatypedb;
-- numeric 
create  table test1( id tinyint);
insert into test1 values(-1),(10);
insert into test1 values (-129);--  out of range (1byte=> 8 bit  => 2**8(-128 to 127)
insert into test1 values (-128);
insert into test1 values (128);
insert into test1 values (127);
select * from  test1;
-- small int  ->2  byte  medium  int -> 3  byte 
-- int  -> 4

 create  table  test2 (age tinyint unsigned);
 insert into test2  values(250);  --  it is valied  0 to 255  it is  in range 
 
 select  * from  test2;
 
 
 
 create table  test3  ( salary float ,  salary2 double );
 insert  into  test3 values(1989.9301934, 1989.9301934);
 select  * from  test3;
 
 
 
 create  table  test4 ( price  double(6,2));-- total  is 6,3 is decimal  value  , 4  are the  value  before  double( value , decimal_value )
 insert   into  test4 values ( 0.7933723932);--  only 2  decimal  value 
  insert   into  test4 values(44.7886868);
   insert   into  test4 values(4322.909099);
    insert   into  test4 values(4453);
     insert   into  test4 values(76343);-- 5 integer  value 
      select * from test4;
      
      
      
      
create  table  test5( countrycode char(3));
insert into test5 values('IND');
 insert into test5 values('INDIA');-- << -- error
  insert into test5 value('he        ');   
  select*   from  test5;
   select*  , char_length(countrycode) from  test5;
   
   
   create  table  test6( countrycode varchar(3));
insert into test6 values('IND');
 insert into test6 values('INDIA');
  insert into test6 value('he        ');   
  select*   from  test6;
   select*  , char_length(countrycode) from  test6;
   
   
   
-- ddl  statement 

 create  table  test10 ( id int , name varchar(20));
 
  insert into  test10 values(1,'abhi'),(2,'sahil'),(3,'yash');
  select * from test10;
     
 alter table  test10 add  column (salary int);
 alter table  test10 add  column (age  int  default 18);
 alter table  test10 drop column  salary ;-- to delete  column 
  alter table  test10  rename  column age  to newage ;--  rename the column 
  
alter  table  test10 add  constraint primary key (id);  
desc test10;
  --  truncate test10 ( ddl statement)
    truncate test10;
    select * from test10;  --  truncate =>  data is deleted  but  not   the table  structrure 
    
    
    
     --  ddl  drop  statement  ( drop  will  delete the  structure and table )
      drop table  test10; -- drop  => droped table  structure  is drooped / remeoved
      
      
   -- add a column before   the name column
   -- change tah data type   name column to ingteger 
    -- add a not  null constraint  name and age column 
    --  add a forign key   whit the dept_id  which   is refer  to department  table
    
    
    
    select  database();
    select   * from  sakila. actor ;
      select    actor_id , first_name  from  sakila. actor ;
      
      
 create  table  keshav123 as  select    actor_id , first_name  from  sakila. actor ;-- ctas  = creat table as select satament 
 select * from   keshav123;


-- insert / update  /delete/
 insert  into  keshav123 values(19999,'japan');-- dml
 SET SQL_SAFE_UPDATES=0; -- 1 to     
 update  keshav123 set  first_name= 'urvashi';
  update  keshav123 set  first_name= 'lala' where actor_id=2;  
  delete   from keshav123   where   actor_id =3 or  actor_id = 4;