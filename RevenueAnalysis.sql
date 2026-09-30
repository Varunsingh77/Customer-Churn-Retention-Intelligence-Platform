-- Revenue Analysis

/*
Question 1
Business Question:
What is the total monthly revenue?
*/

SELECT
    ROUND(SUM(monthly_charges),2) AS total_monthly_revenue
FROM billing;


/*
Question 2
Business Question:
What is the total revenue generated?
*/

SELECT
    ROUND(SUM(total_charges),2) AS total_revenue
FROM billing;


/*
Question 3
Business Question:
What is the average monthly charge per customer?
*/

SELECT
    ROUND(AVG(monthly_charges),2) AS avg_monthly_charge
FROM billing;


/*
Question 4
Business Question:
What is the average lifetime revenue per customer?
*/

SELECT
    ROUND(AVG(total_charges),2) AS avg_total_revenue
FROM billing;


/*
Question 5
Business Question:
Which contract type generates the highest monthly revenue?
*/

SELECT
    c.contract_type,
    ROUND(SUM(b.monthly_charges),2) AS monthly_revenue
FROM contracts c
JOIN billing b
ON c.customer_id = b.customer_id
GROUP BY c.contract_type
ORDER BY monthly_revenue DESC;


/*
Question 6
Business Question:
Which internet service generates the highest monthly revenue?
*/

SELECT
    s.internet_service,
    ROUND(SUM(b.monthly_charges),2) AS monthly_revenue
FROM services s
JOIN billing b
ON s.customer_id = b.customer_id
GROUP BY s.internet_service
ORDER BY monthly_revenue DESC;


/*
Question 7
Business Question:
Which payment method generates the highest monthly revenue?
*/

SELECT
    c.payment_method,
    ROUND(SUM(b.monthly_charges),2) AS monthly_revenue
FROM contracts c
JOIN billing b
ON c.customer_id = b.customer_id
GROUP BY c.payment_method
ORDER BY monthly_revenue DESC;


/*
Question 8
Business Question:
How much monthly revenue is at risk due to churn?
*/

SELECT
    ROUND(SUM(b.monthly_charges),2) AS revenue_at_risk
FROM billing b
JOIN churn_status ch
ON b.customer_id = ch.customer_id
WHERE ch.churn='Yes';


/*
Question 9
Business Question:
What is the average monthly charge of churned customers?
*/

SELECT
    ROUND(AVG(b.monthly_charges),2) AS avg_monthly_charge
FROM billing b
JOIN churn_status ch
ON b.customer_id = ch.customer_id
WHERE ch.churn='Yes';


/*
Question 10
Business Question:
Who are the top 10 highest-paying customers?
*/

SELECT
    customer_id,
    monthly_charges,
    total_charges
FROM billing
ORDER BY total_charges DESC
LIMIT 10;


/*
Question 10
Business Question:
Who are the top 10 highest-paying customers?
*/

SELECT
    customer_id,
    monthly_charges,
    total_charges
FROM billing
ORDER BY total_charges DESC
LIMIT 10;



