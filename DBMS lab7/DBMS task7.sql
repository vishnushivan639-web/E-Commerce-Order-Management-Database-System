CREATE DATABASE EcommerceDB;
USE EcommerceDB;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Name VARCHAR(100),
    Email VARCHAR(100),
    City VARCHAR(50),
    Registration_Date DATE
);
CREATE TABLE Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(100)
);
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Category_ID INT,
    Stock_Quantity INT,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID)
);
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10,2),
    Order_Status VARCHAR(30),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Price DECIMAL(10,2),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
    Payment_Method VARCHAR(50),
    Payment_Amount DECIMAL(10,2),
    Payment_Status VARCHAR(30),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);
CREATE TABLE Review (
    Review_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Product_ID INT,
    Rating DECIMAL(2,1),
    Review_Text VARCHAR(255),
    Review_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
INSERT INTO Customer
(Customer_Name, Email, City, Registration_Date)
VALUES
('Arun Kumar', 'arun@gmail.com', 'Chennai', '2026-01-10'),
('Priya', 'priya@gmail.com', 'Bangalore', '2026-01-15'),
('Karthik', 'karthik@gmail.com', 'Chennai', '2026-02-01'),
('Divya', 'divya@gmail.com', 'Coimbatore', '2026-02-10'),
('Rahul', 'rahul@gmail.com', 'Bangalore', '2026-03-05');

INSERT INTO Category (Category_Name)
VALUES
('Electronics'),
('Fashion'),
('Home Appliances'),
('Books');

INSERT INTO Product
(Product_Name, Price, Category_ID, Stock_Quantity)
VALUES
('Samsung Mobile', 25000, 1, 20),
('iPhone Mobile', 65000, 1, 10),
('Laptop', 55000, 1, 15),
('Men T-Shirt', 1200, 2, 50),
('Washing Machine', 30000, 3, 8),
('SQL Programming Book', 800, 4, 0),
('Headphones', 3000, 1, 25),
('Smart Watch', 4500, 1, 5);

INSERT INTO Orders
(Customer_ID, Order_Date, Total_Amount, Order_Status)
VALUES
(1, '2026-02-10', 25000, 'Completed'),
(2, '2026-02-15', 65000, 'Pending'),
(3, '2026-03-01', 3000, 'Completed'),
(4, '2026-03-10', 1200, 'Cancelled'),
(5, '2026-03-15', 55000, 'Completed');

INSERT INTO Order_Details
(Order_ID, Product_ID, Quantity, Price)
VALUES
(1, 1, 1, 25000),
(2, 2, 1, 65000),
(3, 7, 1, 3000),
(4, 4, 1, 1200),
(5, 3, 1, 55000);

INSERT INTO Payment
(Order_ID, Payment_Method, Payment_Amount, Payment_Status)
VALUES
(1, 'UPI', 25000, 'Paid'),
(2, 'Credit Card', 65000, 'Pending'),
(3, 'Cash', 3000, 'Paid'),
(4, 'UPI', 1200, 'Failed'),
(5, 'Debit Card', 55000, 'Paid');

INSERT INTO Review
(Customer_ID, Product_ID, Rating, Review_Text, Review_Date)
VALUES
(1, 1, 4.5, 'Good product', '2026-02-12'),
(2, 2, 5.0, 'Excellent product', '2026-02-17'),
(3, 7, 4.0, 'Good sound quality', '2026-03-03'),
(4, 4, 3.5, 'Average product', '2026-03-12'),
(5, 3, 4.8, 'Very useful laptop', '2026-03-17');
SELECT * FROM Customer;
SELECT * FROM Product;
SELECT Product_Name, Price
FROM Product;
SELECT * FROM Orders;
SELECT * FROM Payment;
SELECT *
FROM Product
WHERE Price > 5000;
SELECT *
FROM Product
WHERE Stock_Quantity > 0;
SELECT *
FROM Customer
WHERE City = 'Chennai';
SELECT *
FROM Orders
WHERE Order_Status = 'Completed';
SELECT p.Product_ID, p.Product_Name, r.Rating
FROM Product p
JOIN Review r
ON p.Product_ID = r.Product_ID
WHERE r.Rating > 4;
SELECT *
FROM Product
ORDER BY Price ASC;
SELECT *
FROM Customer
ORDER BY Customer_Name ASC;
SELECT *
FROM Product
ORDER BY Price DESC;
SELECT *
FROM Orders
ORDER BY Order_Date DESC;
SELECT DISTINCT c.Category_Name
FROM Product p
JOIN Category c
ON p.Category_ID = c.Category_ID;
SELECT DISTINCT Payment_Method
FROM Payment;
SELECT DISTINCT City
FROM Customer;
SELECT *
FROM Product
WHERE Price BETWEEN 1000 AND 5000;
SELECT p.*
FROM Product p
JOIN Category c
ON p.Category_ID = c.Category_ID
WHERE c.Category_Name = 'Electronics';
SELECT *
FROM Product
WHERE Stock_Quantity > 0;
SELECT *
FROM Product
WHERE Product_Name LIKE '%Mobile%';
SELECT *
FROM Product
WHERE Stock_Quantity < 10;
SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    o.Order_Status
FROM Customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID;
SELECT
    p.Product_ID,
    p.Product_Name,
    p.Price,
    c.Category_Name
FROM Product p
JOIN Category c
ON p.Category_ID = c.Category_ID;
SELECT DISTINCT
    c.Customer_ID,
    c.Customer_Name,
    p.Product_Name
FROM Customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od
ON o.Order_ID = od.Order_ID
JOIN Product p
ON od.Product_ID = p.Product_ID
WHERE p.Product_Name = 'Samsung Mobile';
SELECT
    c.Customer_Name,
    p.Product_Name,
    od.Quantity,
    od.Price
FROM Customer c
JOIN Orders o
ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od
ON o.Order_ID = od.Order_ID
JOIN Product p
ON od.Product_ID = p.Product_ID;
SELECT p.*
FROM Product p
JOIN Category c
ON p.Category_ID = c.Category_ID
WHERE c.Category_Name = 'Electronics'
AND p.Price > 10000;
SELECT *
FROM Customer
WHERE City = 'Chennai'
OR City = 'Bangalore';
SELECT *
FROM Product
WHERE Product_Name LIKE '%Mobile%';
SELECT *
FROM Orders
WHERE Order_Date BETWEEN '2026-01-01' AND '2026-03-31';
SELECT *
FROM Customer
WHERE City IN ('Chennai', 'Bangalore');
SELECT *
FROM Product
WHERE Price > 5000
AND Stock_Quantity > 0;
SELECT
    Product_Name,
    Price,
    Stock_Quantity,
    CASE
        WHEN Stock_Quantity > 0 THEN 'Available'
        ELSE 'Out of Stock'
    END AS Availability_Status
FROM Product;
SELECT COUNT(*) AS Total_Customers
FROM Customer;
SELECT Customer_ID, Customer_Name, Email, City
FROM Customer
ORDER BY City ASC;
SELECT *
FROM Customer
ORDER BY Registration_Date DESC;
SELECT COUNT(*) AS Total_Orders
FROM Orders;
SELECT COUNT(*) AS Completed_Orders
FROM Orders
WHERE Order_Status = 'Completed';
SELECT COUNT(*) AS Pending_Orders
FROM Orders
WHERE Order_Status = 'Pending';
SELECT COUNT(*) AS Cancelled_Orders
FROM Orders
WHERE Order_Status = 'Cancelled';
SELECT
    Order_Status,
    COUNT(*) AS Total_Orders
FROM Orders
GROUP BY Order_Status;
SELECT *
FROM Product
ORDER BY Price DESC;
SELECT
    p.Product_ID,
    p.Product_Name,
    COUNT(r.Review_ID) AS Total_Reviews
FROM Product p
LEFT JOIN Review r
ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Total_Reviews DESC;
SELECT *
FROM Product
WHERE Stock_Quantity > 0;

