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



