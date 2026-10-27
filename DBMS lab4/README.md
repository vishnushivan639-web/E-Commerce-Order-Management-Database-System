# Customer Order Management System

## Project Overview
The Customer Order Management System is a database project developed using MySQL. It manages customer information, product details, customer orders, and order items. It helps track purchases, calculate order totals, and generate useful sales reports.

## Objectives
- Store and manage customer information.
- Maintain product details and prices.
- Create and manage customer orders.
- Handle multiple products within an order.
- Calculate order totals.
- Generate customer-wise and product-wise reports.
- Track order status and sales information.

## Technologies Used
- **Database:** MySQL 8.0+
- **Language:** SQL
- **Tool:** MySQL Workbench or MySQL Command Line Client

## Database Structure

The database name is `CustomerOrderDB`.

| Table | Description |
|---|---|
| `Customer` | Stores customer details. |
| `Product` | Stores product names, prices, and stock details. |
| `Orders` | Stores order dates, customer references, totals, and status. |
| `Order_Details` | Stores products and quantities included in each order. |

## Key Features
- Primary keys and foreign keys for relationships.
- `NOT NULL`, `UNIQUE`, and `CHECK` constraints.
- Sample customer, product, and order data.
- Order creation and modification.
- Order total calculation.
- Customer order history.
- Product-wise sales reports.
- Customer spending and order summary reports.
- Order cancellation demonstration.

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your database server.
3. Open the `customer_order_management.sql` file.
4. Review the script before executing it.
5. Execute the SQL script.
6. Refresh the Schemas panel and locate `CustomerOrderDB`.
7. Run the report queries to view the results.

**Important:** The script includes `DROP DATABASE IF EXISTS CustomerOrderDB`. Running it will delete an existing database with that name and recreate it. Back up any important data first.

## Sample Reports
- Complete order details with customer and product information.
- Customer-wise order history.
- Product-wise order quantities and sales.
- Total orders placed by each customer.
- Total spending by each customer.
- Average order value and total sales.

## Project Files
- `customer_order_management.sql` — SQL script for creating tables, inserting sample data, and executing queries.
- `Customer_Order_Management_Documentation.pdf` — Project documentation containing the database design, relationships, examples, and suggested screenshots.
- `README.md` — Project overview and execution instructions.

## Conclusion
This project demonstrates relational database design, SQL queries, table relationships, data manipulation, and sales reporting. It can be used as a beginner-level DBMS mini-project for academic purposes.
