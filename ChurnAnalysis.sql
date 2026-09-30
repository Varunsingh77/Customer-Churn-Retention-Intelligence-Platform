-- Churn Analysis

/*
Question 1
Business Question:
Which contract type has the highest churn rate?
*/

SELECT
    c.contract_type,
    COUNT(*) AS total_customers,
    SUM(ch.churn = 'Yes') AS churned_customers,
    ROUND(SUM(ch.churn = 'Yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM contracts c
JOIN churn_status ch
ON c.customer_id = ch.customer_id
GROUP BY c.contract_type
ORDER BY churn_rate DESC;


/*
Question 2
Business Question:
Which internet service has the highest churn rate?
*/

SELECT
    s.internet_service,
    COUNT(*) AS total_customers,
    SUM(ch.churn = 'Yes') AS churned_customers,
    ROUND(SUM(ch.churn = 'Yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM services s
JOIN churn_status ch
ON s.customer_id = ch.customer_id
GROUP BY s.internet_service
ORDER BY churn_rate DESC;


/*
Question 3
Business Question:
Which payment method has the highest churn rate?
*/

SELECT
    c.payment_method,
    COUNT(*) AS total_customers,
    SUM(ch.churn = 'Yes') AS churned_customers,
    ROUND(SUM(ch.churn = 'Yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM contracts c
JOIN churn_status ch
ON c.customer_id = ch.customer_id
GROUP BY c.payment_method
ORDER BY churn_rate DESC;


/*
Question 4
Business Question:
Does gender affect customer churn?
*/

SELECT
    c.gender,
    COUNT(*) AS total_customers,
    SUM(ch.churn = 'Yes') AS churned_customers,
    ROUND(SUM(ch.churn = 'Yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers c
JOIN churn_status ch
ON c.customer_id = ch.customer_id
GROUP BY c.gender;

/*
Question 5
Business Question:
Do senior citizens churn more than non-senior customers?
*/

SELECT
    CASE
        WHEN c.senior_citizen = 1 THEN 'Senior Citizen'
        ELSE 'Non Senior Citizen'
    END AS customer_type,
    COUNT(*) AS total_customers,
    SUM(ch.churn = 'Yes') AS churned_customers,
    ROUND(SUM(ch.churn = 'Yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers c
JOIN churn_status ch
ON c.customer_id = ch.customer_id
GROUP BY customer_type;


/*
Question 6
Business Question:
Does partner status affect customer churn?
*/

SELECT
    partner,
    COUNT(*) AS total_customers,
    SUM(ch.churn = 'Yes') AS churned_customers,
    ROUND(SUM(ch.churn = 'Yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers c
JOIN churn_status ch
ON c.customer_id = ch.customer_id
GROUP BY partner;


/*
Question 7
Business Question:
Do customers with dependents churn less?
*/

SELECT
    dependents,
    COUNT(*) AS total_customers,
    SUM(ch.churn = 'Yes') AS churned_customers,
    ROUND(SUM(ch.churn = 'Yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers c
JOIN churn_status ch
ON c.customer_id = ch.customer_id
GROUP BY dependents;


/*
Question 8
Business Question:
Does Online Security reduce customer churn?
*/

SELECT
    online_security,
    COUNT(*) AS total_customers,
    SUM(ch.churn = 'Yes') AS churned_customers,
    ROUND(SUM(ch.churn = 'Yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM services s
JOIN churn_status ch
ON s.customer_id = ch.customer_id
GROUP BY online_security
ORDER BY churn_rate DESC;


/*
Question 9
Business Question:
Does Tech Support reduce customer churn?
*/

SELECT
    tech_support,
    COUNT(*) AS total_customers,
    SUM(ch.churn = 'Yes') AS churned_customers,
    ROUND(SUM(ch.churn = 'Yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM services s
JOIN churn_status ch
ON s.customer_id = ch.customer_id
GROUP BY tech_support
ORDER BY churn_rate DESC;


/*
Question 10
Business Question:
Which tenure group has the highest churn rate?
*/

SELECT
    CASE
        WHEN b.tenure < 12 THEN '0-11 Months'
        WHEN b.tenure BETWEEN 12 AND 24 THEN '12-24 Months'
        WHEN b.tenure BETWEEN 25 AND 48 THEN '25-48 Months'
        ELSE '49+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(ch.churn = 'Yes') AS churned_customers,
    ROUND(SUM(ch.churn = 'Yes') * 100.0 / COUNT(*), 2) AS churn_rate
FROM billing b
JOIN churn_status ch
ON b.customer_id = ch.customer_id
GROUP BY tenure_group
ORDER BY MIN(b.tenure);




