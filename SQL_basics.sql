use sakila;
SHOW TABLES; -- tell the table present in databse
select current_user();
show databases; -- will show all the databses present 
select * from customer;  -- used to access the data
select customer_id from customer;
select customer_id, first_name from customer;
select customer_id,first_name,customer_id from customer;
select * from payment;
select customer_id,amount from payment;
select * from customer;
select customer_id,first_name,customer_id+10 from customer; -- all the changes made in select statement they will not be reflected in original table.
select customer_id,CUSTOMER_ID from customer; -- sql is case in-sensitive
select * from customer
where customer_id=4;
select customer_id,first_name from customer
where first_name='maria';
select customer_id,first_name from customer
where last_name='willis';
select first_name,customer_id from customer 
where first_name="lisa";

-- between and in operator(used to select in range)
-- between is used to select or filter out data in a range
select * from customer 
where customer_id between 2 and 5;
-- decending is not possible
select * from customer 
where customer_id between 5 and 2;  
-- in operator is used to filter out specific values
select * from customer 
where customer_id in (2,5);
select * from customer 
where first_name in ("lisa","patricia");
-- not between just oposite of the between operator
select * from customer where customer_id not between 2 and 5;
-- and , or operator
select * from customer where customer_id=2 or customer_id>7;

select * from customer where first_name="Marion" and store_id=2;
-- first priority is always given to and
select * from customer where first_name="lisa" or store_id=2 and store_id=5;
select * from customer where customer_id>=6 or customer_id<2 and first_name='patricia';
select * from customer where customer_id=8 or customer_id=6 and first_name="Maria";
select * from customer where (customer_id=7 or customer_id=6) and first_name="maria";

-- LIKE OPERATOR - search for the pattern or search for the character
-- % ->zero or more than 1 character
select * from customer where first_name like 'be%';
select * from customer where first_name like 'b%y';

--
select * from customer where first_name like "jo_";
select * from customer where first_name like "jo%";
select * from customer where first_name not like "a%";

-- concat function
select first_name , last_name,
concat(first_name ,' ',last_name) from customer;
select * from customer where 
concat(first_name," ",last_name)="MARY SMITH";

-- functions-block of code which is used to perform a task
-- user defiend and predefiend
-- predefined function-string,date,number
select first_name,upper(first_name) from customer;
select first_name,lower(first_name) from customer;
-- length -counts the bytes--1 character 1 byte
select first_name,length(first_name) from customer;
-- char length --> no of character
select first_name,char_length(first_name) from customer;
-- concat
select first_name,concat("mrs"," ",first_name) from customer;

select first_name,concat_ws(" ","mrs",first_name,"sharma") from customer;

-- substr-used to extract a part of a string(index start with one

select first_name,email,substr(email,3) from customer;
select first_name,email,substr(email,-5) from customer;
-- substr(col,start_idx,character)
select first_name,substr(first_name,2,4) from customer;
-- instr finds the character and gives its index
select first_name,instr(first_name,"A") from customer;
select email,substr(email,1,instr(email,'@')-1) from customer;
-- replace
select first_name ,replace(first_name,"A","Z") from customer;
-- trim used to remove white spaces
select trim( " raj   ");
-- lpad and rpad function is used to make a string of the specified length
select first_name,lpad(first_name,6,'$') from customer;
select first_name,rpad(first_name,6,'$') from customer;



-- order by 
-- null
























