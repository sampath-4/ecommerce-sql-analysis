use ecommerce;
select
date_format(order_date,'%y-%m')as month,
sum(total_amount)as revenue
from orders
group by month
order by month asc;
select
c.customer_id,c.name,c.country,sum(o.total_amount)as revenue
from customers c join orders o on c.customer_id=o.customer_id
group by c.customer_id,c.name,c.country
order by revenue desc
limit 10;
select
p.category,sum(oi.quantity*oi.price)as revenue
from products p join order_items oi on p.product_id=oi.product_id
group by p.category
order by revenue desc;
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(DISTINCT CASE WHEN order_count > 1 THEN customer_id END) AS repeat_customers,
    ROUND(
        COUNT(DISTINCT CASE WHEN order_count > 1 THEN customer_id END) * 100.0 / 
        COUNT(DISTINCT customer_id), 2
    ) AS repeat_purchase_rate
FROM (
    SELECT customer_id, COUNT(order_id) AS order_count
    FROM orders
    GROUP BY customer_id
) sub;
select
c.country,sum(o.total_amount)as revenue
from customers c join orders o on c.customer_id=o.customer_id
group by c.country
order by revenue