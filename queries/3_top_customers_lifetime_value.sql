

SELECT
    customers.customer_key,
    CONCAT( customers.first_name, ' ', customers.last_name) AS customer_name,
    SUM(s.order_quantity * p.product_price) AS total_value,
    COUNT(DISTINCT s.order_number) AS total_purchases
FROM customers 
RIGHT JOIN sales s ON s.customer_key = customers.customer_key
LEFT JOIN products p ON p.product_key = s.product_key
GROUP BY customers.customer_key, customers.first_name, customers.last_name
ORDER BY total_value DESC
LIMIT 10;


/*

 top 10 customers are tightly clustered between $10K–$12K in lifetime value, with Maurice Shan leading at $12,407. Each purchase averages $1,800–$2,000, reflecting bike purchases. While purchase frequency varies between 4–7 orders, frequency doesn't determine value — some customers spend more per transaction than others. To protect this concentrated revenue, I'd recommend implementing a loyalty rewards program with VIP treatment, including early access to new models and personalized customer service.

[
  {
    "customer_key": 11433,
    "customer_name": "MAURICE SHAN",
    "total_value": "12407.95",
    "total_purchases": "6"
  },
  {
    "customer_key": 11439,
    "customer_name": "JANET MUNOZ",
    "total_value": "12015.39",
    "total_purchases": "6"
  },
  {
    "customer_key": 11241,
    "customer_name": "LISA CAI",
    "total_value": "11330.44",
    "total_purchases": "7"
  },
  {
    "customer_key": 11417,
    "customer_name": "LACEY ZHENG",
    "total_value": "11085.74",
    "total_purchases": "7"
  },
  {
    "customer_key": 11420,
    "customer_name": "JORDAN TURNER",
    "total_value": "11022.38",
    "total_purchases": "7"
  },
  {
    "customer_key": 11242,
    "customer_name": "LARRY MUNOZ",
    "total_value": "10852.04",
    "total_purchases": "7"
  },
  {
    "customer_key": 13263,
    "customer_name": "KATE ANAND",
    "total_value": "10436.51",
    "total_purchases": "4"
  },
  {
    "customer_key": 12655,
    "customer_name": "LARRY VAZQUEZ",
    "total_value": "10394.98",
    "total_purchases": "4"
  },
  {
    "customer_key": 11425,
    "customer_name": "ARIANA GRAY",
    "total_value": "10391.42",
    "total_purchases": "6"
  },
  {
    "customer_key": 12631,
    "customer_name": "CLARENCE GAO",
    "total_value": "10331.73",
    "total_purchases": "4"
  }
]
*/
