

SELECT
    p.product_name,
    SUM(s.order_quantity) AS total_units_sold,
    SUM(s.order_quantity * p.product_price) AS total_revenue,
    ROUND(SUM(s.order_quantity * (p.product_price - p.product_cost)), 2) AS total_profit,
    ROUND(SUM(s.order_quantity * (p.product_price - p.product_cost)) / SUM(s.order_quantity * p.product_price) * 100, 2) AS profit_margin_pct
FROM products p 
INNER JOIN sales s ON s.product_key = p.product_key
GROUP BY p.product_key, p.product_name
ORDER BY total_revenue DESC
LIMIT 20;