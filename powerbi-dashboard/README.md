# Power BI Dashboard

## Overview
Interactive 3-page dashboard visualizing Adventure Works retail analysis ($24.9M revenue, 25K orders, 17K customers).

**File:** [adventure_works_dashboard.pbix](powerbi-dashboard\powerbi-part.pbix)

---

## Page 1: Executive Summary

![Page 1 - Executive Summary](powerbi-dashboard\assets\page1_executive_summary.png)

**4 KPI Cards:**
- Total Revenue: $24.9M
- Total Orders: 25K
- Unique Customers: 17K
- Avg Order Value: $445

**2 Charts:**
- Monthly Revenue Trend: 9-month growth (Jan 2015 → Jan 2017)
- Revenue by Category: Bikes 94.89%, Accessories 3.64%, Clothing 1.47%

**Insight:** Revenue growing; bikes drive volume, accessories have higher margins.

---

## Page 2: Category & Customer Analysis

![Page 2 - Category & Customer Analysis](powerbi-dashboard\assets\page2_category_customer.png)


**Revenue vs Profit Bar Chart:** Visual gap shows margin opportunity through bundling.

**Top 10 Customers Table:** Maurice Shan leads ($12,408); top 10 = $115K total.

**Data Quality Note:** Two customers named "JORDAN TURNER" with different IDs (11420 and 13420) — separated in table for accuracy. This demonstrates data validation best practices.

**Insight:** High-margin accessories should be bundled with bikes; customer value concentrated.

---

## Page 3: Regional & Product Performance

![Page 3 - Regional & Product Performance](powerbi-dashboard\assets\page3_regional_product.png)

**World Map:** Australia darkest (highest revenue $7.4M); North America medium; Europe light.


**Top Regions Bar Chart:** Australia dominates; Southeast/Northeast/Central underperform.

**Top 15 Products Bar Chart:** Mountain-200 variants = 6 of top 10; high concentration.

**Insight:** Australia 3x more efficient than US; product portfolio narrow but proven.

---

## Key Findings

1. **Margin Gap:** Accessories (63%) vs Bikes (41%) → bundle strategy
2. **Customer Concentration:** Top 10 = 24% revenue → retention critical
3. **Geographic Disparity:** Australia $2,131/customer vs US South $393 → investigate
4. **Product Concentration:** Mountain-200 dominates → diversify or leverage

---

## How to Open

1. Download Power BI Desktop (free)
2. Open `adventure_works_dashboard.pbix`
3. View 3 pages, click charts to filter

---

