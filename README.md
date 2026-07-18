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

