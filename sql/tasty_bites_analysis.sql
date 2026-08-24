-- ============================================================
-- TASTY BITES SALES & CUSTOMER ANALYSIS
-- ============================================================
-- Project: Sales and Customer Analysis for Tasty Bites
-- Location: Accra, Ghana
-- Tools: MySQL, Excel, Power BI
-- Dataset: Daily restaurant sales data
-- Period: July 2024 - February 2025
-- ============================================================


-- ============================================================
-- 1. DATA EXPLORATION
-- ============================================================

-- View the complete dataset
SELECT *
FROM sales_data;


-- Check the total number of records
SELECT 
    COUNT(*) AS total_records
FROM sales_data;


-- Check the date range and number of records
SELECT 
    MIN(sale_date) AS first_sale_date,
    MAX(sale_date) AS last_sale_date,
    COUNT(*) AS total_records
FROM sales_data;


-- ============================================================
-- 2. OVERALL BUSINESS PERFORMANCE
-- ============================================================

-- Calculate overall sales, customers, average customer spend,
-- and average customer feedback score
SELECT
    SUM(total_sales) AS total_sales,
    SUM(customers_served) AS total_customers,
    AVG(avg_spend_per_customer) AS avg_customer_spend,
    AVG(customer_feedback_score) AS avg_feedback_score
FROM sales_data;


-- ============================================================
-- 3. MONTHLY SALES TREND
-- ============================================================

-- Analyze monthly sales, customer volume,
-- and average customer spending
SELECT
    DATE_FORMAT(sale_date, '%Y-%m') AS month,
    SUM(total_sales) AS total_sales,
    SUM(customers_served) AS total_customers,
    AVG(avg_spend_per_customer) AS avg_customer_spend
FROM sales_data
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY month;


-- ============================================================
-- 4. MENU ITEM PERFORMANCE
-- ============================================================

-- Analyze how frequently each menu item was recorded as
-- the top menu item, together with average sales and feedback
SELECT
    top_menu_item,
    COUNT(*) AS days_as_top_item,
    AVG(total_sales) AS avg_daily_sales,
    AVG(customer_feedback_score) AS avg_feedback_score
FROM sales_data
GROUP BY top_menu_item
ORDER BY days_as_top_item DESC;


-- ============================================================
-- 5. WEATHER AND SALES PERFORMANCE
-- ============================================================

-- Compare sales, customer traffic, and customer spending
-- across different weather conditions
SELECT
    weather,
    COUNT(*) AS number_of_days,
    AVG(total_sales) AS avg_daily_sales,
    AVG(customers_served) AS avg_customers,
    AVG(avg_spend_per_customer) AS avg_customer_spend
FROM sales_data
GROUP BY weather
ORDER BY avg_daily_sales DESC;


-- ============================================================
-- 6. PROMOTION PERFORMANCE
-- ============================================================

-- Compare business performance on promotion and
-- non-promotion days
SELECT
    promotion_active,
    COUNT(*) AS number_of_days,
    AVG(total_sales) AS avg_daily_sales,
    AVG(customers_served) AS avg_customers,
    AVG(avg_spend_per_customer) AS avg_customer_spend
FROM sales_data
GROUP BY promotion_active
ORDER BY avg_daily_sales DESC;


-- ============================================================
-- 7. CUSTOMER FEEDBACK ANALYSIS
-- ============================================================

-- Compare average customer feedback scores across
-- menu items
SELECT
    top_menu_item,
    AVG(customer_feedback_score) AS avg_feedback_score,
    COUNT(*) AS number_of_days
FROM sales_data
GROUP BY top_menu_item
ORDER BY avg_feedback_score DESC;


-- ============================================================
-- 8. TOP 10 SALES DAYS
-- ============================================================

-- Identify the 10 highest-sales days and examine the
-- conditions associated with those days
SELECT
    sale_date,
    day,
    total_sales,
    customers_served,
    avg_spend_per_customer,
    top_menu_item,
    promotion_active,
    weather
FROM sales_data
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================
-- END OF ANALYSIS
-- ============================================================