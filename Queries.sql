-- ==========================================
-- E-COMMERCE SALES ANALYSIS SQL QUERIES
-- ==========================================

-- 1. Display all customers
SELECT * FROM Customers;

-- 2. Display all products
SELECT * FROM Products;

-- 3. Display all orders
SELECT * FROM Orders;

-- 4. Total Revenue
SELECT SUM(Total_Amount) AS Total_Revenue
FROM Orders;

-- 5. Total Number of Orders
SELECT COUNT(*) AS Total_Orders
FROM Orders;

-- 6. Total Number of Customers
SELECT COUNT(*) AS Total_Customers
FROM Customers;

-- 7. Average Order Value
SELECT AVG(Total_Amount) AS Average_Order_Value
FROM Orders;

-- 8. Most Expensive Product
SELECT *
FROM Products
ORDER BY Price DESC
LIMIT 1;

-- 9. Cheapest Product
SELECT *
FROM Products
ORDER BY Price ASC
LIMIT 1;

-- 10. Top 10 Customers by Spending
SELECT
    c.Customer_ID,
    c.Customer_Name,
    SUM(o.Total_Amount) AS Total_Spent
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Spent DESC
LIMIT 10;

-- 11. Top 10 Best Selling Products
SELECT
    p.Product_Name,
    SUM(o.Quantity) AS Total_Quantity
FROM Products p
JOIN Orders o
ON p.Product_ID = o.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Quantity DESC
LIMIT 10;

-- 12. Revenue by Category
SELECT
    p.Category,
    SUM(o.Total_Amount) AS Revenue
FROM Products p
JOIN Orders o
ON p.Product_ID = o.Product_ID
GROUP BY p.Category
ORDER BY Revenue DESC;

-- 13. Orders by State
SELECT
    c.State,
    COUNT(o.Order_ID) AS Orders
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.State
ORDER BY Orders DESC;

-- 14. Revenue by State
SELECT
    c.State,
    SUM(o.Total_Amount) AS Revenue
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.State
ORDER BY Revenue DESC;

-- 15. Revenue by Gender
SELECT
    c.Gender,
    SUM(o.Total_Amount) AS Revenue
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Gender;

-- 16. Average Product Price by Category
SELECT
    Category,
    AVG(Price) AS Average_Price
FROM Products
GROUP BY Category;

-- 17. Monthly Revenue
SELECT
    MONTH(Order_Date) AS Month,
    SUM(Total_Amount) AS Revenue
FROM Orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;

-- 18. Monthly Orders
SELECT
    MONTH(Order_Date) AS Month,
    COUNT(*) AS Orders
FROM Orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;

-- 19. Customers with More Than 10 Orders
SELECT
    Customer_ID,
    COUNT(*) AS Order_Count
FROM Orders
GROUP BY Customer_ID
HAVING COUNT(*) > 10;

-- 20. Products Never Ordered
SELECT
    p.Product_Name
FROM Products p
LEFT JOIN Orders o
ON p.Product_ID = o.Product_ID
WHERE o.Product_ID IS NULL;

-- 21. Highest Revenue Category
SELECT
    p.Category,
    SUM(o.Total_Amount) AS Revenue
FROM Products p
JOIN Orders o
ON p.Product_ID = o.Product_ID
GROUP BY p.Category
ORDER BY Revenue DESC
LIMIT 1;

-- 22. Top 5 Cities by Revenue
SELECT
    c.City,
    SUM(o.Total_Amount) AS Revenue
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.City
ORDER BY Revenue DESC
LIMIT 5;

-- 23. Total Quantity Sold by Category
SELECT
    p.Category,
    SUM(o.Quantity) AS Quantity_Sold
FROM Products p
JOIN Orders o
ON p.Product_ID = o.Product_ID
GROUP BY p.Category;

-- 24. Highest Single Order
SELECT *
FROM Orders
ORDER BY Total_Amount DESC
LIMIT 1;

-- 25. Top 5 Customers by Number of Orders
SELECT
    c.Customer_Name,
    COUNT(o.Order_ID) AS Orders
FROM Customers c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Orders DESC
LIMIT 5;
