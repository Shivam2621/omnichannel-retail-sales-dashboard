-- Create Database
CREATE DATABASE retail_db;
USE retail_db;

-- Create Table (modify column names if needed)
CREATE TABLE sales (
    order_id INT,
    product VARCHAR(255),
    category VARCHAR(100),
    sales FLOAT,
    quantity INT,
    region VARCHAR(100),
    channel VARCHAR(50),
    order_date DATE
);

-- 1. Total Revenue
SELECT SUM(sales) AS total_revenue
FROM sales;

-- 2. Total Orders
SELECT COUNT(order_id) AS total_orders
FROM sales;

-- 3. Best Selling Products
SELECT product, SUM(quantity) AS total_quantity
FROM sales
GROUP BY product
ORDER BY total_quantity DESC;

-- 4. Sales by Region
SELECT region, SUM(sales) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- 5. Sales by Channel
SELECT channel, SUM(sales) AS total_sales
FROM sales
GROUP BY channel
ORDER BY total_sales DESC;

-- 6. Monthly Sales Trend
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales) AS monthly_sales
FROM sales
GROUP BY year, month
ORDER BY year, month;

-- 7. Average Sales
SELECT AVG(sales) AS avg_sales
FROM sales;

-- 8. Top 5 Products by Revenue
SELECT product, SUM(sales) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC
LIMIT 5;