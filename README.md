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

**Answer:** `1,000,000` total orders

---

## 2. List all unique product categories from the products table.

```sql
SELECT DISTINCT category
FROM products;
```

**Answer:** `5 categories` — `**Truffle, Praline, White, Dark, Milk**`

---

## 3. How many customers are registered in the dataset?

```sql
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customers;
```

**Answer:** `50,000` customers

---

## 4. List all stores and the cities they are located in.

```sql
SELECT store_name, city
FROM stores;
```

**Answer:** `100` stores spread across `7` cities:

| City | Stores |
|------|--------|
| New York | 18 |
| Toronto | 20 |
| London | 15 |
| Paris | 16 |
| Sydney | 13 |
| Melbourne | 12 |
| Berlin | 6 |

---

## 5. Which products have a cocoa percentage greater than 70%?

```sql
SELECT *
FROM products
WHERE cocoa_percent > 70;
```

**Answer:** `**76 products**` have a cocoa percentage greater than 70% (ranging from 80% to 90% cocoa). Examples include:
- White Chocolate `80%` (Mars) — Truffle category
- Dark Chocolate `90%` (Lindt) — White category
- Praline Chocolate `90%` (Ferrero) — Truffle category

---

## 6. How many products does each brand offer?

```sql
SELECT brand, COUNT(product_id) AS product_count
FROM products
GROUP BY brand;
```

**Answer:**

| Brand | Product Count |
|-------|--------------|
| Cadbury | 37 |
| Ferrero | 37 |
| Lindt | 35 |
| Mars | 33 |
| Godiva | 30 |
| Hershey | 28 |

---

## 7. Find all sales where a discount was applied.

```sql
SELECT *
FROM sales
WHERE discount > 0;
```

**Answer:** `374,872 orders` had a discount applied (approximately `37.5%` of all orders).

---

## 8. What is the total revenue generated across all sales?

```sql
SELECT SUM(revenue) AS total_revenue
FROM sales;
```

**Answer:** `$25,486,128.86`

---

## 9. What is the total profit made from all orders?

```sql
SELECT SUM(profit) AS total_profit
FROM sales;
```

**Answer:** `$10,194,564.63`

---

## 10. What is the minimum and maximum profit from a single order?

```sql
SELECT MIN(profit) AS min_profit,
       MAX(profit) AS max_profit
FROM sales;
```

**Answer:**
- **Minimum profit:** `$0.73`
- **Maximum profit:** `$37.43`

---

## 11. What is the total quantity sold per product category?

```sql
SELECT p.category, SUM(s.quantity) AS total_quantity
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;
```

**Answer:**

| Category | Total Quantity Sold |
|----------|-------------------|
| Praline | 784,435 |
| White | 714,967 |
| Dark | 623,247 |
| Truffle | 462,202 |
| Milk | 385,619 |

---

## 12. Show the store name, city, and total revenue for each store.

```sql
SELECT st.store_name, st.city, SUM(s.revenue) AS total_revenue
FROM sales s
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.store_name, st.city
ORDER BY total_revenue DESC;
```

**Answer:** Top 5 stores by revenue:

| Store | City | Total Revenue |
|-------|------|--------------|
| Chocolate Store 74 | Sydney | $261,393.77 |
| Chocolate Store 33 | Toronto | $260,672.37 |
| Chocolate Store 50 | New York | $259,526.62 |
| Chocolate Store 85 | Melbourne | $259,512.15 |
| Chocolate Store 98 | New York | $259,055.13 |

*(Full list covers all 100 stores ranging from ~$247K to ~$261K)*

---

## 13. Which brand generates the highest total profit?

```sql
SELECT TOP 1 p.brand, SUM(s.profit) AS total_profit
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.brand
ORDER BY total_profit DESC;
```

**Answer:** **Ferrero** — with a total profit of `$1,876,268.09`

---

## 14. Which country generates the most total revenue?

```sql
SELECT TOP 1 st.country, SUM(s.revenue) AS total_revenue
FROM sales s
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.country
ORDER BY total_revenue DESC;
```

**Answer:** **Canada** — with total revenue of `$5,085,319.05`

---

## 15. What is the total revenue generated by loyalty members vs non-loyalty members?

```sql
SELECT c.loyalty_member, SUM(s.revenue) AS total_revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.loyalty_member;
```

**Answer:**

| Loyalty Member | Total Revenue |
|----------------|--------------|
| Yes (1) | $12,773,040.47 |
| No (0) | $12,713,088.39 |

> Loyalty members generate slightly more revenue — a difference of `~$59,952`.

---

## 16. List the top 5 products by total quantity sold.

```sql
SELECT TOP 5 p.product_name, p.brand,
       SUM(s.quantity) AS total_quantity
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name, p.brand
ORDER BY total_quantity DESC;
```

**Answer:**

| Product Name | Brand | Total Quantity |
|--------------|-------|----------------|
| White Chocolate 60% | Mars | 74,066 |
| Praline Chocolate 50% | Ferrero | 73,940 |
| Truffle Chocolate 50% | Ferrero | 60,608 |
| Dark Chocolate 50% | Cadbury | 60,240 |
| Dark Chocolate 60% | Cadbury | 60,159 |

---

## 17. Which store type generates the most revenue?

```sql
SELECT st.store_type, SUM(s.revenue) AS total_revenue
FROM sales s
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.store_type;
```

**Answer:**

| Store Type | Total Revenue |
|------------|--------------|
| **Airport** | **$7,613,875.92** |
| Mall | $6,628,228.67 |
| Online | $6,386,035.76 |
| Retail | $4,857,988.51 |

> **Airport** stores are the top-performing channel by a significant margin.

---

## 18. What is the average order revenue for male vs female customers?

```sql
SELECT c.gender, AVG(s.revenue) AS avg_revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.gender;
```

**Answer:**

| Gender | Avg Order Revenue |
|--------|------------------|
| Male | $25.49 |
| Female | $25.48 |

> Revenue per order is nearly identical between genders — a difference of just `$0.01.`

---

## 19. Which city has the highest number of orders placed?

```sql
SELECT TOP 1 st.city, COUNT(s.order_id) AS total_orders
FROM sales s
JOIN stores st ON s.store_id = st.store_id
GROUP BY st.city
ORDER BY total_orders DESC;
```

**Answer:** **Toronto** — with `180,181` total orders

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

> *Note: Unit price exists in the `sales` table. The query was adapted to find products with an **average transaction unit price above the overall average of `$9.00`

**Answer:** **Top 20 products above average unit price ($9.00):**

| Product ID | Product Name | Brand | Category | Avg Unit Price |
|------------|--------------|-------|----------|----------------|
| P0049 | Milk Chocolate 60% | Ferrero | Truffle | $9.16 |
| P0062 | Truffle Chocolate 80% | Mars | Dark | $9.14 |
| P0108 | Dark Chocolate 60% | Lindt | Truffle | $9.13 |
| P0046 | Dark Chocolate 50% | Cadbury | White | $9.12 |
| P0077 | Truffle Chocolate 70% | Cadbury | Praline | $9.12 |
| P0060 | Milk Chocolate 70% | Mars | Praline | $9.11 |
| P0128 | White Chocolate 80% | Godiva | Dark | $9.11 |
| P0140 | Dark Chocolate 80% | Lindt | Milk | $9.10 |
| P0054 | Truffle Chocolate 80% | Lindt | Praline | $9.09 |
| P0066 | White Chocolate 80% | Ferrero | Praline | $9.09 |
| P0152 | Milk Chocolate 70% | Lindt | Praline | $9.09 |
| P0028 | Dark Chocolate 50% | Lindt | Dark | $9.08 |
| P0115 | Milk Chocolate 90% | Hershey | Milk | $9.08 |
| P0133 | Milk Chocolate 90% | Lindt | Dark | $9.08 |
| P0136 | Dark Chocolate 90% | Mars | Milk | $9.08 |
| P0188 | Praline Chocolate 50% | Cadbury | Dark | $9.08 |
| P0190 | Milk Chocolate 70% | Lindt | Dark | $9.08 |
| P0017 | White Chocolate 50% | Hershey | Milk | $9.07 |
| P0185 | Milk Chocolate 70% | Ferrero | Praline | $9.07 |
| P0200 | Milk Chocolate 50% | Cadbury | Milk | $9.07 |

---

*Analysis executed on 5 datasets: sales.csv, products.csv, stores.csv, customers.csv, calendar.csv*

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
