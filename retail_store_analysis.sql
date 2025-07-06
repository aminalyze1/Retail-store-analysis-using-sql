-- Retail sales analysis final SQL project
-- Author: Aminat Ariyibi
-- Tool: PostgreSQL (mobile setup)

-- Set customer's name to titlecase 
UPDATE retail_orders
SET customer_name = INITCAP(customer_name);

--Sales analysis using aggregate functions
--Total revenue and orders placed 
SELECT 
   SUM(quantity * price) total_revenue, 
   COUNT(order_id) total_orders
FROM retail_orders;
-- Usefull to know the overall performance of the business

-- Product category generating highest revenue
SELECT 
   product_category,
   COUNT(quantity),
   SUM(quantity * price) total_revenue 
FROM retail_orders
GROUP BY product_category
ORDER BY total_revenue DESC
LIMIT 3;
-- This would allow to know the best selling items, guide inventory and dieect market focus to those items 

-- Customers total spend
SELECT 
   customer_name,
   SUM(quantity * price) total_spent
FROM retail_orders
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 5;
--Useful for loyalty programs, premium targeting, and retention strategies.

-- Repeat customers 
SELECT 
   customer_name, 
   COUNT(order_id) all_orders
FROM retail_orders
GROUP BY customer_name
HAVING COUNT(order_id) > 1
ORDER BY COUNT(order_id) desc;
-- Useful for loyalty programs, premium targeting, and retention strategies.


-- Revenue generated per country 
SELECT
  country, 
  SUM(price * quantity) total_sales
FROM retail_orders
GROUP BY country 
ORDER BY total_sales DESC
LIMIT 5;
-- Assists in prioritizing regional expansion and resource allocation.

-- Average order value per customer 
SELECT
  customer_name, 
  AVG(price * quantity) avg_order_value
FROM retail_orders
GROUP BY customer_name
ORDER BY avg_order_value DESC; 
-- Key metric for measuring customer value and optimizing pricing.

-- Daily sales trend
SELECT 
  DATE_TRUNC('day', order_date) AS day,
  SUM(price * quantity) AS total_sales
FROM retail_orders
WHERE price IS NOT NULL AND quantity IS NOT NULL
GROUP BY day
ORDER BY total_sales DESC
LIMIT 5;
-- Operational insight for staffing, stock management, and peak load handling.

-- Customer categories based on total spend using case statement
SELECT 
   customer_name, 
   SUM(price * quantity) total_spend,
 CASE 
   WHEN SUM(price * quantity) < 4000 THEN 'low spenders'
   WHEN SUM(price * quantity) BETWEEN 4000 AND 10000 THEN 'medium spenders' 
   WHEN SUM(price * quantity) > 10000 THEN 'high spenders'
   ELSE 'unknown'
   END AS spending_category
FROM 
   retail_orders
GROUP BY 
   customer_name
ORDER BY 
   total_spend DESC;
 -- Customer segmentation for tailored marketing strategies.

 -- Spending rank per country using rank()
SELECT
   customer_name,
   country,
   SUM(price * quantity) AS total_spent,
   RANK() OVER (PARTITION BY country ORDER BY SUM(price * quantity) DESC) AS country_spend_rank
FROM retail_orders
WHERE price IS NOT NULL AND quantity IS NOT NULL
GROUP BY customer_name, country
ORDER BY country, country_spend_rank;
-- Supports performance comparison and localized strategies.

-- Customers who have spent above average customer spend using ctes and subqueries
WITH spend_total AS (
    SELECT 
        customer_name,
        SUM(price * quantity) AS total_spend
    FROM retail_orders
    WHERE price IS NOT NULL AND quantity IS NOT NULL
    GROUP BY customer_name 
)
SELECT *
FROM spend_total
WHERE total_spend > (
    SELECT AVG(total_spend)
    FROM spend_total
);
-- Helps detect VIPs or high-value customers.

-- Identifies counties with revenue above global average using ctes 
WITH country_revenue AS (
    SELECT 
        country,
        SUM(price * quantity) AS total_revenue
    FROM retail_orders
    GROUP BY country
),
global_avg AS (
    SELECT 
        AVG(total_revenue) AS avg_revenue
    FROM country_revenue
)
SELECT 
    cr.country,
    cr.total_revenue
FROM 
    country_revenue cr,
    global_avg ga
WHERE 
    cr.total_revenue > ga.avg_revenue
ORDER BY 
    cr.total_revenue DESC;
-- Measures country-level performance against benchmarks.
