use sales;


-- =========================================
-- SALES INSIGHTS PROJECT (FMCG DATA)
-- =========================================

-- Q1: What is the total revenue?
SELECT 
    SUM(sales_amount) AS total_revenue
FROM transactions;


-- Q2: Total sales quantity?
SELECT 
    SUM(sales_qty) AS total_quantity
FROM transactions;


-- Q3: Revenue by market (Top performing markets)
SELECT 
    m.markets_name,
    SUM(t.sales_amount) AS revenue
FROM transactions t
JOIN markets m 
    ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY revenue DESC;


-- Q4: Revenue by zone (Regional performance)
SELECT 
    m.zone,
    SUM(t.sales_amount) AS revenue
FROM transactions t
JOIN markets m 
    ON t.market_code = m.markets_code
GROUP BY m.zone
ORDER BY revenue DESC;


-- Q5: Top 5 customers by revenue
SELECT 
    c.custmer_name,
    SUM(t.sales_amount) AS revenue
FROM transactions t
JOIN customers c 
    ON t.customer_code = c.customer_code
GROUP BY c.custmer_name
ORDER BY revenue DESC
LIMIT 5;


-- Q6: Revenue by customer type
SELECT 
    c.customer_type,
    SUM(t.sales_amount) AS revenue
FROM transactions t
JOIN customers c 
    ON t.customer_code = c.customer_code
GROUP BY c.customer_type;


-- Q7: Top 5 products by revenue
SELECT 
    p.product_code,
    SUM(t.sales_amount) AS revenue
FROM transactions t
JOIN products p 
    ON t.product_code = p.product_code
GROUP BY p.product_code
ORDER BY revenue DESC
LIMIT 5;


-- Q8: Monthly sales trend
SELECT 
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    SUM(sales_amount) AS revenue
FROM transactions
GROUP BY year, month
ORDER BY year, month;


-- Q9: Which market has highest sales quantity?
SELECT 
    m.markets_name,
    SUM(t.sales_qty) AS total_qty
FROM transactions t
JOIN markets m 
    ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY total_qty DESC;


-- Q10: Top 5 customer + market combinations
SELECT 
    c.custmer_name,
    m.markets_name,
    SUM(t.sales_amount) AS revenue
FROM transactions t
JOIN customers c 
    ON t.customer_code = c.customer_code
JOIN markets m 
    ON t.market_code = m.markets_code
GROUP BY 
    c.custmer_name,
    m.markets_name
ORDER BY revenue DESC
LIMIT 5;

