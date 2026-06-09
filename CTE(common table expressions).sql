-- CTE  ->  comman table  expression 
-- storing a result  on  A  temprorary

with  test as 
(select actor_id ,count(film_id) as moviescount from sakila.film_actor group by  actor_id)


select  sum(moviescount) from  test where actor_id>10;
 -- from/ join -  where -  group by - having - select - order by -  limit/ ofset
 
 use windowsdb;
 select * from  employees as  e where salary =(select max(salary) from  employees where  dept=e.dept); 
 
 
 select  * from  (select * , max(salary)  over(partition by dept) as deptmax from  employees )as temp where salary= deptmax;
 
 
 with cte as
 (select * , max(salary)  over(partition by dept) as deptmax from  employees )
 
 select * from  cte  where salary = deptmax;
 
 
 
 
  with  xyz as 
  (select  dept  , max(salary) as deptmax from  employees group by dept)
  select * from  employees join xyz where employees.salary = xyz.deptmax and employees.dept = xyz.dept;
  
use sha