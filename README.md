# 🍫 Chocolate Sales Analysis using SQL

## 📌 Project Overview

This project focuses on analyzing a chocolate sales dataset using SQL to extract meaningful business insights. The analysis covers sales performance, customer behavior, product profitability, store performance, and revenue trends across different regions.

The goal of this project is to demonstrate practical SQL skills in data exploration, aggregation, joins, subqueries, and business intelligence reporting.

---

## 🎯 Objectives

The analysis aims to answer key business questions such as:

- How many orders and customers exist in the business?
- Which products and brands generate the highest revenue and profit?
- Which stores, cities, and countries perform best?
- How do loyalty members contribute to revenue?
- What customer demographics influence sales performance?
- Which product categories drive the most sales volume?

---

## 🛠️ Tools & Technologies

- SQL Server (T-SQL)
- SQL Joins
- Aggregate Functions
- Subqueries
- Data Exploration
- Business Intelligence Reporting

---

## 📂 Dataset Structure

The project uses four main tables:

### Sales Table
Contains transactional sales records.

| Column | Description |
|----------|-------------|
| Order_ID | Unique order identifier |
| Order_Date | Date of purchase |
| Product_ID | Product sold |
| Customer_ID | Customer who purchased |
| Store_ID | Store where sale occurred |
| Quantity | Units sold |
| Unit_Price | Product price |
| Discount | Applied discount |
| Revenue | Total revenue |
| Profit | Profit generated |

---

### Products Table

Contains product information.

| Column | Description |
|----------|-------------|
| Product_ID | Unique product identifier |
| Product_Name | Product name |
| Brand | Product brand |
| Category | Product category |
| Cocoa_Percent | Cocoa content |
| Weight_G | Product weight |

---

### Customers Table

Contains customer demographic information.

| Column | Description |
|----------|-------------|
| Customer_ID | Unique customer identifier |
| Gender | Customer gender |
| Age | Customer age |
| Loyalty_Member | Loyalty membership status |

---

### Stores Table

Contains store information.

| Column | Description |
|----------|-------------|
| Store_ID | Unique store identifier |
| Store_Name | Store name |
| City | Store city |
| Country | Store country |
| Store_Type | Type of store |

---

## 🔍 Analysis Performed

### Data Exploration

- Total Orders
- Total Customers
- Product Categories
- Store Locations
- High Cocoa Products
- Products by Brand

### Sales Analysis

- Total Revenue
- Total Profit
- Minimum & Maximum Profit
- Revenue by Store
- Revenue by Country
- Revenue by Loyalty Status

### Product Performance

- Top Selling Products
- Quantity Sold by Category
- Most Profitable Brand
- Products Above Average Price

### Store Performance

- Revenue by Store
- Revenue by Store Type
- Orders by City
- Country Performance Analysis

### Customer Analysis

- Revenue by Loyalty Members
- Revenue by Gender
- Customer Purchase Behavior
- Average Customer Age Analysis

---

## 📊 SQL Concepts Demonstrated

### Aggregate Functions

```sql
SUM()
COUNT()
AVG()
MIN()
MAX()
```

### Joins

```sql
INNER JOIN
```

### Filtering

```sql
WHERE
HAVING
```

### Sorting

```sql
ORDER BY
```

### Grouping

```sql
GROUP BY
```

### Subqueries

```sql
SELECT *
FROM products
WHERE unit_price >
(
    SELECT AVG(unit_price)
    FROM products
);
```

---

## 📈 Key Business Insights Generated

- Identified top-performing products and brands.
- Determined highest revenue-generating countries.
- Evaluated store performance across locations.
- Measured loyalty member contribution to sales.
- Compared purchasing behavior across customer demographics.
- Analyzed profitability across product categories.

---

## 🚀 Business Value

This analysis helps stakeholders:

- Optimize product inventory.
- Improve marketing strategies.
- Enhance customer retention programs.
- Identify profitable locations.
- Increase revenue through data-driven decisions.

---

## 📁 Repository Structure

```text
Chocolate-Sales-SQL-Project/
│
├── Chocolate Sale Dataset.sql
├── README.md
└── Project Screenshots/
```

---

## 💡 Future Improvements

- Build interactive Power BI dashboard.
- Create sales forecasting models.
- Implement customer segmentation analysis.
- Perform advanced profitability analysis.
- Develop KPI monitoring dashboard.

---

## 👨‍💻 Author

**Kayode Peace**

Data Analyst | SQL | Excel | Power BI

### Skills

- SQL Query Optimization
- Data Cleaning
- Data Visualization
- Business Intelligence
- Dashboard Development
- Data Storytelling

---

## ⭐ Project Status

Completed ✅

This project demonstrates practical SQL skills for real-world business analysis and data-driven decision-making.
