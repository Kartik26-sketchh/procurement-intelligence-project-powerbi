# Procurement Intelligence & Decision Support System

An end-to-end Business Intelligence project designed to support procurement and vendor-related decision-making for a multi-store beverage retailer.

## Business Problem

The business needs better visibility into procurement spend, vendor dependency, procurement cost drivers, inventory exposure, and product-level performance.

The objective of this project is to transform transactional data into structured analysis and decision-support insights for procurement and inventory-related decisions.

## Business Objectives

- Identify high-spend and strategically important vendors
- Analyze vendor dependency and performance
- Evaluate procurement cost drivers such as purchase price and freight
- Identify purchase-versus-sales variations across vendors
- Highlight products with high inventory exposure
- Identify high-sales products with relatively low inventory
- Support procurement and inventory planning decisions with data-driven insights

## Project Approach

The project follows an end-to-end Business Analyst and BI workflow:

**Business Problem → BRD → FRD → Business Questions → SQL Analysis → Data Validation & QA → Power BI → Insights & Recommendations**

## Requirements & Analysis

The project includes:

- Business Requirements Document (BRD)
- Functional Requirements Document (FRD)
- 17 validated SQL analytical questions
- Data validation and reconciliation
- Power BI decision-support dashboard

## Dashboard

The Power BI solution contains four analytical pages:

### 1. Executive Procurement Overview
Provides a high-level view of procurement spend, key vendors, store sales contribution, and procurement-sales alignment.

### 2. Vendor Performance & Dependency
Analyzes vendor dependency, product breadth, lead time, and overall vendor value.

### 3. Procurement Spend & Cost Analysis
Examines freight cost, purchase price variation, purchase-versus-sales differences, and tax-to-sales exposure.

### 4. Product & Inventory Intelligence
Highlights high-ending-inventory products, high-sales/low-inventory products, product-level gross profit concentration, and sales-inventory alignment.

## Key Insights

- Procurement spend is concentrated among a limited number of key vendors.
- Procurement quantity is significantly concentrated among a small number of vendors.
- Vendor lead times vary, creating different planning requirements.
- Average purchase prices vary across vendors, creating potential opportunities for benchmarking and negotiation.
- Purchase value versus sales value varies across vendors and requires consideration of inventory movement and transaction timing.
- A subset of products carries substantially higher ending inventory.
- Several high-selling products have relatively low ending inventory and may require closer replenishment attention.
- Gross profit is concentrated among a group of high-performing products.

## Business Recommendations

1. Monitor vendor concentration and evaluate alternative sourcing where feasible.
2. Benchmark purchase prices for comparable products and investigate negotiation opportunities.
3. Review high-ending-inventory products against sales velocity before additional purchasing.
4. Prioritize replenishment reviews for high-sales/low-inventory products.
5. Use vendor performance indicators together rather than relying on a single metric.

## Tools & Technologies

- **SQL Server** — analytical queries and business analysis
- **Power BI** — dashboard and decision-support reporting
- **DAX** — analytical measures
- **Power Query** — data preparation
- **Excel** — supporting analysis
- **GitHub / GitHub Desktop** — project version control and documentation

## Project Files

- `Procurement_intelligence.pbix` — Power BI dashboard
- `Procurement_Intelligence_businessBRD.docx` — Business Requirements Document
- `Procurement_IntelligencefunctionFRD.docx` — Functional Requirements Document
- `SQL/` — SQL analytical queries
- `Screenshots/` — dashboard views and supporting visuals
- `Documentation/` — additional project documentation

## Skills Demonstrated

**Business Analysis:** Requirements gathering, BRD, FRD, business questions, business rules, traceability

**Data Analysis:** SQL querying, aggregation, comparative analysis, validation and reconciliation

**Business Intelligence:** Power BI, DAX, Power Query, dashboard design, KPI analysis

**Decision Support:** Insight generation, business interpretation and actionable recommendations

## Project Objective

The goal of this project was not simply to create a dashboard, but to demonstrate how a business problem can be translated into measurable analytical questions and ultimately into a decision-support solution.
