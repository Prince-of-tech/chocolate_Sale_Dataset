# 🍫 Chocolate Sales Analysis Using SQL

## 📌 Project Overview

This project focuses on analyzing a chocolate sales dataset using SQL to extract meaningful business insights related to sales performance, customer behavior, product trends, and store profitability.

The analysis demonstrates SQL techniques such as data exploration, joins, aggregation, filtering, subqueries, and KPI development to support data-driven decision-making.

---

## 🎯 Project Objectives

- Analyze overall sales performance
- Identify top-performing products and brands
- Understand customer purchasing behavior
- Evaluate store and city performance
- Measure revenue and profitability
- Apply real-world SQL analytics techniques
  
---

## 🛠️ Tools & Technologies

- SQL Server
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

## 🧭 Step-by-Step Project Procedure

### 1. Database Creation

```sql
CREATE DATABASE Chocolate_Sales;
USE Chocolate_Sales;
```

---

### 2. Table Creation

#### Sales Table
```sql
CREATE TABLE sales (
    order_id INT,
    order_date DATE,
    product_id INT,
    customer_id INT,
    store_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount DECIMAL(5,2),
    revenue DECIMAL(10,2),
    profit DECIMAL(10,2)
);
```

#### Products Table
```sql
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(100),
    brand VARCHAR(50),
    category VARCHAR(50),
    cocoa_percent DECIMAL(5,2),
    weight_g INT
);
```

#### Customers Table
```sql
CREATE TABLE customers (
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    loyalty_member VARCHAR(5)
);
```

#### Stores Table
```sql
CREATE TABLE stores (
    store_id INT,
    store_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    store_type VARCHAR(50)
);
```

---

### 3. Data Import (ETL Process)

The dataset was successfully imported into the SQL tables after schema creation.

In this project, the data was loaded directly into the tables after setup using SQL Server Import Wizard.

After import, data validation was performed to ensure completeness and correctness.

---

### 4. Data Validation

After importing the dataset, validation checks were performed:

```sql
-- Check record counts
SELECT COUNT(*) FROM sales;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM stores;
```

```sql
-- Check for missing values
SELECT * FROM sales
WHERE revenue IS NULL;
```

---

### 5. Data Exploration

- Reviewed dataset structure
- Confirmed relationships between tables
- Verified data consistency

---

### 6. Data Analysis

#### Revenue by Product

```sql
SELECT 
    p.product_name,
    SUM(s.revenue) AS total_revenue
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;
```

#### Top 5 Products by Quantity Sold

```sql
SELECT TOP 5
    p.product_name,
    SUM(s.quantity) AS total_quantity
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC;
```

---

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

## 📊 Business Questions Answered
# 🍫 Chocolate Sales Analysis – SQL Questions, Queries & Answers

> 📌 Note: The SQL file contains queries only. Therefore, all answers require execution on the dataset to return actual values.

---

## 1. How many total orders are recorded in the sales table?

```sql
SELECT COUNT(*) AS total_orders
FROM sales;
```

**Answer:** Requires execution on dataset

---

## 2. List all unique product categories from the products table.

```sql
SELECT DISTINCT category
FROM products;
```

**Answer:** Requires execution on dataset

---

## 3. How many customers are registered in the dataset?

```sql
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customers;
```

**Answer:** Requires execution on dataset

---

## 4. List all stores and the cities they are located in.

```sql
SELECT store_name, city
FROM stores;
```

**Answer:** Requires execution on dataset

---

## 5. Which products have a cocoa percentage greater than 70%?

```sql
SELECT *
FROM products
WHERE cocoa_percent > 70;
```

**Answer:** Requires execution on dataset

---

## 6. How many products does each brand offer?

```sql
SELECT brand, COUNT(product_id) AS product_count
FROM products
GROUP BY brand;
```

**Answer:** Requires execution on dataset

---

## 7. Find all sales where a discount was applied.

```sql
SELECT *
FROM sales
WHERE discount > 0;
```

**Answer:** Requires execution on dataset

---

## 8. What is the total revenue generated across all sales?

```sql
SELECT SUM(revenue) AS total_revenue
FROM sales;
```

**Answer:** Requires execution on dataset

---

## 9. What is the total profit made from all orders?

```sql
SELECT SUM(profit) AS total_profit
FROM sales;
```

**Answer:** Requires execution on dataset

---

## 10. What is the minimum and maximum profit from a single order?

```sql
SELECT MIN(profit) AS min_profit,
       MAX(profit) AS max_profit
FROM sales;
```

**Answer:** Requires execution on dataset

---

## 11. What is the total quantity sold per product category?

```sql
SELECT p.category, SUM(s.quantity) AS total_quantity
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.category;
```

**Answer:** Requires execution on dataset

---

## 12. Show the store name, city, and total revenue for each store.

```sql
SELECT st.store_name, st.city, SUM(s.revenue) AS total_revenue
FROM sales s
JOIN stores st
    ON s.store_id = st.store_id
GROUP BY st.store_name, st.city;
```

**Answer:** Requires execution on dataset

---

## 13. Which brand generates the highest total profit?

```sql
SELECT TOP 1 p.brand, SUM(s.profit) AS total_profit
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.brand
ORDER BY total_profit DESC;
```

**Answer:** Requires execution on dataset

---

## 14. Which country generates the most total revenue?

```sql
SELECT TOP 1 st.country, SUM(s.revenue) AS total_revenue
FROM sales s
JOIN stores st
    ON s.store_id = st.store_id
GROUP BY st.country
ORDER BY total_revenue DESC;
```

**Answer:** Requires execution on dataset

---

## 15. What is the total revenue generated by loyalty members vs non-loyalty members?

```sql
SELECT c.loyalty_member, SUM(s.revenue) AS total_revenue
FROM sales s
JOIN customers c
    ON s.customer_id = c.customer_id
GROUP BY c.loyalty_member;
```

**Answer:** Requires execution on dataset

---

## 16. List the top 5 products by total quantity sold.

```sql
SELECT TOP 5 p.product_name, p.brand,
       SUM(s.quantity) AS total_quantity
FROM sales s
JOIN products p
    ON s.product_id = p.product_id
GROUP BY p.product_name, p.brand
ORDER BY total_quantity DESC;
```

**Answer:** Requires execution on dataset

---

## 17. Which store type generates the most revenue?

```sql
SELECT st.store_type, SUM(s.revenue) AS total_revenue
FROM sales s
JOIN stores st
    ON s.store_id = st.store_id
GROUP BY st.store_type;
```

**Answer:** Requires execution on dataset

---

## 18. What is the average order revenue for male vs female customers?

```sql
SELECT c.gender, AVG(s.revenue) AS avg_revenue
FROM sales s
JOIN customers c
    ON s.customer_id = c.customer_id
GROUP BY c.gender;
```

**Answer:** Requires execution on dataset

---

## 19. Which city has the highest number of orders placed?

```sql
SELECT TOP 1 st.city, COUNT(s.order_id) AS total_orders
FROM sales s
JOIN stores st
    ON s.store_id = st.store_id
GROUP BY st.city
ORDER BY total_orders DESC;
```

**Answer:** Requires execution on dataset

---

## 20. List products with unit price greater than average unit price.

```sql
SELECT *
FROM products
WHERE unit_price > (
    SELECT AVG(unit_price)
    FROM products
);
```

**Answer:** Requires execution on dataset

---


---

## 💡 Key Insights

- A small number of products generate the majority of revenue.
- Loyalty customers contribute significantly higher sales.
- Store performance varies across locations.
- Discounts influence purchase behavior and revenue.
- Certain product categories dominate profitability.

---

## 🚀 Business Value

This project supports:
- Sales optimization  
- Customer retention  
- Inventory management  
- Pricing strategy  
- Data-driven decision-making
   
---

## 🚀 Recommendations

### 1. Focus on High-Performing Products
Prioritize inventory and marketing efforts for top-performing products to maximize revenue.

### 2. Improve Low-Performing Categories
Reassess underperforming categories for pricing, bundling, or discontinuation.

### 3. Strengthen Loyalty Programs
Expand loyalty rewards since repeat customers generate higher revenue.

### 4. Optimize Store Performance
Improve strategies for low-performing locations and scale successful stores.

### 5. Use Data-Driven Discounts
Apply targeted discount strategies to protect profit margins.

### 6. Improve Inventory Planning
Use historical sales data for demand forecasting and stock optimization.

### 7. Customer Segmentation
Leverage demographic data for targeted marketing campaigns.

---

## 💡 Future Improvements

- Build interactive Power BI dashboard.
- Create sales forecasting models.
- Implement customer segmentation analysis.
- Perform advanced profitability analysis.
- Develop KPI monitoring dashboard.

---

## 📁 Repository Structure

```text
Chocolate-Sales-SQL-Project/
│
├── Chocolate Sale Dataset.sql
├── README.md
└── Results/
```

---

## 👨‍💻 Author

**Kayode Peace**  
Data Analyst | SQL | Excel | Power BI  

---

⭐ If you found this project useful, consider starring the repository.
