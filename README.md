🛍 E-commerce Sales Analysis (SQL Project) 📌 Project Overview

This project analyzes sales data from a small e-commerce business using MySQL. The goal is to explore customer behavior, sales performance, and revenue trends by writing SQL queries.

🗂 Dataset

The dataset is simulated and consists of 4 tables:

customers → customer details (id, name, country)

orders → order details (id, customer, date, amount)

products → product catalog (id, name, category)

order_items → details of products in each order

🎯 Business Questions Answered

Revenue by Month – How does revenue trend over time?

Top Customers by Revenue – Who are the most valuable customers?

Best-Selling Categories – Which product categories generate the most sales?

Repeat Purchase Rate – What % of customers made more than one purchase?

Revenue by Country – Which countries bring the most revenue?

📝 Key Insights

📈 January had the highest revenue ($750).

🥇 Alice Wong (USA) was the top customer with $550 in revenue.

💡 Electronics was the best-selling category, generating $1000 in sales.

🔁 25% of customers made repeat purchases (indicating low customer loyalty).

🌍 USA was the biggest market, contributing $950 in revenue.

⚙️ SQL Techniques Used

JOIN (to combine data across multiple tables)

GROUP BY and SUM() (for aggregations)

ORDER BY and LIMIT (for ranking results)

Subqueries (for repeat purchase calculations)

Date formatting with DATE_FORMAT()

🚀 How to Run

Import the .sql script into MySQL Workbench.

Run the provided queries in queries.sql.

Explore or extend the analysis with your own queries.
