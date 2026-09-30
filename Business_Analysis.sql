-- Business Question

-- How many customers does TeleConnect currently have?
SELECT COUNT(*) AS total_customers
FROM customers;

-- How many customers have churned?
SELECT COUNT(*) AS churned_customers
FROM churn_status
WHERE churn = 'Yes';

-- What is the overall customer churn rate? 
SELECT
    ROUND(
        SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS churn_rate
FROM churn_status;

-- How many customers are currently active?
SELECT COUNT(*) AS active_customers
FROM churn_status
WHERE churn = 'No';

-- What is the distribution of active and churned customers?
SELECT
    churn,
    COUNT(*) AS customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM churn_status
GROUP BY churn;





