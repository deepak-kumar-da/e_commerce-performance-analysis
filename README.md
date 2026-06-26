# E-Commerce Performance Analysis

## Project Overview

E-commerce businesses generate large volumes of transactional data every day, making it challenging to monitor sales performance, customer behavior, product demand, and operational efficiency. Without a centralized analytical dashboard, identifying business trends and making informed decisions becomes time-consuming.

This project analyzes the Brazilian Olist E-Commerce dataset and transforms raw transactional data into an interactive business intelligence dashboard. By integrating data from multiple related tables, the dashboard provides actionable insights into revenue, customer activity, product performance, seller distribution, payment preferences, and order trends, enabling stakeholders to make data-driven business decisions.

---

## Why This Analysis Matters

This dashboard helps answer key business questions such as:

- Which cities generate the highest revenue?
- Which product categories drive the most sales?
- How are orders changing over time?
- Which payment methods are preferred by customers?
- Which sellers contribute the most orders?
- How satisfied are customers based on review scores?
- How is business performance evolving year over year?

These insights can support strategic planning, inventory management, regional expansion, marketing campaigns, and customer experience improvements.

---

## Dataset

**Dataset Name:** Brazilian E-Commerce Public Dataset by Olist

**Source:**
https://storage.googleapis.com/brazilian-ecommerce/index.html

### Dataset Description

The Olist dataset contains transactional information from a Brazilian multi-vendor marketplace between 2016 and 2018. It consists of approximately 100,000 orders distributed across multiple relational tables covering customers, sellers, products, payments, reviews, geolocation, and order details.

---

## Tech Stack

- SQL Server
- Python
- Pandas
- NumPy
- Jupyter Notebook
- Tableau
- Git
- GitHub

---

## Data Model

> *(Insert Data Model Diagram Here)*

---

## Database Schema

> *(Insert Schema Tree / ER Diagram Here)*

---

# Dashboard Pages

### Executive Overview

Provides an executive summary of marketplace performance using business KPIs including:

- Total Revenue
- Total Customers
- Total Products
- Total Sellers
- Average Order Value
- Revenue Trend
- Geographic Customer Distribution

---

### Product Analysis

Analyzes product performance across different categories.

Includes:

- Sales by Product Category
- Orders by Product Category
- Products Sold by Year
- Freight Cost Distribution

---

### Customer Analysis

Focuses on customer purchasing behavior and satisfaction.

Includes:

- Monthly Order Trend
- Sales by Customer City
- Payment Method Analysis
- Customer Review Analysis

---

### Order Analysis

Provides operational insights into order and seller performance.

Includes:

- Orders by City
- Top Selling Cities
- Seller Distribution
- Average Customer Reviews by City

---

# Key Insights

- Revenue experienced significant growth between 2016 and 2018.
- São Paulo contributed the highest sales revenue and order volume.
- Credit Card was the most frequently used payment method.
- Bed Bath Table, Health Beauty, and Computer Accessories generated the highest revenue.
- Customer review scores remained consistently around 4.0, indicating positive customer satisfaction.
- Major metropolitan cities accounted for the largest share of marketplace activity.
- Product demand varied across months, highlighting seasonal purchasing patterns.

---

# Repository Structure

```
E-Commerce-Performance-Analysis/
│
├── Dataset/
│   ├── Raw Data
│   └── Processed Data
│
├── SQL/
│   ├── 01_Database_Creation.sql
│   ├── 02_Raw_Tables.sql
│   ├── 03_Cleaned_Tables.sql
│   ├── 04_Bronze_Stored_Procedures.sql
│   ├── 05_Silver_Stored_Procedures.sql
│   ├── 06_Views.sql
│   └── 07_Exploratory_Data_Analysis.sql
│
├── Python/
│   └── Data_Cleaning.ipynb
│
├── Tableau/
│   └── E-Commerce_Performance_Analysis.twbx
│
├── Images/
│   ├── Overview.png
│   ├── Products.png
│   ├── Customers.png
│   ├── Orders.png
│   ├── Data_Model.png
│   └── Schema.png
│
└── README.md
```

---

# Future Improvements

- Develop customer segmentation using RFM analysis.
- Build predictive sales forecasting models.
- Create seller performance scorecards.
- Automate the ETL pipeline using scheduled SQL procedures.
- Deploy the dashboard on Tableau Public or Power BI Service for real-time reporting.
