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





## Week 3 - Entity Relationship (ER) Diagram and Relational Schema Design

### Description
This week's submission includes the Entity Relationship (ER) Diagram and Relational Schema for the E-Commerce Order Management Database System.

### Submitted Files
- ER_Diagram.png
- Relational_Schema.pdf
- ER_Design_Report.pdf
- Relationship_Mapping_Report.pdf

E-Commerce-Order-Management-Database-System/
│
├── Week1/
├── Week2/
└── Week3/
    ├── ER_Diagram.png
    ├── Relational_Schema.pdf
    ├── ER_Design_Report.pdf
    ├── Relationship_Mapping_Report.pdf
    └── README.md



### Objective
The objective of Week 3 is to design the ER Diagram, identify entities and relationships, define primary and foreign keys, specify cardinality and participation constraints, and convert the ER model into a Relational Schema for database implementation.


## Author
**A. Vishnu Lakshmi**

