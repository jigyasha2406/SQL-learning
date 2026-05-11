create database regexjoin;

use regexjoin;

-- Create first table: customers
CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert records into customers
INSERT INTO customers VALUES
(1, 'Amit', 'Delhi'),
(2, 'Priya', 'Mumbai'),
(3, 'Rahul', 'Pune'),
(4, 'Sneha', 'Jaipur'),
(5, 'Karan', 'Chennai');


-- Create second table: orders
CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    product_name VARCHAR(50)
);

-- Insert records into orders
-- Duplicate customer_id is present because some customers ordered multiple products
INSERT INTO orders VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 1, 'Keyboard'),
(104, 3, 'Mouse'),
(105, 2, 'Headphones');

select * from orders;
-- inner join ia a type of join which will filter the data on the common colums
select customers.customer_id,customers.customer_name,orders.product_name from customers
join orders where customers.customer_id=orders.customer_id and customers.customer_name="amit";
-- inner join,left join,right join
 -- outer join 
 -- left join- in this type of join we will get the whole datat of the left table and 
 -- matching column from right table and for the unmatched row it gives null
 select customers.customer_id,customers.customer_name,orders.product_name from customers
 -- the is null is used to chaeck whether the value is null or not ,we cannot check using the "=" or any assignment order operator.
 left join orders on  customers.customer_id=orders.customer_id where product_name is null;
-- is not null
select customers.customer_id,customers.customer_name,orders.product_name from customers
 left join orders on  customers.customer_id=orders.customer_id where product_name is not  null;
insert into orders values(106,11,"ice_cream");
-- right join- in this type of join we will get whole datat of the right table and the matching column from the left table
select customers.customer_id,customers.customer_name,orders.product_name from customers
 right join orders on  customers.customer_id=orders.customer_id ;
-- natural join-acts as an ineer join based on the comman column name,if their is no  common column it works as cross join,and if we have more than 
-- one common column it filter out on the basis of all the columns
select customers.customer_id,customers.customer_name,orders.product_name from customers
natural join orders; -- inner join ki tarah 

-- self join 


 