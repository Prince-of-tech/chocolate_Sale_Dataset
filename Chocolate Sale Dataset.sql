
-- ============================================================================
-- QUESTION 1: How many total orders are recorded in the sales table?
-- ============================================================================
SELECT 
    COUNT(*) AS total_orders
FROM sales;


-- ============================================================================
-- QUESTION 2: List all unique product categories from the products table.
-- ============================================================================
SELECT DISTINCT 
    category
FROM products
ORDER BY category ASC;


-- ============================================================================
-- QUESTION 3: How many customers are registered in the dataset?
-- ============================================================================
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM customers;


-- ============================================================================
-- QUESTION 4: List all stores and the cities they are located in.
-- ============================================================================
SELECT 
    store_id,
    store_name,
    city,
    country
FROM stores
ORDER BY store_id ASC;


-- ============================================================================
-- QUESTION 5: Which products have a cocoa percentage greater than 70%?
-- ============================================================================
SELECT 
    product_id,
    product_name,
    brand,
    category,
    cocoa_percent,
    weight_g
FROM products
WHERE cocoa_percent > 70
ORDER BY cocoa_percent DESC, product_name ASC;


-- ============================================================================
-- QUESTION 6: How many products does each brand offer? 
-- List brands and their product count.
-- ============================================================================
SELECT 
    brand,
    COUNT(product_id) AS product_count
FROM products
GROUP BY brand
ORDER BY product_count DESC, brand ASC;


-- ============================================================================
-- QUESTION 7: Find all sales where a discount was applied (discount > 0).
-- ============================================================================
SELECT 
    order_id,
    order_date,
    product_id,
    store_id,
    customer_id,
    quantity,
    unit_price,
    discount,
    revenue,
    profit
FROM sales
WHERE discount > 0
ORDER BY order_date DESC, order_id ASC;


-- ============================================================================
-- QUESTION 8: What is the total revenue generated across all sales?
-- ============================================================================
SELECT 
    '$' + FORMAT(SUM(revenue), 'N2') AS total_revenue
FROM sales;


-- ============================================================================
-- QUESTION 9: What is the total profit made from all orders?
-- ============================================================================
SELECT 
    '$' + FORMAT(SUM(profit), 'N2') AS total_profit
FROM sales;


-- ============================================================================
-- QUESTION 10: What is the minimum and maximum profit from a single order?
-- ============================================================================
SELECT 
    '$' + FORMAT(MIN(profit), 'N2') AS min_profit,
    '$' + FORMAT(MAX(profit), 'N2') AS max_profit,
    COUNT(*) AS total_orders
FROM sales;


-- ============================================================================
-- QUESTION 11: What is the total quantity sold per product category?
-- (Join sales and products)
-- ============================================================================
SELECT 
    p.category,
    SUM(s.quantity) AS total_quantity_sold,
    COUNT(DISTINCT s.order_id) AS total_orders,
    ROUND(AVG(CAST(s.quantity AS FLOAT)), 2) AS avg_quantity_per_order
FROM sales AS s
INNER JOIN products AS p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_quantity_sold DESC, p.category ASC;


-- ============================================================================
-- QUESTION 12: Show the store name, city, and total revenue for each store.
-- (Join sales and stores)
-- ============================================================================
SELECT TOP 100
    st.store_id,
    st.store_name,
    st.city,
    st.country,
    st.store_type,
    '$' + FORMAT(SUM(s.revenue), 'N2') AS total_revenue,
    COUNT(DISTINCT s.order_id) AS total_orders,
    ROUND(AVG(s.revenue), 2) AS avg_order_revenue
FROM sales AS s
INNER JOIN stores AS st ON s.store_id = st.store_id
GROUP BY 
    st.store_id,
    st.store_name,
    st.city,
    st.country,
    st.store_type
ORDER BY SUM(s.revenue) DESC;


-- ============================================================================
-- QUESTION 13: Which brand generates the highest total profit?
-- (Join sales and products)
-- ============================================================================
SELECT TOP 1
    p.brand,
    '$' + FORMAT(SUM(s.profit), 'N2') AS total_profit,
    COUNT(DISTINCT s.order_id) AS total_orders,
    COUNT(DISTINCT p.product_id) AS products_offered,
    ROUND(AVG(s.profit), 2) AS avg_profit_per_order
FROM sales AS s
INNER JOIN products AS p ON s.product_id = p.product_id
GROUP BY p.brand
ORDER BY SUM(s.profit) DESC;


-- ============================================================================
-- QUESTION 14: Which country generates the most total revenue?
-- (Join sales and stores)
-- ============================================================================
SELECT TOP 1
    st.country,
    '$' + FORMAT(SUM(s.revenue), 'N2') AS total_revenue,
    COUNT(DISTINCT s.order_id) AS total_orders,
    COUNT(DISTINCT st.store_id) AS store_count,
    ROUND(AVG(s.revenue), 2) AS avg_order_revenue
FROM sales AS s
INNER JOIN stores AS st ON s.store_id = st.store_id
GROUP BY st.country
ORDER BY SUM(s.revenue) DESC;


-- ============================================================================
-- QUESTION 15: What is the total revenue generated by loyalty members 
-- vs non-loyalty members? (Join sales and customers)
-- ============================================================================
SELECT 
    CASE 
        WHEN c.loyalty_member = 1 THEN 'Loyalty Member'
        ELSE 'Non-Loyalty Member'
    END AS member_status,
    COUNT(DISTINCT s.order_id) AS total_orders,
    COUNT(DISTINCT c.customer_id) AS unique_customers,
    '$' + FORMAT(SUM(s.revenue), 'N2') AS total_revenue,
    ROUND(AVG(s.revenue), 2) AS avg_order_revenue,
    ROUND(SUM(s.revenue) / COUNT(DISTINCT c.customer_id), 2) AS revenue_per_customer
FROM sales AS s
INNER JOIN customers AS c ON s.customer_id = c.customer_id
GROUP BY c.loyalty_member
ORDER BY SUM(s.revenue) DESC;


-- ============================================================================
-- QUESTION 16: List the top 5 products by total quantity sold, 
-- including the product name and brand.
-- ============================================================================
SELECT TOP 5
    p.product_id,
    p.product_name,
    p.brand,
    p.category,
    SUM(s.quantity) AS total_quantity_sold,
    COUNT(DISTINCT s.order_id) AS times_ordered,
    ROUND(AVG(CAST(s.quantity AS FLOAT)), 2) AS avg_quantity_per_order,
    '$' + FORMAT(SUM(s.revenue), 'N2') AS total_revenue
FROM sales AS s
INNER JOIN products AS p ON s.product_id = p.product_id
GROUP BY 
    p.product_id,
    p.product_name,
    p.brand,
    p.category
ORDER BY SUM(s.quantity) DESC;


-- ============================================================================
-- QUESTION 17: Which store type generates the most revenue?
-- ============================================================================
SELECT 
    st.store_type,
    COUNT(DISTINCT st.store_id) AS store_count,
    COUNT(DISTINCT s.order_id) AS total_orders,
    '$' + FORMAT(SUM(s.revenue), 'N2') AS total_revenue,
    ROUND(AVG(s.revenue), 2) AS avg_order_revenue,
    '$' + FORMAT(SUM(s.profit), 'N2') AS total_profit,
    ROUND((SUM(s.profit) / SUM(s.revenue)) * 100, 2) AS profit_margin_percent
FROM sales AS s
INNER JOIN stores AS st ON s.store_id = st.store_id
GROUP BY st.store_type
ORDER BY SUM(s.revenue) DESC;


-- ============================================================================
-- QUESTION 18: What is the average order revenue for male vs female customers?
-- (Join sales and customers)
-- ============================================================================
SELECT 
    c.gender,
    COUNT(DISTINCT c.customer_id) AS unique_customers,
    COUNT(DISTINCT s.order_id) AS total_orders,
    ROUND(AVG(CAST(c.age AS FLOAT)), 1) AS avg_customer_age,
    ROUND(AVG(s.revenue), 2) AS avg_order_revenue,
    '$' + FORMAT(SUM(s.revenue), 'N2') AS total_revenue,
    SUM(s.quantity) AS total_quantity_purchased
FROM sales AS s
INNER JOIN customers AS c ON s.customer_id = c.customer_id
GROUP BY c.gender
ORDER BY AVG(s.revenue) DESC;


-- ============================================================================
-- QUESTION 19: Which city has the highest number of orders placed?
-- (Join sales and stores)
-- ============================================================================
SELECT TOP 1
    st.city,
    st.country,
    COUNT(DISTINCT st.store_id) AS store_count,
    COUNT(DISTINCT s.order_id) AS total_orders,
    '$' + FORMAT(SUM(s.revenue), 'N2') AS total_revenue,
    ROUND(AVG(s.revenue), 2) AS avg_order_revenue,
    '$' + FORMAT(SUM(s.profit), 'N2') AS total_profit
FROM sales AS s
INNER JOIN stores AS st ON s.store_id = st.store_id
GROUP BY st.city, st.country
ORDER BY COUNT(DISTINCT s.order_id) DESC;


-- ============================================================================
-- QUESTION 20: List the products that have a unit price greater than the 
-- average unit price across all products. (Use a subquery)
-- ============================================================================
SELECT 
    p.product_id,
    p.product_name,
    p.brand,
    p.category,
    ROUND(AVG(s.unit_price), 2) AS avg_unit_price,
    COUNT(DISTINCT s.order_id) AS times_ordered,
    SUM(s.quantity) AS total_quantity_sold,
    '$' + FORMAT(SUM(s.revenue), 'N2') AS total_revenue,
    '$' + FORMAT(SUM(s.profit), 'N2') AS total_profit
FROM sales AS s
INNER JOIN products AS p ON s.product_id = p.product_id
GROUP BY 
    p.product_id,
    p.product_name,
    p.brand,
    p.category
HAVING AVG(s.unit_price) > (
    SELECT AVG(unit_price)
    FROM sales
)
ORDER BY AVG(s.unit_price) DESC;