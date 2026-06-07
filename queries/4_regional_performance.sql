


SELECT
    t.continent AS continent,
    t.country AS country,
    t.region AS region,
    SUM(s.order_quantity * p.product_price) AS total_revenue,
    COUNT(DISTINCT s.customer_key) AS unique_customers,
    ROUND(SUM(s.order_quantity * (p.product_price - p.product_cost)), 2) AS total_profit
FROM territories AS t
INNER JOIN sales AS s ON s.territory_key = t.territory_key
LEFT JOIN products AS p ON p.product_key = s.product_key
GROUP BY continent, country, region
ORDER BY total_revenue DESC;



/*
The United States and Australia emerged as our most profitable countries, outperforming all other markets by a significant margin. This growth was primarily driven by regional surges in Australia ($7.4 million) and the Southwest US ($4.8 million).
Meanwhile, overall sales saw strong upward momentum across Australia, the Western US, and European markets. In stark contrast, the Southeast, Northeast, and Central US regions lagged severely behind, yielding a negligible combined profit of less than $22,000.
Given these disparities, I'd recommend investigating why Southeast, Northeast, and Central regions underperform, while scaling investment in Australia, Southwest US, and Europe where demand is clearly strong

[
  {
    "continent": "Pacific",
    "country": "Australia",
    "region": "Australia",
    "total_revenue": "7416451.76",
    "unique_customers": "3480",
    "total_profit": "3076998.48"
  },
  {
    "continent": "North America",
    "country": "United States",
    "region": "Southwest",
    "total_revenue": "4822791.91",
    "unique_customers": "4134",
    "total_profit": "2040318.20"
  },
  {
    "continent": "North America",
    "country": "United States",
    "region": "Northwest",
    "total_revenue": "3095072.15",
    "unique_customers": "3075",
    "total_profit": "1314730.39"
  },
  {
    "continent": "Europe",
    "country": "United Kingdom",
    "region": "United Kingdom",
    "total_revenue": "2902558.90",
    "unique_customers": "1822",
    "total_profit": "1214757.73"
  },
  {
    "continent": "Europe",
    "country": "Germany",
    "region": "Germany",
    "total_revenue": "2524677.34",
    "unique_customers": "1675",
    "total_profit": "1054172.53"
  },
  {
    "continent": "Europe",
    "country": "France",
    "region": "France",
    "total_revenue": "2362641.01",
    "unique_customers": "1705",
    "total_profit": "989333.24"
  },
  {
    "continent": "North America",
    "country": "Canada",
    "region": "Canada",
    "total_revenue": "1769243.88",
    "unique_customers": "1499",
    "total_profit": "757825.21"
  },
  {
    "continent": "North America",
    "country": "United States",
    "region": "Southeast",
    "total_revenue": "11585.62",
    "unique_customers": "10",
    "total_profit": "5133.20"
  },
  {
    "continent": "North America",
    "country": "United States",
    "region": "Northeast",
    "total_revenue": "6401.55",
    "unique_customers": "8",
    "total_profit": "2874.47"
  },
  {
    "continent": "North America",
    "country": "United States",
    "region": "Central",
    "total_revenue": "3143.06",
    "unique_customers": "8",
    "total_profit": "1437.41"
  }
]

*/