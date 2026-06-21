
QUERY 1: Top 5 Customers by Total Revenue
USE order_db;
SELECT 
    c.Customer_Name, 
    SUM(o.Sales) AS Total_Revenue
FROM orders_dataset o
JOIN `customers_dataset_100 (1)` c 
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 5;

QUERY 2: Monthly Sales Performance
USE order_db;
SELECT 
    MONTH(Order_Date) AS Month,
    SUM(Sales) AS Monthly_Sales
FROM orders_dataset
GROUP BY Month
ORDER BY Month;

 QUERY 3: Profit Margin by Product Category
USE order_db;
SELECT Product_Category,
    SUM(Profit)/SUM(Sales) AS Profit_Margin
FROM orders_dataset
GROUP BY Product_Category;



 QUERY 4: Total Sales by Region

USE order_db;
SELECT c.Region,
    SUM(o.Sales) AS Total_Sales
FROM orders_dataset o
JOIN `customers_dataset_100 (1)` c 
ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region;

QUERY 5: Order Details with Customer Information
USE order_db;
SELECT 
    o.Order_ID,
    o.Order_Date,
    c.Customer_Name,
    c.Region,
    o.Product_Category,
    o.Sales,
    o.Profit
FROM orders_dataset o
INNER JOIN `customers_dataset_100 (1)` c 
ON o.Customer_ID = c.Customer_ID;