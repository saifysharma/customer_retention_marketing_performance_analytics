# Customer Retention & Marketing Performance Analytics

**Python + SQL analysis of customer data to evaluate customer quality, customer engagement, churn, customer lifetime value, customer experience, and marketing-channel performance.**

## Business Problem

The company collects customer, behavioral, transactional, marketing, and customer-experience data. However, management lacks clear visibility into which customers generate the most value, which valuable customers are being lost, what customer issues may require attention, and which acquisition channels generate the strongest customer value.

Without these insights, it becomes difficult to prioritize customer-retention efforts, improve customer experience, and allocate marketing resources effectively.

## Business Objective

Analyze **customer behavior, customer lifetime value, churn, customer experience, and acquisition-channel performance** to identify valuable customers, retention opportunities, marketing effectiveness, and actionable business recommendations.

## Dataset

**Sales & Marketing Customer Dataset — Kaggle**

The dataset contains:

* **15,000 customer records**
* **30 columns**

Key areas include:

* Customer demographics
* Customer location
* Customer engagement
* Purchase behavior
* Subscription information
* Acquisition channels
* Customer support activity
* Customer satisfaction
* Refund requests
* Delivery delays
* Marketing spend
* Customer lifetime value
* Customer churn

The raw dataset contained missing values, invalid values, inconsistent records, and potential outliers that were reviewed and cleaned before analysis.

## Tools

* **Python** — Data quality assessment, data cleaning, exploratory data analysis, and visualization
* **Pandas & NumPy** — Data manipulation and analysis
* **Matplotlib & Seaborn** — Data visualization
* **MySQL / SQL** — Business analysis and calculations
* **Jupyter Notebook** — Analysis workflow
* **Kaggle** — Dataset source

## Data Preparation

The project began with a data-quality assessment and cleaning process.

### Data Quality

Reviewed:

* Missing values
* Duplicate records
* Data types
* Invalid values
* Date consistency
* Binary-variable validity
* Potential outliers

### Data Cleaning

Performed:

* Numerical missing-value treatment
* Categorical missing-value treatment
* Invalid age-value treatment
* Binary-value validation
* Date conversion and consistency checks
* Outlier review using the IQR method
* Final dataset validation

The cleaned dataset was then exported and loaded into MySQL for SQL-based business analysis.

## Exploratory Data Analysis

### Customer Analysis

Analyzed customer demographics, customer value, spending behavior, and engagement patterns.

### Churn Analysis

Analyzed the overall churn rate and investigated customer groups associated with churn.

### Marketing Analysis

Analyzed acquisition channels to understand customer volume, customer value, and channel performance.

## Business Analysis

### Customer Retention

Analyzed high-value customers, high-value churn, lost customer value, customer satisfaction, support activity, refunds, delivery issues, and country-level churn.

### Customer Experience

Investigated repeated support issues, refund behavior, and delivery delays to identify customer-experience areas requiring attention.

### Marketing Performance

Compared acquisition channels using:

* Customer volume
* Total customer lifetime value
* Average customer lifetime value
* Churn rate
* Customer value relative to marketing spend

### High-Value Customers

Identified the top **20% of customers by lifetime value** and compared their characteristics with the rest of the customer base.

## Key Insights

### Customer Retention

* **High-Value Segment:** The top **20% of customers represents 3,000 customers**, using a lifetime-value threshold of **1,801.67**.
* **High-Value Churn:** **475 high-value customers have churned**, representing an important retention opportunity.
* **Country Churn:** **India has the highest churn rate at 15.93%**, followed by the **UK at 15.80%**. **Germany has the lowest churn rate at 13.93%**.

### Customer Experience

* **Support Issues:** **809 customers** with repeated support issues generated approximately **404K in revenue**, indicating that customer-support problems affect a meaningful revenue-generating segment.
* **Refunds:** Among **475 high-value churned customers**, **69 requested refunds**, resulting in a **14.53% refund rate**.
* **Delivery Delays:** Customers with delivery delays had a **15.22% churn rate**, compared with **17.13%** for customers without recorded delivery delays. Delivery delays therefore did not appear to be associated with higher churn in this dataset.

### Marketing

* **Total Customer Value:** **Organic** generated the highest total customer lifetime value at approximately **3.76M**.
* **Average Customer Value:** **Referral** generated the highest average LTV at approximately **1,249.41**, followed by **Email at 1,242.45**.
* **Marketing Efficiency:** **Organic** generated the strongest LTV-to-marketing-spend ratio at **71.48**, followed by **Email at 70.63**.
* **Channel Opportunity:** Referral and Email acquire relatively fewer customers but generate comparatively high average customer value.

### High-Value Customers

* The analysis compared **3,000 high-LTV customers** with **12,000 other customers**.
* High-LTV customers showed only small differences in engagement, purchase frequency, satisfaction, and premium membership compared with the rest of the customer base.
* This suggests that no single analyzed behavioral characteristic clearly defines a high-LTV customer.

## Business Recommendations

1. **Prioritize retention of high-value customers**, particularly customers with high lifetime value who have already churned or show signs of customer-experience problems.

2. **Investigate repeated support issues** and identify the most common causes, as customers experiencing recurring support problems still contribute meaningful revenue.

3. **Investigate higher churn in India and the UK** by examining customer experience, acquisition channels, engagement, and local market differences.

4. **Continue investing in efficient acquisition channels**, particularly Organic, which generated both the highest total LTV and strongest LTV-to-marketing-spend ratio.

5. **Evaluate opportunities to scale Referral and Email acquisition**, as these channels generate relatively high average customer value despite lower customer volume.

6. **Investigate refund reasons**, but avoid assuming that refunds directly cause churn because the refund rate was not higher among high-value churned customers.

7. **Avoid treating delivery delays as a confirmed churn driver**  and investigate additional customer-experience variables.

8. **Develop a broader high-value customer segmentation strategy**, incorporating additional purchase history, customer lifecycle, geography, and acquisition information rather than relying on a single behavioral characteristic.


## Project Deliverables

- Raw and cleaned datasets
- Data quality assessment
- Data cleaning and validation
- Exploratory data analysis
- Python visualizations
- MySQL database setup
- 14 SQL business questions
- Business insights
- Actionable business recommendations

## Outcome

The project demonstrates an end-to-end analytics workflow using **Python and SQL**, from raw-data quality assessment and cleaning to exploratory analysis, business-focused SQL analysis, and actionable recommendations.

The analysis focuses on helping a business understand:

**Which customers are valuable → Which customers are being lost → What customer issues require attention → Which marketing channels generate the strongest customer value.**


