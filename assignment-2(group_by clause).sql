CREATE TABLE Sales_Data (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(10),
    Category VARCHAR(20),
    OrderDate DATE,
    OrderValue DECIMAL(10,2)
);

INSERT INTO Sales_Data VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);

select * from sales_data;
-- Calculate the total revenue (sum of OrderValue) for each product Category.
select sum(orderValue),category from sales_data group by category;
-- Count the total number of orders placed in each Category.
select count(category), category from sales_data group by category;
-- Find the highest (maximum) single OrderValue within each Category.
select max(orderValue),category from sales_data group by category;

-- List all unique product Categories that appear in the Sales_Data table.
select distinct category from sales_data;
-- List all unique CustomerIDs who have placed at least one order.
select distinct customerID ,count(customerid) from sales_data group by customerid having count(customerID)>=1;
-- Find all unique combinations of CustomerID and Category (i.e., which customers bought from which categories).
select distinct customerID,category from sales_data order by customerid,category;
select customerid, category, sum(ordervalue) from sales_data group by customerid,category;
select customerid, category, sum(ordervalue) from sales_data group by customerid,category having sum(ordervalue)>20000;
select count(customerid),customerid from sales_data group by customerid having count(customerid)>1;
select customerid , sum(ordervalue),category from sales_data group by customerid,category having sum(ordervalue)>10000;
select category , count(customerid),sum(ordervalue),avg(ordervalue)
from sales_data group by category having avg(ordervalue)>5000 order by sum(ordervalue) desc;
select customerid, count(customerid),avg(ordervalue)
from sales_data group by customerid having count(customerid)>1 and avg(ordervalue)>6000;
select * from sales_data;
select category ,month(orderdate),count(customerid),sum(ordervalue),avg(ordervalue)
from sales_data group by category,month(orderdate)
having count(customerid)>=2
order by month(orderdate)asc,sum(ordervalue)desc;








