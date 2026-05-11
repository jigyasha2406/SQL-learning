CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
city VARCHAR(30) NOT NULL,
category VARCHAR(30) NOT NULL,
product VARCHAR(50) NOT NULL,
quantity INT NOT NULL,
price DECIMAL(10,2) NOT NULL,
order_date DATE NOT NULL
);

INSERT INTO orders VALUES
(1001, 'Rahul Sharma', 'Mumbai', 'Electronics', 'Laptop', 1,
55000, '2024-01-05'),
(1002, 'Priya Patel', 'Delhi', 'Clothing', 'Kurta', 3,
1500, '2024-01-07'),
(1003, 'Amit Singh', 'Bangalore', 'Electronics', 'Smartphone', 2,
18000, '2024-01-10'),
(1004, 'Sunita Rao', 'Chennai', 'Furniture', 'Chair', 4,
3200, '2024-01-12'),
(1005, 'Vikram Joshi', 'Mumbai', 'Electronics', 'Tablet', 1,
22000, '2024-01-15'),
(1006, 'Neha Gupta', 'Delhi', 'Clothing', 'Saree', 2,
4500, '2024-01-18'),
(1007, 'Kiran Kumar', 'Bangalore', 'Furniture', 'Table', 1,
8500, '2024-01-20'),
(1008, 'Deepak Verma', 'Chennai', 'Electronics', 'Headphones', 5,
2500, '2024-02-02'),
(1009, 'Anjali Mehta', 'Mumbai', 'Clothing', 'Jacket', 2,
3800, '2024-02-05'),
(1010, 'Ravi Nair', 'Bangalore', 'Electronics', 'Monitor', 1,
15000, '2024-02-08'),
(1011, 'Pooja Iyer', 'Chennai', 'Furniture', 'Sofa', 1,
25000, '2024-02-12'),
(1012, 'Suresh Patil', 'Delhi', 'Electronics', 'Keyboard', 3,
1800, '2024-02-15'),
(1013, 'Meena Desai', 'Mumbai', 'Furniture', 'Bookshelf', 2,
6000, '2024-02-18'),
(1014, 'Arun Reddy', 'Bangalore', 'Clothing', 'Jeans', 3,
2200, '2024-02-22'),
(1015, 'Lalita Shah', 'Delhi', 'Electronics', 'Smartwatch', 2,
9500, '2024-02-25');

select * from orders;
-- Q.1
select city,count(order_id)as total_order from orders group by city order by city asc ;
-- Q.2
select category , sum(price*quantity) as revenue from orders group by category order by revenue desc;
-- Q.3
select category , count(category) from orders group by category order by category;
-- Q4
select city ,round(avg(price),2) from orders group by city order by city;
-- Q5
select category,max(price) from orders group by category order by category;
-- Q6
select city,min(price) from orders group by city order by city;
-- Q7
select category ,sum(quantity) from orders group by category order by sum(quantity) desc;
-- Q8
select city ,sum(quantity) from orders group by city order by sum(quantity) desc;
-- Q9
select city, count(order_id) as order_count from orders group by city 
having order_count>3
order by order_count desc;
-- Q10
select category ,sum(price*quantity) as total_revenue from orders
group by category having total_revenue>50000
order by total_revenue desc;

-- Q11
select city , round(avg(price),2) as avg_price from orders
group by city having avg_price>10000
order by avg_price desc;

-- Q12
select city ,sum(price*quantity) as total_revenue from orders
where category="electronics" group by city
order by total_revenue desc;

-- Q13
select category ,sum(quantity) as total_qty from orders
group by category having total_qty>8
order by total_qty desc;

-- Q14
select category,count(distinct city) as city_count from orders
group by category
order by category ;


-- Q15
select city,min(price) as min_price from orders
group by city having min_price<2000
order by min_price;
-- Q 16
select city , sum(price*quantity) as total_revenue from orders
group by city having total_revenue between 30000 and 100000
order by total_revenue desc;
-- Q 17
select city,category, sum(price*quantity) as total_revenue from orders
group by city,category having total_revenue>20000
order by total_revenue desc;










