# 🛍️ Retail Store Sales Analysis

**Tagline:**  
Uncovering actionable insights from fictional retail transactions using SQL (PostgreSQL) on a phone-based setup.

---

## 📌 Project Overview

This project analyzes a fictional retail store’s transactional dataset to answer key business questions. Using only SQL and a mobile environment (DB Fiddle), I performed data cleaning, exploration, and insight generation on real-world style, messy data.

The goal was to simulate how a data analyst would handle business data from raw form to insights, especially in resource-constrained setups.

---

## 🗃️ Dataset Overview

The dataset includes a single table `retail_orders` with the following columns:

- `order_id` — Unique identifier for each order  
- `order_date` — Timestamp of the order  
- `customer_name` — Name of the customer  
- `country` — Country where the order was placed  
- `product_name` — Name of the product  
- `category` — Category of the product  
- `price` — Price per unit  
- `quantity` — Number of items ordered  

> ⚠️ Note: The dataset includes realistic imperfections — such as missing product names and quantities — reflecting real-world complexity.

---

## ❓ Key Business Questions

1. Which customers spent the most overall?
2. What are the most popular product categories in Nigeria?
3. What countries generated the highest revenue?
4. What are the sales trends over time?
5. Who are the top spenders per country?
6. Which countries have above-average revenue?
7. How are customers segmented by spending behavior?

---

## 🔧 SQL Techniques Used

- **Data Cleaning**: `INITCAP()` for name formatting
- **Aggregations**: `SUM()`, `AVG()`, `COUNT()`, `GROUP BY`, `HAVING`
- **Filtering**: `WHERE`, `IN`
- **Subqueries & CTEs**: Used for modular analysis and layered logic
- **Window Functions**: `RANK() OVER (PARTITION BY ...)` to rank customers by spend
- **CASE Statements**: Used to segment customers as `Low`, `Medium`, or `High` spenders
- **Date Functions**: `DATE_TRUNC()` to group sales by time period

---

## 📊 Key Insights

- **Top Customers**: Micheal Smith and John Doe topped customer spending
- **Category Performance**: Home decor, clothing and books were best-selling product category overall
- **Country Revenue**: Kenya and Ghana contributed the highest revenue
- **Sales Peaks**: Highest sales happened mostly on weekdays and late in the month
- **Customer Segmentation**: Majority were Medium and low spenders with strategic opportunities for upselling

---

## 💻 Tools Used

| Tool        | Purpose                         |
|-------------|----------------------------------|
| PostgreSQL  | Query Language                  |
| DB Fiddle   | SQL Execution Platform (Mobile) |
| Phone-Based | Entire project done on Android  |

---

## 📁 Files Included

- `retail_store_analysis.sql` — All queries used in analysis
- `retail_store_project_report.pdf` — Full report in document format (PDF)
- `README.md` — This file for GitHub


---

## 👤 Author

**Aminat Ariyibi**  
Aspiring Data Analyst | Learning SQL on a phone | Building towards Data Science

---
