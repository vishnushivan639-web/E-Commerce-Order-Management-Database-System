Payment Management Module
Project Overview
This project extends the existing Customer Order Management System by adding a payment transaction module in MySQL. It stores payment details for each order, tracks payment modes and statuses, and produces transaction and revenue analysis reports.
Requirements
- MySQL 8.0 or later
- MySQL Workbench or MySQL command-line client
- The existing CustomerOrderDB created by customer_order_management.sql
Database Design
The new Payment table contains:
Column	Purpose
Payment_ID	Primary key identifying a payment
Order_ID	Foreign key to Orders; also UNIQUE to allow at most one payment record per order
Payment_Date	Date of the transaction
Payment_Mode	UPI, Credit Card, Debit Card, Net Banking, or Cash on Delivery
Payment_Status	Pending, Success, or Failed
Transaction_Amount	Non-negative amount for the transaction


Relationships and Constraints
- Orders to Payment: one order can have zero or one payment record.
- PRIMARY KEY: uniquely identifies each payment.
- FOREIGN KEY: ensures every payment refers to an existing order.
- NOT NULL: required fields cannot be left empty.
- UNIQUE(Order_ID): prevents more than one payment record for an order.
- CHECK: restricts payment modes, statuses, and non-negative transaction amounts.
Files
- payment_management.sql — creates the Payment table, inserts sample payment data, demonstrates status updates, and runs payment analysis queries.
- Payment_Management_Documentation.pdf — documentation with schema, relationship diagram, sample data, and report descriptions.
- customer_order_management.sql — existing base order-management database script.
How to Run
1. Open MySQL Workbench and connect to your MySQL server.
2. Run customer_order_management.sql first to create and populate CustomerOrderDB.
3. Open payment_management.sql and execute it.
4. Review the result grids for each SELECT report.
5. Capture screenshots of the Payment table, complete payment details, status counts, and revenue reports for submission.
Important: The base customer_order_management.sql script contains DROP DATABASE IF EXISTS CustomerOrderDB; running it recreates the database and deletes existing data in that database. Back up important data first. The payment add-on itself does not drop the database.
Reports Included
- Successful payments
- Failed and pending transactions
- Payment details for a specified order
- Successful and failed transaction counts
- Complete payment, order, and customer details
- Transactions by payment mode and most preferred mode
- Total successful payment revenue
- Successful revenue by payment method
- Average transaction amount
- Customer payment history
- Status-wise transaction totals
- Orders with failed or pending payments
Notes
- Revenue reports count only payments with status Success.
- The “most preferred payment method” report counts all payment records, regardless of status.
- UNIQUE(Order_ID) models at most one payment record per order. A real payment gateway that stores every retry attempt would normally use a separate transaction-attempt table.
- Query output screenshots must be captured after running the script in MySQL Workbench; the PDF provides a screenshot checklist rather than fabricated screenshots.
Conclusion
The Payment Management Module integrates with the existing order database and demonstrates relational constraints, payment status management, SQL joins, aggregation, and revenue analysis.
