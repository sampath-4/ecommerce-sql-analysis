CREATE DATABASE ecommerce;
USE ecommerce;
-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(50)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Order Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Customers
INSERT INTO customers VALUES
(101, 'Alice Wong', 'USA'),
(102, 'Bob Smith', 'UK'),
(103, 'Raj Patel', 'India'),
(104, 'Emma Davis', 'USA');

-- Orders
INSERT INTO orders VALUES
(1, 101, '2021-01-10', 250),
(2, 102, '2021-01-15', 500),
(3, 101, '2021-02-01', 300),
(4, 103, '2021-02-20', 150),
(5, 104, '2021-03-05', 400);

-- Products
INSERT INTO products VALUES
(201, 'Shoes', 'Fashion'),
(202, 'Laptop Bag', 'Accessories'),
(203, 'Headphones', 'Electronics'),
(204, 'Smartphone', 'Electronics');

-- Order Items
INSERT INTO order_items VALUES
(1, 1, 201, 2, 50),
(2, 1, 202, 1, 150),
(3, 2, 203, 5, 100),
(4, 3, 203, 1, 100),
(5, 4, 201, 3, 50),
(6, 5, 204, 2, 200);
select
date_format(order_date,'%y-%m')as month,
sum(total_amount)as revenue
from orders
group by month
order by month asc;
select
c.customer_id,c.name,c.country,sum(o.total_amount)as revenue
from customers c join orders o on c.customer_id=o.customer_id
group by c.customer_id,c.name,c.country
order by revenue desc
limit 10;
select
p.category,sum(oi.quantity*oi.price)as revenue
from products p join order_items oi on p.product_id=oi.product_id
group by p.category
order by revenue desc;
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT CASE WHEN order_count > 1 THEN customer_id END) AS repeat_customers,
    ROUND(
        COUNT(DISTINCT CASE WHEN order_count > 1 THEN customer_id END) * 100.0 / 
        COUNT(DISTINCT customer_id), 2
    ) AS repeat_purchase_rate
FROM (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
) sub;
select
c.country,sum(o.total_amount)as revenue
from customers c join orders o on c.customer_id=o.customer_id
group by c.country
order by revenue