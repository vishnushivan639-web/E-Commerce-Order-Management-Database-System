CREATE DATABASE IF NOT EXISTS EcommerceReviewsDB;
USE EcommerceReviewsDB;
DROP TABLE IF EXISTS Review;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE
);
CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(150) NOT NULL,
    Price DECIMAL(10,2) NOT NULL CHECK (Price >= 0)
);
CREATE TABLE Review (
    Review_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Review_Text VARCHAR(1000) NOT NULL,
    Review_Date DATE NOT NULL DEFAULT (CURRENT_DATE),

    CONSTRAINT fk_review_customer
        FOREIGN KEY (Customer_ID)
        REFERENCES Customer(Customer_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_review_product
        FOREIGN KEY (Product_ID)
        REFERENCES Product(Product_ID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
INSERT INTO Customer (Customer_ID, Customer_Name, Email)
VALUES
(1, 'Arun', 'arun@example.com'),
(2, 'Priya', 'priya@example.com'),
(3, 'Kumar', 'kumar@example.com'),
(4, 'Divya', 'divya@example.com'),
(5, 'Meena', 'meena@example.com');
INSERT INTO Product (Product_ID, Product_Name, Price)
VALUES
(101, 'Laptop', 55000.00),
(102, 'Smartphone', 25000.00),
(103, 'Headphones', 2000.00),
(104, 'Keyboard', 1500.00),
(105, 'Mouse', 800.00);
INSERT INTO Review
(Customer_ID, Product_ID, Rating, Review_Text, Review_Date)
VALUES
(1, 101, 5, 'Excellent performance', '2026-10-01'),
(2, 101, 4, 'Good product', '2026-10-05'),
(3, 101, 5, 'Very useful laptop', '2026-10-10'),
(2, 102, 4, 'Good battery life', '2026-10-12'),
(4, 102, 3, 'Average performance', '2026-10-15'),
(1, 103, 5, 'Excellent sound quality', '2026-10-17'),
(3, 103, 2, 'Sound needs improvement', '2026-10-18'),
(5, 104, 4, 'Comfortable to use', '2026-10-20'),
(4, 105, 1, 'Not working properly', '2026-10-22'),
(5, 101, 5, 'Worth buying', '2026-10-25');
SELECT * FROM Customer;
SELECT * FROM Product;
SELECT * FROM Review;
INSERT INTO Review
(Customer_ID, Product_ID, Rating, Review_Text)
VALUES (3, 105, 4, 'Good value for money');
SELECT r.Review_ID, p.Product_Name, c.Customer_Name,
       r.Rating, r.Review_Text, r.Review_Date
FROM Review r
JOIN Customer c ON r.Customer_ID = c.Customer_ID
JOIN Product p ON r.Product_ID = p.Product_ID
WHERE r.Product_ID = 101
ORDER BY r.Review_Date DESC;
SELECT c.Customer_Name, p.Product_Name,
       r.Rating, r.Review_Text, r.Review_Date
FROM Review r
JOIN Customer c ON r.Customer_ID = c.Customer_ID
JOIN Product p ON r.Product_ID = p.Product_ID
ORDER BY c.Customer_Name;
SELECT c.Customer_Name, p.Product_Name,
       r.Rating, r.Review_Text, r.Review_Date
FROM Review r
JOIN Customer c ON r.Customer_ID = c.Customer_ID
JOIN Product p ON r.Product_ID = p.Product_ID
ORDER BY r.Review_Date DESC, r.Review_ID DESC
LIMIT 5;
SELECT * FROM Review WHERE Rating > 4;
UPDATE Review
SET Review_Text = 'Excellent quality and performance'
WHERE Review_ID = 1;
UPDATE Review
SET Rating = 4
WHERE Review_ID = 2;
DELETE FROM Review WHERE Review_ID = 10;
SELECT p.Product_ID, p.Product_Name,
       ROUND(AVG(r.Rating), 2) AS Average_Rating
FROM Product p
LEFT JOIN Review r ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID, p.Product_Name;
SELECT p.Product_ID, p.Product_Name,
       COUNT(r.Review_ID) AS Number_Of_Reviews
FROM Product p
LEFT JOIN Review r ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID, p.Product_Name;
SELECT p.Product_ID, p.Product_Name,
       ROUND(AVG(r.Rating), 2) AS Average_Rating
FROM Product p
JOIN Review r ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID, p.Product_Name
HAVING AVG(r.Rating) = (
    SELECT MAX(avg_rating)
    FROM (
        SELECT AVG(Rating) AS avg_rating
        FROM Review
        GROUP BY Product_ID
    ) AS ratings
);
SELECT p.Product_ID, p.Product_Name,
       ROUND(AVG(r.Rating), 2) AS Average_Rating
FROM Product p
JOIN Review r ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID, p.Product_Name
HAVING AVG(r.Rating) > 4;
SELECT p.Product_ID, p.Product_Name,
       COUNT(r.Review_ID) AS Review_Count
FROM Product p
JOIN Review r ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID, p.Product_Name
HAVING COUNT(r.Review_ID) = (
    SELECT MAX(review_count)
    FROM (
        SELECT COUNT(*) AS review_count
        FROM Review
        GROUP BY Product_ID
    ) AS review_totals
);
SELECT p.Product_ID, p.Product_Name,
       ROUND(AVG(r.Rating), 2) AS Average_Rating
FROM Product p
JOIN Review r ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID, p.Product_Name
HAVING AVG(r.Rating) < 3;
SELECT
    SUM(CASE WHEN Rating = 5 THEN 1 ELSE 0 END) AS Five_Star,
    SUM(CASE WHEN Rating = 4 THEN 1 ELSE 0 END) AS Four_Star,
    SUM(CASE WHEN Rating <= 2 THEN 1 ELSE 0 END) AS Low_Rated
FROM Review;
SELECT p.Product_ID, p.Product_Name,
       COUNT(r.Review_ID) AS Number_Of_Reviews,
       ROUND(AVG(r.Rating), 2) AS Average_Rating
FROM Product p
LEFT JOIN Review r ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID, p.Product_Name
ORDER BY Average_Rating DESC;
SELECT c.Customer_ID, c.Customer_Name,
       COUNT(r.Review_ID) AS Reviews_Given,
       ROUND(AVG(r.Rating), 2) AS Average_Rating_Given,
       SUM(CASE WHEN r.Rating = 5 THEN 1 ELSE 0 END)
           AS Five_Star_Reviews
FROM Customer c
LEFT JOIN Review r ON c.Customer_ID = r.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Reviews_Given DESC;
