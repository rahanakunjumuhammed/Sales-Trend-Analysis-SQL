CREATE DATABASE online_sales_db;
USE online_sales_db;

CREATE TABLE online_sales (
    customer_id INT,
    order_date DATE,
    product_id INT,
    category_id INT,
    category_name VARCHAR(50),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),
    payment_method VARCHAR(50),
    city VARCHAR(50),
    review_score INT,
    gender CHAR(1),
    age INT
);

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.4/Uploads/online_sales_clean.csv'
INTO TABLE online_sales
FIELDS TERMINATED BY ','       -- each column is separated by a comma
ENCLOSED BY '"'               -- text values are in quotes
LINES TERMINATED BY '\n'      -- each row ends with a new line
IGNORE 1 ROWS

DESCRIBE online_sales;
SELECT COUNT(*) AS total_rows
FROM online_sales;
select * from online_sales;

SELECT YEAR(order_date) AS Year, MONTH(order_date) AS Month,
SUM(quantity * price) AS total_revenue, COUNT(DISTINCT customer_id) AS order_volume FROM online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

SELECT YEAR(order_date) AS Year, MONTH(order_date) AS Month,
SUM(quantity * price) AS MonthlyRevenue, COUNT(DISTINCT customer_id) AS OrderVolume FROM online_sales 
WHERE YEAR(order_date) = 2024 GROUP BY Year, Month ORDER BY Month;

SELECT YEAR(order_date) AS Year, MONTH(order_date) AS Month,
SUM(quantity * price) AS MonthlyRevenue FROM online_sales
GROUP BY Year, Month ORDER BY MonthlyRevenue DESC LIMIT 3;
