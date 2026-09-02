CREATE DATABASE customer_analytics;
USE customer_analytics;

CREATE TABLE customers (
    customer_id INT,
    gender VARCHAR(20),
    age DECIMAL(5,2),
    country VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE,
    last_purchase_date DATE,
    acquisition_channel VARCHAR(50),
    device_type VARCHAR(30),
    subscription_type VARCHAR(30),
    is_premium_user INT,
    total_visits INT,
    avg_session_time DECIMAL(10,4),
    pages_per_session DECIMAL(10,4),
    email_open_rate DECIMAL(10,6),
    email_click_rate DECIMAL(10,6),
    total_spent DECIMAL(12,2),
    avg_order_value DECIMAL(10,2),
    discount_used INT,
    coupon_code VARCHAR(30),
    support_tickets INT,
    refund_requested INT,
    delivery_delay_days INT,
    payment_method VARCHAR(30),
    satisfaction_score DECIMAL(5,2),
    nps_score INT,
    marketing_spend_per_user DECIMAL(10,2),
    lifetime_value DECIMAL(12,2),
    last_3_month_purchase_freq INT,
    churn INT
);

SHOW TABLES;
DESCRIBE customers;
select * from customers;