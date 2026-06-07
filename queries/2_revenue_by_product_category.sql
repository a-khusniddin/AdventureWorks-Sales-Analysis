

SELECT
    pc.category_name,
    COUNT(DISTINCT s.order_number) AS total_orders,
    SUM(s.order_quantity) AS total_units_sold,
    SUM(s.order_quantity * p.product_price) AS total_revenue,
    ROUND(AVG(order_quantity * product_price), 2) AS avg_order_value, 
    ROUND(SUM(s.order_quantity * (p.product_price - p.product_cost)), 2) AS total_profit,
    ROUND(SUM(s.order_quantity * (p.product_price - p.product_cost)) / SUM(s.order_quantity * p.product_price) * 100, 2) AS profit_margin_pct
FROM sales s
LEFT JOIN products p ON s.product_key = p.product_key
LEFT JOIN product_subcategories ps ON p.subcategory_key = ps.subcategory_key
LEFT JOIN product_categories pc ON ps.category_key = pc.category_key
GROUP BY pc.category_name
ORDER BY total_revenue DESC;

/*

Bikes have the highest price per unit( $1698) and massive revenue although having the lowest margin with around 41%. 
Accessories had the lowest price per unit ( $15 ) whereas the highest margin 63%.
Clothing was in the middle and lowest revenue.
Based on the margin analysis, I'd recommend increasing investment in accessories to boost overall profitability, given the 63% profit margin compared to bikes' 41%


[
  {
    "category_name": "Bikes",
    "total_orders": "13929",
    "total_units_sold": "13929",
    "total_revenue": "23642500.06",
    "avg_order_value": "1697.36",
    "total_profit": "9726169.08",
    "profit_margin_pct": "41.14"
  },
  {
    "category_name": "Accessories",
    "total_orders": "16983",
    "total_units_sold": "57809",
    "total_revenue": "906656.58",
    "avg_order_value": "26.98",
    "total_profit": "569634.20",
    "profit_margin_pct": "62.83"
  },
  {
    "category_name": "Clothing",
    "total_orders": "6976",
    "total_units_sold": "12436",
    "total_revenue": "365410.54",
    "avg_order_value": "42.94",
    "total_profit": "161777.58",
    "profit_margin_pct": "44.27"
  }
]

*/