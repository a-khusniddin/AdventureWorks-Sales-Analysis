# Adventure Works Retail Analytics — SQL Project

A comprehensive data analysis of Adventure Works' retail business using SQL and PostgreSQL. This project demonstrates an end-to-end analytics workflow: from raw transactional data to actionable business insights.

---

This project contains Power BI part. You can find README file here: [README.md](powerbi-dashboard\README.md)
---

## 📊 Project Overview

Adventure Works is a global bicycle manufacturer and retailer. This analysis explores **56,046 sales transactions** from **18,148 customers** across **10 territories** in 6 countries to uncover revenue drivers, customer behavior patterns, geographic performance variations, and product profitability.

**Time Period:** 2015 — June 2017
**Total Revenue Analyzed:** $24.9 Million  
**Database:** PostgreSQL | Adventure Works (Kaggle)

---

## 🛠️ Technical Details

### Database & Tools
- **Database:** PostgreSQL
- **Data Source:** Adventure Works (Kaggle)
- **Query Language:** SQL (PostgreSQL dialect)
- **Analysis Date:** June 2026

### Query Techniques Demonstrated
- **Multi-table JOINs** — connecting sales, products, customers, territories
- **Aggregate Functions** — SUM, COUNT, AVG for business metrics
- **Date Functions** — grouping and formatting temporal data
- **Window Functions** — ranking, percentages, running totals
- **Subqueries** — nested queries for complex analysis
- **Profit Calculations** — margin analysis, variance, contribution

---

## 🎯 Business Questions Answered

This project answers five core business questions through SQL analysis:

1. **How is revenue trending over time?** — Identify growth patterns and seasonal trends to inform production planning
2. **Which product categories drive the most profit?** — Understand profitability dynamics and margin opportunities
3. **Who are our most valuable customers?** — Identify high-value customer segments for retention strategies
4. **Which regions are performing best?** — Compare geographic market strength and identify underperforming areas
5. **What are our top-selling products?** — Recognize bestsellers, analyze portfolio concentration, and optimize inventory

---

## 📁 Repository Structure

```
analytics_sql_part/
├── README.md (you are here)
├── insights.md (detailed findings & recommendations)
├── queries/
│   ├── 01_monthly_revenue_trends.sql
│   ├── 02_revenue_by_category.sql
│   ├── 03_top_customers_lifetime_value.sql
│   ├── 04_regional_performance.sql
│   └── 05_top_products_by_revenue.sql
└── csv_files/
    └── all csv files used
|-- powerbi-dashboard
```

---

## 🔍 Analysis Overview

### Query 1: Monthly Revenue Trends
**File:** `01_monthly_revenue_trends.sql`

Tracks monthly revenue, order volume, and customer acquisition from 2015 to 2017.

```sql
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
```



**Key Finding:** Revenue grew consistently from $952K (Sept 2016) to $1.83M (June 2017), with Q2 consistently outperforming other quarters. This 9-month upward trajectory suggests strong organic growth and healthy seasonal demand patterns.

**Key Metrics:**
- Peak Month: June 2017 ($1,826,984)
- Average Monthly Revenue: ~$1.4M
- Customer Acquisition: ~2,000 new customers/month
- Average Order Value: $300–$340

---

### Query 2: Revenue by Product Category
**File:** `02_revenue_by_category.sql`

Analyzes sales and profitability across three product categories: Bikes, Accessories, and Clothing.

```sql
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
```

**Key Finding:** Bikes dominate revenue ($23.6M, 94% of total) but have the lowest profit margin at 41%. Accessories, despite generating only $906K in revenue, have the highest margin at 63%. This reveals a critical opportunity for margin optimization through accessory bundling.

**Strategic Insight:** The business operates on a high-volume, moderate-margin model (Bikes) combined with high-margin, low-volume products (Accessories). The opportunity lies in bundling high-margin accessories with every bike purchase.

---

### Query 3: Top Customers by Lifetime Value
**File:** `03_top_customers_lifetime_value.sql`

Identifies the top 10 most valuable customers and their purchase behavior.

```sql
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
```

**Key Finding:** Top 10 customers represent $113K in concentrated lifetime value, ranging from $10.3K to $12.4K per customer. Most made 4–7 purchases at $1,800–$2,000 per order (consistent with bike pricing). This concentration represents both a revenue asset and a retention risk.

**Strategic Insight:** Customer value is highly concentrated. Losing a single top-10 customer means losing $10K+ in revenue. A VIP retention program is critical to protect this revenue base.

---

### Query 4: Regional Sales Performance
**File:** `04_regional_performance.sql`

Compares sales performance across 10 territories spanning 6 countries and 3 continents.
```sql
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
```

**Key Finding:** Australia is the clear geographic winner, generating $7.4M (24% of revenue) from 3,480 customers with exceptional per-customer efficiency ($2,131/customer). In stark contrast, US Southeast, Northeast, and Central regions combined generate less than $22K — raising questions about data quality or market penetration.

**Strategic Insight:** Geographic concentration risk is significant. Australia's 3x efficiency advantage suggests market-specific factors (market dynamics, sales team capability, product fit) that should be replicated in underperforming regions.

---

### Query 5: Top Products by Revenue
**File:** `05_top_products_by_revenue.sql`

Analyzes the top 20 products by revenue to understand product portfolio performance.
```sql
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
```

**Key Finding:** Mountain-200 variants dominate, with 6 of the top 10 products being different size/color variants of the same model. This line generates over $7M in revenue with consistent 46% margins. Road and Touring bike variants rank 7-20, indicating a narrow but proven product focus.

**Strategic Insight:** Product portfolio is highly concentrated. While Mountain-200 is a proven winner, the narrow product range indicates inventory risk and limited market appeal. Diversification or bundling strategies should be considered.

---

## 💡 Key Strategic Findings

| Finding | Implication | Recommendation |
|---------|-------------|-----------------|
| **Revenue Growing 9+ Months** | Strong market demand, healthy business trajectory | Maintain production momentum, capitalize on Q2 strength |
| **Margin Gap Between Categories** | Accessories 63% vs. Bikes 41% | Bundle high-margin accessories with bike sales |
| **Customer Value Concentrated** | Top 10 customers = $113K revenue | Implement VIP loyalty program to prevent churn |
| **Geographic Disparity** | Australia $2,131/customer vs. US South $393/customer | Replicate Australia's strategy in underperforming regions |
| **Product Concentration** | Mountain-200 = 6 of top 10 SKUs | Diversify portfolio while protecting bestseller |

---




## 📈 Business Recommendations

**Priority 1 — Protect High-Value Customers**
- Implement VIP loyalty rewards program for top 10 customers
- Risk mitigation: single lost customer = $10K+ revenue loss

**Priority 2 — Maximize Mountain-200 Revenue**
- Increase marketing and inventory allocation to proven bestseller
- Target Q1 for promotional spend to capitalize on Q2 seasonal strength

**Priority 3 — Bundle & Optimize Margins**
- Bundle high-margin accessories (63%) with bike purchases (41%)
- Potential: increase overall margin from 41% to 45%+

**Priority 4 — Investigate Regional Underperformance**
- Deep-dive into why Southeast/Northeast/Central US have <$22K combined revenue
- Replicate Australia's success factors ($2,131/customer efficiency)

---

## 📚 About This Portfolio Project

This project demonstrates core data analyst competencies:

✅ **SQL Proficiency** — complex joins, aggregations, window functions, profit calculations  
✅ **Business Analysis** — asking the right questions, interpreting data, identifying patterns  
✅ **Data Storytelling** — translating queries into actionable insights and recommendations  
✅ **Professional Communication** — clear documentation, structured findings, business-focused recommendations  
✅ **End-to-End Workflow** — from raw data to insights to strategy

---

## 🚀 Next Steps

This analysis has been visualized in interactive dashboards using **Power BI** for deeper exploration. See the `/power_bi/` folder for interactive reports (coming soon).

---

## 👨‍💼 Questions?

For questions about the analysis, SQL queries, or methodology, feel free to reach out or review the detailed insights in [insights.md](insights.md).

---