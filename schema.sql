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