-- =====================================
-- E-Commerce SQL Analysis Database
-- =====================================

CREATE DATABASE ecommerce_analysis;

USE ecommerce_analysis;

-- =====================================
-- Customers Table
-- =====================================

CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    Gender VARCHAR(10)
);

-- =====================================
-- Products Table
-- =====================================

CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

-- =====================================
-- Orders Table
-- =====================================

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10,2),

    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID),

    FOREIGN KEY (Product_ID)
    REFERENCES Products(Product_ID)
);
