-- Service Subscription Analysis

/*
Question 12
Business Question:
Which internet service is most commonly used by customers?
*/

SELECT
    internet_service,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),2) AS percentage
FROM services
GROUP BY internet_service
ORDER BY total_customers DESC;

/*
Question 13
Business Question:
Which contract type is the most common?
*/

SELECT
    contract_type,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),2) AS percentage
FROM contracts
GROUP BY contract_type
ORDER BY total_customers DESC;

/*
Question 14
Business Question:
Which payment method is most commonly used?
*/

SELECT
    payment_method,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),2) AS percentage
FROM contracts
GROUP BY payment_method
ORDER BY total_customers DESC;

/*
Question 15
Business Question:
How many customers have phone service?
*/

SELECT
    phone_service,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),2) AS percentage
FROM services
GROUP BY phone_service;

/*
Question 16
Business Question:
How many customers subscribe to Online Security?
*/

SELECT
    online_security,
    COUNT(*) AS total_customers
FROM services
GROUP BY online_security
ORDER BY total_customers DESC;

/*
Question 17
Business Question:
How many customers subscribe to Tech Support?
*/

SELECT
    tech_support,
    COUNT(*) AS total_customers
FROM services
GROUP BY tech_support
ORDER BY total_customers DESC;

/*
Question 18A
How many customers subscribe to Streaming TV and Streaming Movies?
*/

SELECT
    streaming_tv,
    COUNT(*) AS total_customers
FROM services
GROUP BY streaming_tv;

/*
Question 18B
How many customers subscribe to Streaming TV and Streaming Movies?
*/

SELECT
    streaming_movies,
    COUNT(*) AS total_customers
FROM services
GROUP BY streaming_movies;





