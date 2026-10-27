
DROP DATABASE IF EXISTS CustomerOrderDB;
CREATE DATABASE CustomerOrderDB;
USE CustomerOrderDB;
CREATE TABLE Customer (
 Customer_ID INT PRIMARY KEY,
 Customer_Name VARCHAR(100) NOT NULL,
 Email VARCHAR(150) NOT NULL UNIQUE,
 Phone VARCHAR(20) NOT NULL UNIQUE,
 Address VARCHAR(255) NOT NULL
);
CREATE TABLE Product (
 Product_ID INT PRIMARY KEY,
 Product_Name VARCHAR(100) NOT NULL,
 Unit_Price DECIMAL(10,2) NOT NULL CHECK (Unit_Price >= 0)
);
CREATE TABLE Orders (
 Order_ID INT PRIMARY KEY,
 Customer_ID INT NOT NULL,
 Order_Date DATE NOT NULL DEFAULT (CURRENT_DATE),
 Total_Amount DECIMAL(12,2) NOT NULL DEFAULT 0 CHECK (Total_Amount >= 0),
 Order_Status VARCHAR(20) NOT NULL DEFAULT 'Pending',
 CONSTRAINT CHK_Order_Status CHECK (Order_Status IN ('Pending','Shipped','Delivered','Cancelled')),
 CONSTRAINT FK_Orders_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
CREATE TABLE Order_Details (
 Order_Detail_ID INT PRIMARY KEY,
 Order_ID INT NOT NULL,
 Product_ID INT NOT NULL,
 Quantity INT NOT NULL CHECK (Quantity > 0),
 Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0),
 CONSTRAINT UQ_Order_Product UNIQUE (Order_ID, Product_ID),
 CONSTRAINT FK_Details_Order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID) ON DELETE CASCADE,
 CONSTRAINT FK_Details_Product FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);
INSERT INTO Customer VALUES
(1,'Arun Kumar','arun.kumar@example.com','9000000001','Tirunelveli'),
(2,'Priya Devi','priya.devi@example.com','9000000002','Chennai'),
(3,'Karthik Raj','karthik.raj@example.com','9000000003','Coimbatore'),
(4,'Meena S','meena.s@example.com','9000000004','Madurai');
INSERT INTO Product VALUES
(101,'Keyboard',750.00),(102,'Wireless Mouse',450.00),
(103,'Headphones',1200.00),(104,'USB Hub',600.00),(105,'Webcam',1800.00);
INSERT INTO Orders VALUES
(1001,1,'2026-10-01',1200.00,'Delivered'),
(1002,2,'2026-10-03',2100.00,'Shipped'),
(1003,1,'2026-10-08',1200.00,'Pending'),
(1004,3,'2026-10-10',1800.00,'Delivered'),
(1005,4,'2026-10-12',900.00,'Pending'),
(1006,2,'2026-10-15',2400.00,'Delivered');
INSERT INTO Order_Details VALUES
(1,1001,103,1,1200.00),
(2,1002,101,2,750.00),
(3,1002,102,1,600.00),
(4,1003,104,2,600.00),
(5,1004,105,1,1800.00),
(6,1005,102,2,450.00),
(7,1006,103,2,1200.00);
INSERT INTO Orders (Order_ID,Customer_ID,Order_Date,Total_Amount,Order_Status)
VALUES (1007,3,CURRENT_DATE,0,'Pending');
INSERT INTO Order_Details VALUES
(8,1007,101,1,750.00),(9,1007,104,2,600.00);
UPDATE Orders o SET Total_Amount = (
 SELECT COALESCE(SUM(d.Quantity*d.Price),0)
 FROM Order_Details d WHERE d.Order_ID=o.Order_ID
) WHERE o.Order_ID=1007;
UPDATE Orders SET Order_Status='Shipped' WHERE Order_ID=1002;
UPDATE Order_Details SET Quantity=3 WHERE Order_ID=1002 AND Product_ID=101;
UPDATE Orders o SET Total_Amount = (
 SELECT COALESCE(SUM(d.Quantity*d.Price),0)
 FROM Order_Details d WHERE d.Order_ID=o.Order_ID
);
SELECT o.Order_ID,o.Order_Date,o.Order_Status,c.Customer_Name,c.Email,
       p.Product_Name,d.Quantity,d.Price AS Unit_Price,
       d.Quantity*d.Price AS Line_Total,o.Total_Amount
FROM Orders o
JOIN Customer c ON c.Customer_ID=o.Customer_ID
JOIN Order_Details d ON d.Order_ID=o.Order_ID
JOIN Product p ON p.Product_ID=d.Product_ID
ORDER BY o.Order_ID,d.Order_Detail_ID;
UPDATE Orders SET Order_Status='Cancelled' WHERE Order_ID=1005;
DELETE FROM Orders WHERE Order_Status='Cancelled';
SELECT c.Customer_ID,c.Customer_Name,o.Order_ID,o.Order_Date,o.Order_Status,o.Total_Amount
FROM Customer c LEFT JOIN Orders o ON o.Customer_ID=c.Customer_ID
ORDER BY c.Customer_ID,o.Order_Date;
SELECT p.Product_ID,p.Product_Name,COUNT(DISTINCT d.Order_ID) AS Number_Of_Orders,
       COALESCE(SUM(d.Quantity),0) AS Total_Quantity_Sold,
       COALESCE(SUM(d.Quantity*d.Price),0) AS Sales_Amount
FROM Product p LEFT JOIN Order_Details d ON d.Product_ID=p.Product_ID
GROUP BY p.Product_ID,p.Product_Name ORDER BY p.Product_ID;
SELECT p.Product_ID,p.Product_Name,COUNT(DISTINCT d.Order_ID) AS Times_Ordered
FROM Product p LEFT JOIN Order_Details d ON d.Product_ID=p.Product_ID
GROUP BY p.Product_ID,p.Product_Name ORDER BY Times_Ordered DESC;
SELECT COALESCE(SUM(d.Quantity),0) AS Total_Quantity_Sold
FROM Order_Details d JOIN Orders o ON o.Order_ID=d.Order_ID
WHERE o.Order_Status <> 'Cancelled';
WITH CustomerOrderCounts AS (
 SELECT c.Customer_ID,c.Customer_Name,COUNT(o.Order_ID) AS Order_Count
 FROM Customer c LEFT JOIN Orders o
 ON o.Customer_ID=c.Customer_ID AND o.Order_Status <> 'Cancelled'
 GROUP BY c.Customer_ID,c.Customer_Name
)
SELECT * FROM CustomerOrderCounts
WHERE Order_Count=(SELECT MAX(Order_Count) FROM CustomerOrderCounts);
SELECT c.Customer_ID,c.Customer_Name,COALESCE(SUM(o.Total_Amount),0) AS Total_Spending
FROM Customer c LEFT JOIN Orders o
ON o.Customer_ID=c.Customer_ID AND o.Order_Status <> 'Cancelled'
GROUP BY c.Customer_ID,c.Customer_Name ORDER BY Total_Spending DESC;
SELECT ROUND(AVG(Total_Amount),2) AS Average_Order_Value
FROM Orders WHERE Order_Status <> 'Cancelled';
SELECT COALESCE(SUM(Total_Amount),0) AS Total_Sales_Amount
FROM Orders WHERE Order_Status <> 'Cancelled';
SELECT Order_ID,Customer_ID,Order_Date,Total_Amount,Order_Status
FROM Orders ORDER BY Order_ID;
