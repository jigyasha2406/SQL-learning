-- recursive cte: is a sql query that repeats itself until the condition is met 
-- join column wise or set operation row wise hota h 
create database userdb;
use userdb;

-- union , union all, intersect, except

-- union : all values but remove duplicates 
-- anchor query (1 wali hoti h mtlb starting point)
select * from sakila.actor where actor_id between 1 and 3
union 
-- fir ending point 
select * from sakila.actor where actor_id in (3, 5);

select * from sakila.actor where actor_id between 1 and 3 
union 
select * from sakila.actor where actor_id in (3, 5);

-- union all : sari rows dega query 1 and 2 both
select * from sakila.actor where actor_id between 1 and 3
union all
select * from sakila.actor where actor_id in (3, 5);

-- intersect : means jo common ho 
select * from sakila.actor where actor_id between 1 and 3
intersect 
select * from sakila.actor where actor_id in (3, 5);

-- except : means jo 1 query m ho 2 query m n ho 
select * from sakila.actor where actor_id between 1 and 3
except 
select * from sakila.actor where actor_id in (3, 5);

-- recursive cte
with recursive cte  as 
(select 1 as n
union 
select n+1 from cte
where n<=10)
select * from cte ;


-- to find out the hierarchy 
create table employees3(
emp_id int, emp_name varchar(50), manager_id int);

insert into employees3 values(
1, 'CEO' , null),
(2, 'john', 1 ),
(3, 'mary', 1),
(4, 'david', 2),
(5, 'lisa', 2),
(6, 'tom', 4);

select * from employees3;

-- hierarchy 
with recursive cte as 
(select emp_id as bid , emp_name as bname, emp_name as hierarchy 
from employees3
where manager_id is null
 union all
select emp.emp_id, emp.emp_name , concat(emp.emp_name, '->', cte.hierarchy) as hierarchy
from employees3 as emp
join cte where  emp.manager_id = cte.bid)
select * from cte;