# E-Commerce Order Management Database System

## Week 1 – Understanding the Business Problem

### Project Overview
This project focuses on analyzing the business requirements of an E-Commerce Order Management Database System. The objective is to understand the business processes of an online shopping platform and prepare a Software Requirement Specification (SRS) document that serves as the foundation for database design.

### Objectives
- Analyze the business requirements of the proposed system.
- Understand the business processes involved in an e-commerce platform.
- Identify stakeholders and their roles.
- Define functional and non-functional requirements.
- Define the project scope.
- Identify assumptions and constraints.
- Prepare a Software Requirement Specification (SRS).

### Core Entities
- Customer
- Category
- Product
- Supplier
- Order
- Order Details
- Payment
- Shipment
- Review

### Deliverables
- Requirement Analysis Report
- Business Requirement Document (BRD)
- Stakeholder Analysis
- Functional Requirements
- Non-Functional Requirements
- Project Scope
- Assumptions and Constraints
- Software Requirement Specification (SRS)

### Folder Structure

```
Week1/
│── Requirement_Analysis_Report.pdf
│── Business_Requirement_Document.pdf
│── SRS_Document.pdf
│── README.md
```

### Tools Used
- Microsoft Word
- PDF
- GitHub

### Learning Outcomes
- Business Requirement Analysis
- Requirement Specification
- Stakeholder Analysis
- Software Requirement Specification (SRS)
- Database Planning
- Documentation Skills

### Author
**Name:** A. Vishnu Lakshmi  
**Department:** Bachelor of Computer Applications (BCA)

---
**Semester Project – Database Management System (DBMS)**





# Week 2 – Entity and Relationship Analysis

## Project Title
**E-Commerce Order Management Database System**

## Overview
This repository contains the Week 2 deliverables for the **E-Commerce Order Management Database System** project. Based on the Software Requirement Specification (SRS) prepared in Week 1, this phase focuses on analyzing the entities, their attributes, primary keys, foreign keys, relationships, and cardinality required for designing the database.

## Objectives
- Identify all entities required for the system.
- Define the attributes of each entity.
- Identify Primary Keys (PK) and Foreign Keys (FK).
- Specify database constraints such as **NOT NULL**, **UNIQUE**, **CHECK**, and **DEFAULT**.
- Analyze relationships between entities.
- Define relationship cardinalities.
- Prepare an Entity and Relationship Analysis Report.

## Core Entities
- Customer
- Category
- Product
- Supplier
- Order
- Order Details
- Payment
- Shipment
- Review

## Deliverables
- Entity Analysis Report
- Entity Relationship Analysis Report

## Folder Structure

```text
Week2/
│── Entity_Analysis_Report.pdf
│── Entity_Relationship_Analysis.pdf
└── README.md
```

## Entity Relationships

| Parent Entity | Child Entity | Relationship | Cardinality |
|---------------|-------------|--------------|-------------|
| Customer | Order | Places | One-to-Many |
| Category | Product | Contains | One-to-Many |
| Supplier | Product | Supplies | One-to-Many |
| Order | Order Details | Contains | One-to-Many |
| Product | Order Details | Included In | One-to-Many |
| Order | Payment | Has | One-to-One |
| Order | Shipment | Has | One-to-One |
| Customer | Review | Writes | One-to-Many |
| Product | Review | Receives | One-to-Many |

## Technologies Used
- Database Design
- Entity Relationship Analysis
- Microsoft Word
- PDF Documentation
- GitHub

## Learning Outcomes
- Entity Identification
- Attribute Analysis
- Primary Key and Foreign Key Identification
- Database Constraints
- Relationship Analysis
- Cardinality Analysis
- Database Design Fundamentals

## Author
**A. Vishnu Lakshmi**


# E-Commerce Order Management Database System

## 📌 Week 3 – Entity Relationship (ER) Diagram and Relational Schema Design


## 📖 Project Overview

This repository contains the Week 3 submission for the **E-Commerce Order Management Database System**. The objective of this week is to design the Entity Relationship (ER) Diagram and convert the conceptual database model into a Relational Schema.

The ER Diagram illustrates the entities, attributes, relationships, primary keys, foreign keys, cardinality, and participation constraints of the system. The Relational Schema represents the logical structure of the database tables that will be implemented in the upcoming weeks.

---

## 🎯 Objectives

- Design the complete Entity Relationship (ER) Diagram.
- Represent all entities with their attributes.
- Identify Primary Keys (PK) and Foreign Keys (FK).
- Define relationships between entities.
- Specify relationship cardinality.
- Apply participation constraints.
- Convert the ER model into a Relational Schema.
- Verify the correctness of the relational model.

---

## 📂 Project Files

```
Week3/
│── ER_Diagram.png
│── Relational_Schema.pdf
│── ER_Design_Report.pdf
│── Relationship_Mapping_Report.pdf
│── README.md
```

---

## 🗂️ Core Entities

- Customer
- Category
- Product
- Supplier
- Order
- Order Details
- Payment
- Shipment
- Review

---

## 🛠️ Tools Used

- Microsoft Word
- Draw.io
- Git
- GitHub

---

## 📌 Learning Outcomes

- Understood the concepts of Entity Relationship Modeling.
- Identified entities, attributes, and relationships.
- Designed an ER Diagram with proper cardinality and participation constraints.
- Converted the ER model into a Relational Schema.
- Prepared the database design documentation for SQL implementation.

---

## 📜 License

This project is developed for academic purposes as part of the Database Management System (DBMS) course.


## Author
**A. Vishnu Lakshmi**










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

















# Payment Management System

## Project Overview
The Payment Management System is a MySQL-based project that extends the existing Customer Order Management System. It manages payment transactions, payment modes, payment statuses, and revenue reports.

## Objectives
- Create and manage payment records.
- Link payments with existing customer orders.
- Store different payment modes.
- Update payment transaction statuses.
- Generate payment and revenue analysis reports.
- Maintain payment history for customers.

## Technologies Used
- MySQL 8.0+
- SQL
- MySQL Workbench

## Database Name
`CustomerOrderDB`

## Tables Used
- **Customer:** Stores customer information.
- **Product:** Stores product details.
- **Orders:** Stores customer order information.
- **Order_Details:** Stores products included in each order.
- **Payment:** Stores payment transaction information.

## Payment Table Structure
- `Payment_ID` – Primary Key
- `Order_ID` – Foreign Key referencing Orders
- `Payment_Date` – Date of payment
- `Payment_Mode` – Payment method
- `Payment_Status` – Transaction status
- `Transaction_Amount` – Payment amount

## Payment Modes
- UPI
- Credit Card
- Debit Card
- Net Banking
- Cash on Delivery

## Payment Status
- Pending
- Success
- Failed

## Constraints
- Primary Key
- Foreign Key
- NOT NULL
- UNIQUE
- CHECK

The UNIQUE constraint on `Order_ID` ensures that each order has at most one payment record.

## Features
- Insert new payment transactions.
- Display all successful payments.
- Find failed and pending transactions.
- Update payment status after a retry.
- Count successful and failed transactions.
- Display complete payment details with customer and order information.
- Generate payment mode analysis reports.
- Calculate total successful payment revenue.
- Calculate revenue by payment method.
- Generate customer payment history.
- Find orders with failed or pending payments.

## How to Execute the Project
1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to the database server.
3. Execute the existing `customer_order_management.sql` file first.
4. Open the `payment_management.sql` file.
5. Execute the SQL script.
6. View the output of the payment queries.
7. Capture screenshots of the query results for project submission.

## Reports Generated
- Number of transactions by payment mode.
- Most preferred payment method.
- Total successful payment revenue.
- Revenue by payment method.
- Average transaction amount.
- Customer payment history.
- Successful, failed, and pending transaction counts.
- Orders with failed or pending payments.

## Project Files
- `payment_management.sql` – SQL script for payment table creation, sample data, transaction operations, and reports.
- `Payment_Management_Documentation.pdf` – Project documentation.
- `README.md` – Project overview and execution instructions.

## Conclusion
The Payment Management System demonstrates database table creation, relational constraints, SQL joins, transaction status management, and payment revenue analysis. It integrates with the existing Customer Order Management System and is suitable for a DBMS mini-project.
