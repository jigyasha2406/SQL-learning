use sakila;
select first_name,department from employees;
-- if condition 
-- if(condition,true,false)
select first_name,department,if(department="it",true,false) from employees;
select first_name,department,if(department="it",salary*1.1,salary*1.05) from employees;
select first_name,department,if(department="it",salary*1.1,if(department="hr") from employees;
-- case statement - beteer way to write nested if statements
/*
select col1,col2
case
    when condition then statement
end
from table_name
*/
select first_name,salary,department,
case 
    when department="it" or "hr" then "A category"
    else "B category"
end 
from employees;

select first_name,salary,department,
case
  when department="it" then salary*1.1
  when department="hr" then salary*1.05
  else salary
end as "new salary"
from employees;

-- if the hiring date of an employee is before 2020 then print job title senior , year=2021 then associate ,name as it is 
select * from employees;
select first_name,year(hire_date),job_title,
case
when year(hire_date)<2020 then concat("senior"," ",job_title)
when year(hire_date)=2021 then concat("associate"," ",job_title)
else job_title
end as "new position"
from employees;
-- if salary >70000 = average slary, salary >85000 then high salary,salary>1lac then extreme high salary else low salary
select first_name,salary,
case 
when  85000>salary>70000  then "average salary"
when then "high salary"
when salary>100000 then "extreme salary"
else "low salary"
end as "salary category"
from employees;

-- select the job title and print the column value based on the follwing condition 1 or more 
select count(job_title),job_title,
case 
when count(job_title)=1 then concat(job_title," ","has " ,count(job_title)," person")
when count(job_title)>1 then concat(job_title," ","has " ,count(job_title)," persons")
end as "number of employee"
from employees
group by job_title;






  
