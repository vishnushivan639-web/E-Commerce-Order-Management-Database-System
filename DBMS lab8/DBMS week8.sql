USE EcommerceDB;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.Email,
    c.City,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    o.Order_Status
FROM Customer c
INNER JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

SELECT
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    o.Order_Status,
    p.Payment_ID,
    p.Payment_Method,
    p.Payment_Amount,
    p.Payment_Status
FROM Orders o
INNER JOIN Payment p
ON o.Order_ID = p.Order_ID;

SELECT
    c.Customer_Name,
    o.Order_ID,
    pr.Product_ID,
    pr.Product_Name,
    od.Quantity,
    od.Price
FROM Customer c
INNER JOIN Orders o
ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
ON o.Order_ID = od.Order_ID
INNER JOIN Product pr
ON od.Product_ID = pr.Product_ID;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.Email,
    c.City,
    o.Order_ID,
    o.Order_Date,
    o.Order_Status
FROM Customer c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    c.Email,
    c.City
FROM Customer c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID
WHERE o.Order_ID IS NULL;

SELECT
    pr.Product_ID,
    pr.Product_Name,
    pr.Price,
    od.Order_ID,
    od.Quantity
FROM Product pr
LEFT JOIN Order_Details od
ON pr.Product_ID = od.Product_ID;

SELECT
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    o.Order_Status,
    c.Customer_ID,
    c.Customer_Name,
    c.Email
FROM Customer c
RIGHT JOIN Orders o
ON c.Customer_ID = o.Customer_ID;

SELECT
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount
FROM Customer c
RIGHT JOIN Orders o
ON c.Customer_ID = o.Customer_ID
WHERE c.Customer_ID IS NULL;

SELECT
    p.Payment_ID,
    p.Payment_Method,
    p.Payment_Amount,
    p.Payment_Status,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    o.Order_Status
FROM Orders o
RIGHT JOIN Payment p
ON o.Order_ID = p.Order_ID;

SELECT
    c.Customer_Name,
    pr.Product_Name,
    od.Quantity,
    o.Order_Date,
    o.Total_Amount,
    p.Payment_Status
FROM Customer c
INNER JOIN Orders o
ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
ON o.Order_ID = od.Order_ID
INNER JOIN Product pr
ON od.Product_ID = pr.Product_ID
LEFT JOIN Payment p
ON o.Order_ID = p.Order_ID;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    pr.Product_Name,
    od.Quantity,
    od.Price,
    o.Order_Date
FROM Customer c
INNER JOIN Orders o
ON c.Customer_ID = o.Customer_ID
INNER JOIN Order_Details od
ON o.Order_ID = od.Order_ID
INNER JOIN Product pr
ON od.Product_ID = pr.Product_ID
ORDER BY c.Customer_ID, o.Order_Date;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    COALESCE(SUM(o.Total_Amount), 0) AS Total_Amount_Spent
FROM Customer c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Amount_Spent DESC;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders
FROM Customer c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Orders DESC;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Total_Amount,
    o.Order_Status
FROM Customer c
INNER JOIN Orders o
ON c.Customer_ID = o.Customer_ID
WHERE o.Order_Date = (
    SELECT MAX(o2.Order_Date)
    FROM Orders o2
    WHERE o2.Customer_ID = c.Customer_ID
)
ORDER BY c.Customer_ID;

SELECT
    c.Customer_Name,
    o.Order_ID,
    o.Order_Date,
    o.Order_Status
FROM Customer c
INNER JOIN Orders o
ON c.Customer_ID = o.Customer_ID
ORDER BY o.Order_Date DESC;

SELECT
    pr.Product_Name,
    SUM(od.Quantity) AS Quantity_Sold,
    SUM(od.Quantity * od.Price) AS Total_Revenue
FROM Product pr
INNER JOIN Order_Details od
ON pr.Product_ID = od.Product_ID
INNER JOIN Orders o
ON od.Order_ID = o.Order_ID
WHERE o.Order_Status = 'Completed'
GROUP BY pr.Product_ID, pr.Product_Name
ORDER BY Total_Revenue DESC;

SELECT
    p.Payment_Method,
    COUNT(p.Payment_ID) AS Number_Of_Transactions,
    SUM(
        CASE
            WHEN p.Payment_Status = 'Paid' THEN 1
            ELSE 0
        END
    ) AS Successful_Payments
FROM Payment p
GROUP BY p.Payment_Method
ORDER BY Number_Of_Transactions DESC;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    COUNT(DISTINCT o.Order_ID) AS Total_Orders,
    COALESCE(SUM(o.Total_Amount), 0) AS Total_Spending
FROM Customer c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Spending DESC;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders
FROM Customer c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Orders DESC;

SELECT
    c.Customer_ID,
    c.Customer_Name,
    COALESCE(SUM(o.Total_Amount), 0) AS Total_Spending
FROM Customer c
LEFT JOIN Orders o
ON c.Customer_ID = o.Customer_ID
GROUP BY c.Customer_ID, c.Customer_Name
ORDER BY Total_Spending DESC;