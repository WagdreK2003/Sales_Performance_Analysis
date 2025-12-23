-- create database
CREATE DATABASE sales_analysis;  

-- use database
USE sales_analysis;

-- create sales table
CREATE TABLE sales (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(150),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2),
    order_year INT,
    order_month VARCHAR(20),
    month_number INT
);

-- Sample query to view data
SELECT * FROM sales
LIMIT 10;

-- total sales and profit
select 
	sum(sales) as total_sales,
	sum(profit) as total_profit
from sales;

-- SALES BY YEAR
SELECT 
    order_year,
    SUM(sales) AS yearly_sales
FROM sales
GROUP BY order_year
ORDER BY order_year;

-- SALES BY REGION
SELECT 
    region,
    SUM(sales) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- PROFIT BY CATEGORY 
SELECT 
    category,
    SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

-- TOP 10 PRODUCTS (SUB-CATEGORY)
SELECT 
    sub_category,
    SUM(sales) AS total_sales
FROM sales
GROUP BY sub_category
ORDER BY total_sales DESC
LIMIT 10;

-- MONTHLY SALES TREND
SELECT 
    order_month,
    month_number,
    SUM(sales) AS monthly_sales
FROM sales
GROUP BY order_month, month_number
ORDER BY month_number;

