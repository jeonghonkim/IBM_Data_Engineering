-- Create a new database
CREATE DATABASE sales;

-- Use the new database
USE sales;

-- Create a new table
CREATE TABLE sales (
    product_id INT, 
    customer_id INT, 
    price INT, 
    quantity INT,
    timestamp TIMESTAMP);

-- List tables in a database
SHOW TABLES;

-- Count of records in the table
SELECT COUNT(*) FROM sales;

-- Create an index
CREATE INDEX ts ON sales (timestamp);

-- List indexes
SHOW INDEXES FROM sales;
