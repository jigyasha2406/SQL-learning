CREATE TABLE emp(
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO emp VALUES
(1, 'Amit', 'HR', 30000, 'Delhi'),
(2, 'Neha', 'IT', 60000, 'Mumbai'),
(3, 'Raj', 'Finance', 45000, 'Delhi'),
(4, 'Simran', 'IT', 70000, 'Pune'),
(5, 'Karan', 'HR', 35000, 'Mumbai'),
(6, 'Priya', 'Finance', 50000, 'Delhi'),
(7, 'Arjun', 'IT', 80000, 'Bangalore'),
(8, 'Riya', 'HR', 32000, 'Pune');

select * from emp;
select name,department from emp
where department in ("hr","it");
select * from emp
where salary between 40000 and 70000;
select * from emp where name like "a%";
-- work in IT department
-- AND have salary greater than 60000
select * from emp where department not in ("hr") and salary between 30000 and 60000;

-- (name starts with 'A' OR city is Delhi)
-- AND salary is NOT between 40000 and 70000
select * from emp where name like "a%" or city="delhi" and salary not between 40000 and 70000;
select * from emp where department in ("it","finance") and city="delhi";
select * from emp where salary >50000 or department="hr";
select * from emp where (department in ("hr","it")) and salary>40000;
select * from emp where