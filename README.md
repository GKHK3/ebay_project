# eBay Shop 1 Month Analysis


### 1. Project Overview
Looking into two products I listed on eBay (Product A and Product B) Selling Japanese products in the UK, I compare and delve into each listing using daily performance and listing modification records.

The objective is to understand how modifications to product listings, pricing and sales activity influence customer engagement and listing performance.

Using PostgreSQL and SQL, I collected, organised and analysed listing data to identify patterns in views, watchers and sales. The results were then visualised using Power BI to make comparisons between the two products and identify potential trends.

### 2. Business Questions

1. Which product generates the highest number of views?
2. Which product has the highest engagement rate?
3. How do views and watchers change following listing modifications?
4. Are price reductions associated with increased views?
5. Are certain days of the week associated with higher traffic?
6. Is sales activity associated with changes in listing views?
7. Which listing modifications show the most promising results?


### 3. Tools & Technologies
**PostgreSQL :**   Data storage & management

_______________________________
**SQL :** Data cleaning, transformation and analysis
_____
**Power BI :** Data visualization and dashboard creation
_____
**Excel / CSV :** Data collection, storage and organization
_____
**GitHub :** Project documentation and version control

### 4. Dataset Description 
Two main datasets:

#### Daily Performance  
Records the daily performance of product A and B.

Key Variables: 

* Date
* Product
* Sales
* Price
* Price + delivery
* Views
* Watchers
#### Listing Changes
Records modifications made to the eBay listings.

Key Variables:

* Date of modification
* Product
* Change type
* Description

Both were used interwindingly to investigate relationships between listing modifications and performance.

### 5. Data Analysis & Methodology 

* Aggregating daily views and watchers.
* Calculating average views and watchers by weekday.
* Comparing Product A and Product B.
* Calculating customer engagement using watchers relative to views.
* Identifying listing modifications and measuring performance before and after changes.
* Comparing average views and watchers over seven-day periods before and after modifications.
* Evaluating engagement changes following sales.
* Calculating watcher-to-view engagement rate:
  (Total Watchers / Total Views) * 100.

The analysis uses PostgreSQL queries to transform the raw data into datasets suitable for visualisation.

### 6. Power BI Dashboard

The SQL analysis was imported into Power BI in order to create visualizations.

The dashboard focuses on:

* Daily views and watchers
* Product A vs Product B performance
* Average engagement by day of the week
* Performance before and after changes
* Views and Watchers after sales
* Relationship between listing changes and customer engagement 

### Dashboard preview
![Dashboard Overview](assets/dashboard.jpg)
![Dashboard2 Customer Interest](assets/dashboard2.jpg)
![Dashboard3 Listing Price and Views](assets/dashboard3.jpg)
![Dashboard4 When are customers interested](assets/dashboard4.jpg)
![Dashboard5 Views after modification](assets/dashboard5.jpg)
[*Click here for dashboard*](ebay_dashboard2.pbix)
## 7. Key Findings


### 1. Product Performance

Product A generated more views than Product B,
while Product B achieved a higher engagement rate.

**Evidence:**

![Total Views](assets/keyfindings1_totalviews.jpg)
![Engagement Rate](assets/keyfindings1_engagementrate.jpg)

**Business implication:**
Higher traffic does not necessarily translate
into higher customer engagement. Improving
listing content and product presentation
may help increase customer interaction.

**Limitation:**
The comparison is based on only two products.



### 2. Listing Modifications

The impact of listing modifications varied
depending on the type of change.

**Evidence:**

![Sales after modification](assets/keyfindings2_salesaftermod.jpg)

**Business implication:**
Listing changes should be evaluated individually
to identify which modifications show the
most promising results.

**Limitation:**
Other factors may have influenced traffic
during the observation periods.



### 3. Pricing Analysis

Price reductions were followed by increases
in views and watchers in some observations.

**Evidence:**

![Views after price reduction](assets/keyfindings3_viewsafterpricereduc.jpg)
**Business implication:**
Pricing adjustments may be worth testing
as part of a listing optimisation strategy.

**Limitation:**
The observations do not establish that
price reductions directly caused the
increase in traffic.



### 4. Weekly Performance

Thursday, Saturday and Monday were among
the more active days for listing traffic.

**Evidence:**

![views by weekday](assets/keyfindings4_viewsbyweekday.jpg)

**Business implication:**
Identifying periods of higher traffic may
help inform the timing of future listing
updates and promotional activities.

**Limitation:**
The observation period may be too short
to establish consistent weekly patterns.


### 5. Sales Activity

An increase in views was observed following
a recorded sale.

**Evidence:**

![views after sale](assets/keyfindings4_viewsbyweekday.jpg)

**Business implication:**
Further analysis could help determine whether
sales activity is associated with changes
in listing traffic.

**Limitation:**
The small number of recorded sales makes
it difficult to establish a reliable pattern.



### 8. Limitations & Future Improvements

### Limitations

- The analysis is based on two eBay product listings,
  so the findings may not represent wider marketplace
  behaviour.
- The observation period is relatively short.
- The limited number of sales restricts the ability
  to identify reliable relationships between sales
  and listing traffic.
- Product A and Product B have different listing
  histories, which may affect comparisons.
- Changes in views and watchers may be influenced
  by external factors beyond listing modifications.

Further data collection across a longer period and
a larger number of products would help validate
the findings.


### Future improvements:

* Collect data over a longer period
* Add additional products
* Increase number of observations

### 9. Conclusion
This project demonstrates the use of SQL and Power BI to investigate e-commerce listing performance.

By combining daily performance records with listing modification data, the project explores how changes in pricing, listing activity and sales relate to customer engagement.

It also demonstrates the process of collecting, structuring, analysing and visualising data to support data-driven decision-making.
## Folder Description
* **analysis/**   -   General exploratory analysis
* **assets/**   - Dashboard screenshots and project images
* **modification_impact/** - SQL analysing listing changes
* **performance_trends/**  - Views and watcher trends
* **sales_analysis/**  -  Sales-related analysis
* **sql_load/**   -  Data loading and preparation


## Dataset and Metrics

### Daily Performance

The daily performance dataset records the activity
of two eBay product listings, Product A and Product B.

It includes:
- Date
- Product
- Views
- Watchers
- Listing price
- Sales

### Listing Changes

The listing changes dataset records modifications
made to each product listing.

It includes:
- Modification date
- Product
- Modification type
- Description of the modification

### Key Metrics

| Metric | Calculation |
|---|---|
| Total Views | Sum of daily views |
| Total Watchers | Sum of daily watcher observations, if daily counts |
| Total Sales | Sum of recorded daily sales |
| Engagement Rate | Watchers / Views × 100 |
| Average Views | Total views / number of observations |



## SQL Analysis

The project uses PostgreSQL to analyse product
performance, customer engagement and listing
optimisation.

The SQL queries are organised into the following
categories:

| Analysis | Description |
|---|---|
| Product Comparison | Compares performance between Product A and B |
| Engagement Analysis | Calculates views and watcher engagement |
| Modification Impact | Evaluates performance before and after listing changes |
| Performance Trends | Analyses daily and weekday trends |
| Sales Analysis | Investigates the relationship between sales and views |
| Data Import | Loads CSV data into PostgreSQL |

### SQL Files

- [Product Comparison](analysis/)
- [Engagement Analysis](analysis/)
- [Modification Impact](modification_impact/)
- [Performance Trends](performance_trends/)
- [Sales Analysis](sales_analysis/)
- [Data Import](sql_load/)


### Information
*Author - Gareth Kwok*

*LinkedIn - https://www.linkedin.com/in/gkhk3/*