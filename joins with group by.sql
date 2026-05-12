create database joinpractice;

use joinpractice;


CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT,
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);



INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales');



INSERT INTO employees VALUES
(101, 'Alice', 70000, 1, NULL),
(102, 'Bob', 60000, 2, 101),
(103, 'Charlie', 55000, 2, 102),
(104, 'David', 50000, 3, 101),
(105, 'Eva', 45000, 4, 104),
(106, 'Frank', 75000, 1, 101),
(107, 'Grace', 80000, 2, 102),
(108, 'Helen', 62000, 3, 104),
(109, 'Ian', 47000, 4, 105),
(110, 'Jack', 53000, 2, 102),
(111, 'Kevin', 49000, 3, 104),
(112, 'Laura', 72000, 1, 101),
(113, 'Mike', 58000, 4, 105),
(114, 'Nina', 61000, 2, 107),
(115, 'Oscar', 52000, NULL, 101);
select * from employees;
select * from departments;
-- 1
-- 1. Display employee names along with their department names
select employees.emp_name,departments.dept_name from employees join departments
on employees.dept_id=departments.dept_id;

-- 2
select employees.emp_name,employees.emp_id,departments.dept_name 
from employees
left join departments
on employees.dept_id=departments.dept_id;

-- 3
select count(emp_id),dept_name
from employees
join departments
on employees.dept_id=departments.dept_id
group by dept_name;


-- 4
select sum(salary),dept_name
from employees
join departments
on employees.dept_id=departments.dept_id
group by dept_name;


-- 5
select m.emp_name,count(e.emp_id) 
from employees as e
join employees as m
on e.manager_id=m.emp_id
group by m.emp_name;


-- 6
select avg(salary),dept_name
from employees
join departments
on employees.dept_id=departments.dept_id
group by dept_name
having avg(salary)>60000;

-- more practice question
use sakila;
select * from actor;
select * from film_actor;
select * from film;

-- select actor id and full name film id which actor has worked
select actor.actor_id , concat(first_name," ",last_name),film_actor.film_id 
from actor
join film_actor 
on actor.actor_id= film_actor.actor_id;

-- get the film id the film title and the actor id
select fa.actor_id,fa.film_id,f.title
from film_actor as fa
join film as f
on fa.film_id=f.film_id;

-- find the actor id and actor name and the movie he has worked
select a.actor_id,a.first_name,f.title
from actor as a
join film_actor as fa on a.actor_id=fa.actor_id
join film as f on f.film_id=fa.film_id;


-- only for the movie whose length is grater than 120
select a.actor_id,a.first_name,f.title,f.length
from actor as a
join film_actor as fa on a.actor_id=fa.actor_id
join film as f on f.film_id=fa.film_id
where f.length>120;
--
select a.actor_id,a.first_name,count(f.film_id) as total_films
from actor as a
join film_actor as f
on a.actor_id=f.actor_id
group by a.actor_id,a.first_name;
-- get the film title an dthe number of actors that has worked on that film
select f.title,count(a.actor_id) as number_of_actors
from actor as a
join film_actor as fa on a.actor_id=fa.actor_id
join film as f on f.film_id=fa.film_id
group by f.title
order by f.title;
-- or
select f.title,COUNT(fa.actor_id) AS number_of_actors
from film f
join film_actor fa
on f.film_id = fa.film_id
group by f.film_id, f.title;


