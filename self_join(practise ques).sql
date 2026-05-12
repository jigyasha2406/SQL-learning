create database joindb;
CREATE TABLE employe (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    salary INT
);

INSERT INTO employe (emp_id, emp_name, department, manager_id, salary) VALUES
(1, 'Amit', 'Management', NULL, 120000),
(2, 'Neha', 'HR', 1, 75000),
(3, 'Raj', 'IT', 1, 90000),
(4, 'Simran', 'Finance', 1, 85000),
(5, 'Karan', 'IT', 3, 70000),
(6, 'Priya', 'IT', 3, 72000),
(7, 'Rohit', 'HR', 2, 50000),
(8, 'Anjali', 'HR', 2, 52000),
(9, 'Vikas', 'Finance', 4, 65000),
(10, 'Sneha', 'Finance', 4, 62000),
(11, 'Arjun', 'IT', 5, 55000),
(12, 'Pooja', 'IT', 5, 53000),
(13, 'Meera', 'HR', 7, 45000),
(14, 'Dev', 'Finance', 9, 48000),

(15, 'Nitin', 'IT', 6, 51000);
select * from employe as empl
join employe as mngr where empl.manager_id=mngr.emp_id;

select e.emp_id,e.emp_name,e.manager_id,e.department,m.emp_id,m.emp_name,m.department
from employe as e join employe as m
where e.manager_id=m.emp_id and e.department=m.department;

-- youneed the employee name and its sarary if it is greater than its manager
select e.emp_id,e.emp_name,e.salary,m.salary as manager_salary
from employe as e join employe as m
where e.manager_id=m.emp_id and  e.salary>m.salary;

-- show all the emp name with all the manager name
select e.emp_name as employee,m.emp_name as manager
from employe as e
join employe as m
on e.manager_id=m.emp_id;
-- show employee with its grand manager
select e.emp_name AS employee,m.emp_name AS manager,gm.emp_name AS grand_manager
from employe e
join employe m
on e.manager_id = m.emp_id
join employe gm
on m.manager_id = gm.emp_id;
-- find the employee who are also the manager.
SELECT DISTINCT
    m.emp_id,
    m.emp_name
FROM employe e
JOIN employe m
ON e.manager_id = m.emp_id;

-- 


select * from employe;


