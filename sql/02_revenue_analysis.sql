-- Total revenue per customer
SELECT 
    c.customer_name,
    c.customer_id,
    SUM(l.revenue) AS total_revenue
FROM customers c
JOIN loads l
ON c.customer_id = l.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name
ORDER BY total_revenue DESC;

-- Top customer by revenue
SELECT 
    c.customer_name,
    c.customer_id,
    SUM(l.revenue) AS total_revenue
FROM customers c
JOIN loads l
ON c.customer_id = l.customer_id
GROUP BY 
    c.customer_id,
    c.customer_name
ORDER BY total_revenue DESC
LIMIT 1;
