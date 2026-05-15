create database subq;
use subq;
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID VARCHAR(10) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(100),
    CITY VARCHAR(50),
    CREDIT_LIMIT INT
);

INSERT INTO CUSTOMERS (CUSTOMER_ID, CUSTOMER_NAME, CITY, CREDIT_LIMIT) VALUES
('C01', 'Ravi Kumar', 'Delhi', 100000),
('C02', 'Priya Singh', 'Mumbai', 80000),
('C03', 'Amit Sharma', 'Bangalore', 60000),
('C04', 'Neha Joshi', 'Chennai', 50000);


CREATE TABLE PRODUCTS (
    PRODUCT_ID VARCHAR(10) PRIMARY KEY,
    PRODUCT_NAME VARCHAR(100),
    CATEGORY VARCHAR(50),
    PRICE INT
);

INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRICE) VALUES
('P01', 'Laptop', 'Electronics', 55000),
('P02', 'Headphones', 'Electronics', 3000),
('P03', 'Desk Chair', 'Furniture', 12000),
('P04', 'Notebook', 'Stationery', 150);

CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID VARCHAR(10),
    PRODUCT_ID VARCHAR(10),
    QUANTITY INT,
    ORDER_DATE DATE,
    STATUS VARCHAR(20),

    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);

INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, PRODUCT_ID, QUANTITY, ORDER_DATE, STATUS) VALUES
(1001, 'C01', 'P01', 2, '2024-01-05', 'Delivered'),
(1002, 'C02', 'P02', 1, '2024-01-10', 'Pending'),
(1003, 'C01', 'P03', 5, '2024-01-12', 'Delivered'),
(1004, 'C03', 'P01', 3, '2024-01-15', 'Cancelled'),
(1005, 'C02', 'P04', 2, '2024-02-01', 'Delivered'),
(1006, 'C04', 'P02', 1, '2024-02-05', 'Pending'),
(1007, 'C03', 'P03', 4, '2024-02-10', 'Delivered');

select * from orders;
select * from customers;
select * from products;


-- Find the names of customers who have placed at least one order.
select * from customers where customer_id in(select distinct customer_id from orders);
-- Products never ordered
select * from orders where product_id not in (select product_id from products);
-- Customers with above average credit limit
select * from customers where credit_limit>(select avg(credit_limit) from customers);

 