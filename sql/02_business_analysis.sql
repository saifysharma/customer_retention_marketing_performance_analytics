--  CUSTOMER RETENTION ANALYSIS

-- Q1. Which customers have the highest lifetime value and are currently churned or at risk?
-- Q1.1: Find the top 20% LTV cutoff
SELECT lifetime_value
FROM customers
ORDER BY lifetime_value DESC
LIMIT 1 OFFSET 2999;
-- Q1.2 → Identify high-value churned customers
SELECT
customer_id,
lifetime_value,
churn
FROM customers
WHERE lifetime_value >= 1801.67
AND churn = 1
ORDER BY lifetime_value DESC;
-- Q1.3: Calculate the number and total LTV of high-value churned customers
SELECT
COUNT(*) AS high_value_churned_customers,
ROUND(SUM(lifetime_value), 2) AS total_ltv_lost
FROM customers
WHERE lifetime_value >= 1801.67
AND churn = 1;

-- Q2. Which high-value customers have both low satisfaction and high support activity?
-- Q2.1: Count high-value customers with low satisfaction and high support activity
SELECT COUNT(*) AS customers_needing_attention
FROM customers
WHERE lifetime_value >= 1801.67
AND satisfaction_score <= 2
AND support_tickets >= 5;
-- Q2.2: Identify the high-value customers needing attention  
SELECT
customer_id,
lifetime_value,
satisfaction_score,
support_tickets,
churn
FROM customers
WHERE lifetime_value >= 1801.67
AND satisfaction_score <= 2
AND support_tickets >= 5
ORDER BY lifetime_value DESC;
-- Q2.3: Compare active and churned customers in this group
SELECT
churn,
COUNT(*) AS customer_count
FROM customers
WHERE lifetime_value >= 1801.67
AND satisfaction_score <= 2
AND support_tickets >= 5
GROUP BY churn;

-- Q3. Which high-value customers have requested refunds or experienced delivery delays?
-- Q3.1: Count high-value customers with refunds or delivery delays
SELECT COUNT(*) AS customers_with_issues
FROM customers
WHERE lifetime_value >= 1801.67
AND (
refund_requested = 1
OR delivery_delay_days > 0
);
-- Q3.2: Compare churn among high-value customers with experience issues
SELECT
churn,
COUNT(*) AS customer_count
FROM customers
WHERE lifetime_value >= 1801.67
AND (
refund_requested = 1
OR delivery_delay_days > 0
)
GROUP BY churn;

-- Q3.3: Compare churn for refunds and delivery delays
SELECT
'Refund requested' AS issue,
COUNT(*) AS customers,
SUM(churn) AS churned_customers,
AVG(churn) * 100 AS churn_rate
FROM customers
WHERE lifetime_value >= 1801.67
AND refund_requested = 1

UNION ALL

SELECT
'Delivery delay' AS issue,
COUNT(*) AS customers,
SUM(churn) AS churned_customers,
AVG(churn) * 100 AS churn_rate
FROM customers
WHERE lifetime_value >= 1801.67
AND delivery_delay_days > 0;
  
  
-- Q4. Which customer groups contribute significant revenue but also have high churn?
SELECT
country,
COUNT(*) AS customer_count,
SUM(total_spent) AS total_revenue,
AVG(churn) * 100 AS churn_rate
FROM customers
GROUP BY country
ORDER BY churn_rate DESC;

-- Q5. Are customers with repeated support issues contributing significant revenue?
SELECT
CASE
WHEN support_tickets >= 5 THEN 'Repeated support issues'
ELSE 'Normal support activity'
END AS support_group,
COUNT(*) AS customer_count,
SUM(total_spent) AS total_revenue,
AVG(total_spent) AS avg_revenue_per_customer
FROM customers
GROUP BY
CASE
WHEN support_tickets >= 5 THEN 'Repeated support issues'
ELSE 'Normal support activity'
END;

-- Q6.What percentage of high-value churned customers requested a refund?
-- Q6.1 — Refund rate among high-value churned customers
SELECT
COUNT(*) AS high_value_churned_customers,
SUM(refund_requested) AS customers_with_refund,
AVG(refund_requested) * 100 AS refund_rate
FROM customers
WHERE lifetime_value >= 1801.67
AND churn = 1;
  
-- Q6.2 — Compare active vs churned high-value customers
SELECT
churn,
COUNT(*) AS customer_count,
SUM(refund_requested) AS customers_with_refund,
AVG(refund_requested) * 100 AS refund_rate
FROM customers
WHERE lifetime_value >= 1801.67
GROUP BY churn;

-- Q7. Do customers experiencing delivery delays have higher churn?
-- Q7: Compare churn between customers with and without delivery delays

SELECT
CASE
WHEN delivery_delay_days > 0 THEN 'Delivery delay'
ELSE 'No delivery delay'
END AS delivery_group,
COUNT(*) AS customer_count,
SUM(churn) AS churned_customers,
AVG(churn) * 100 AS churn_rate
FROM customers
GROUP BY
CASE
WHEN delivery_delay_days > 0 THEN 'Delivery delay'
ELSE 'No delivery delay'
END;

-- MARKETING ANALYSIS

-- Q8. Which acquisition channels generate the greatest total customer lifetime value?
SELECT
acquisition_channel,
COUNT(*) AS customer_count,
SUM(lifetime_value) AS total_lifetime_value
FROM customers
GROUP BY acquisition_channel
ORDER BY total_lifetime_value DESC;

-- Q9. Which channels acquire many customers but contribute relatively little customer value?
SELECT
acquisition_channel,
COUNT(*) AS customer_count,
AVG(lifetime_value) AS avg_lifetime_value
FROM customers
GROUP BY acquisition_channel
ORDER BY customer_count DESC;

-- Q10. Which channels acquire fewer customers but produce higher-value customers?
SELECT 
acquisition_channel,
COUNT(*) AS customer_count,
AVG(lifetime_value) AS avg_lifetime_value
FROM customers
GROUP BY acquisition_channel
ORDER BY customer_count ASC;

-- Q11. Which acquisition channels provide the best combination of customer volume, LTV, and retention?
SELECT
acquisition_channel,
COUNT(*) AS customer_count,
AVG(lifetime_value) AS avg_lifetime_value,
AVG(churn) * 100 AS churn_rate
FROM customers
GROUP BY acquisition_channel
ORDER BY avg_lifetime_value DESC;

-- Q12. Which channels generate the greatest customer value relative to marketing spend?
SELECT
acquisition_channel,
SUM(lifetime_value) AS total_ltv,
SUM(marketing_spend_per_user) AS total_marketing_spend,
SUM(lifetime_value) / SUM(marketing_spend_per_user) AS ltv_to_marketing_ratio
FROM customers
GROUP BY acquisition_channel
ORDER BY ltv_to_marketing_ratio DESC;

-- HIGH-LTV CUSTOMER ANALYSIS

-- Q13. What characteristics are common among the company's highest-LTV customers?
SELECT
COUNT(*) AS high_value_customers,
AVG(age) AS avg_age,
AVG(total_visits) AS avg_visits,
AVG(avg_session_time) AS avg_session_time,
AVG(pages_per_session) AS avg_pages_per_session,
AVG(last_3_month_purchase_freq) AS avg_purchase_frequency,
AVG(avg_order_value) AS avg_order_value,
AVG(total_spent) AS avg_total_spent,
AVG(satisfaction_score) AS avg_satisfaction,
AVG(nps_score) AS avg_nps,
AVG(is_premium_user) * 100 AS premium_user_percent,
AVG(support_tickets) AS avg_support_tickets,
AVG(refund_requested) * 100 AS refund_rate,
AVG(delivery_delay_days) AS avg_delivery_delay
FROM customers
WHERE lifetime_value >= 1801.67;

-- Q14. How do high-LTV customers differ from the rest of the customer base?

SELECT
CASE
WHEN lifetime_value >= 1801.67 THEN 'High-LTV'
ELSE 'Other customers'
END AS customer_group,
COUNT(*) AS customer_count,
AVG(last_3_month_purchase_freq) AS avg_purchase_frequency,
AVG(avg_order_value) AS avg_order_value,
AVG(total_visits) AS avg_visits,
AVG(avg_session_time) AS avg_session_time,
AVG(pages_per_session) AS avg_pages_per_session,
AVG(satisfaction_score) AS avg_satisfaction,
AVG(is_premium_user) * 100 AS premium_user_percent,
AVG(support_tickets) AS avg_support_tickets
FROM customers
GROUP BY
CASE
WHEN lifetime_value >= 1801.67 THEN 'High-LTV'
ELSE 'Other customers'
END;
