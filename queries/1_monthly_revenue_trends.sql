-- Analyzing monthly revenue


SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    COUNT(DISTINCT order_number) AS total_orders,
    SUM(order_quantity * product_price) AS total_revenue,
    ROUND(AVG(order_quantity * product_price), 2) AS avg_order_value,
    COUNT(DISTINCT customer_key) AS unique_customers
FROM sales
LEFT JOIN products ON products.product_key = sales.product_key
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY total_revenue DESC
LIMIT 10;

/* results

Example (not yours):
"From September 2016 to June 2017, revenue showed a clear upward trend, with June and May leading at $1.8M and $1.7M respectively. This growth indicates increasing customer demand, which directly translates to higher profits for the business. A growing company creates new opportunities — more jobs, higher wages, business expansion. Based on this pattern, I would recommend increasing production capacity in the first half of the year to meet anticipated demand."
Trend: "good increasing trend from September 2016 to June 2017"
Peak months: June, May, December
Why it matters: More revenue = more profit, customer demand increasing, jobs and pay increases
Action: Increase production for first half of the year
[
  {
    "month": "2017-06",
    "total_orders": "2146",
    "total_revenue": "1826984.91",
    "avg_order_value": "336.46",
    "unique_customers": "2087"
  },
  {
    "month": "2017-05",
    "total_orders": "2165",
    "total_revenue": "1768430.63",
    "avg_order_value": "326.52",
    "unique_customers": "2105"
  },
  {
    "month": "2016-12",
    "total_orders": "2056",
    "total_revenue": "1635306.67",
    "avg_order_value": "316.55",
    "unique_customers": "1998"
  },
  {
    "month": "2017-04",
    "total_orders": "1997",
    "total_revenue": "1527811.82",
    "avg_order_value": "306.42",
    "unique_customers": "1943"
  },
  {
    "month": "2017-03",
    "total_orders": "1962",
    "total_revenue": "1448594.08",
    "avg_order_value": "303.50",
    "unique_customers": "1904"
  },
  {
    "month": "2017-02",
    "total_orders": "1758",
    "total_revenue": "1339239.38",
    "avg_order_value": "305.48",
    "unique_customers": "1701"
  },
  {
    "month": "2017-01",
    "total_orders": "1811",
    "total_revenue": "1274377.03",
    "avg_order_value": "283.70",
    "unique_customers": "1740"
  },
  {
    "month": "2016-11",
    "total_orders": "1677",
    "total_revenue": "1133911.38",
    "avg_order_value": "277.10",
    "unique_customers": "1607"
  },
  {
    "month": "2016-10",
    "
[
  {
    "month": "2017-06",
    "total_orders": "2146",
    "total_revenue": "1826984.91",
    "avg_order_value": "336.46",
    "unique_customers": "2087"
  },
  {
    "month": "2017-05",
    "total_orders": "2165",
    "total_revenue": "1768430.63",
    "avg_order_value": "326.52",
    "unique_customers": "2105"
  },
  {
    "month": "2016-12",
    "total_orders": "2056",
    "total_revenue": "1635306.67",
    "avg_order_value": "316.55",
    "unique_customers": "1998"
  },
  {
    "month": "2017-04",
    "total_orders": "1997",
    "total_revenue": "1527811.82",
    "avg_order_value": "306.42",
    "unique_customers": "1943"
  },
  {
    "month": "2017-03",
    "total_orders": "1962",
    "total_revenue": "1448594.08",
    "avg_order_value": "303.50",
    "unique_customers": "1904"
  },
  {
    "month": "2017-02",
    "total_orders": "1758",
    "total_revenue": "1339239.38",
    "avg_order_value": "305.48",
    "unique_customers": "1701"
  },
  {
    "month": "2017-01",
    "total_orders": "1811",
    "total_revenue": "1274377.03",
    "avg_order_value": "283.70",
    "unique_customers": "1740"
  },
  {
    "month": "2016-11",
    "total_orders": "1677",
    "total_revenue": "1133911.38",
    "avg_order_value": "277.10",
    "unique_customers": "1607"
  },
  {
    "month": "2016-10",
    "total_orders": "1639",
    "total_revenue": "1029819.30",
    "avg_order_value": "254.40",
    "unique_customers": "1588"
  },
  {
    "month": "2016-09",
    "total_orders": "1568",
    "total_revenue": "952741.88",
    "avg_order_value": "250.72",
    "unique_customers": "1519"
  }
]
*/