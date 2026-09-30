-- Customer Segmentation

/*
Question 1
Business Question:
Who are the high-value customers?
*/

SELECT
    customer_id,
    monthly_charges,
    total_charges
FROM billing
WHERE total_charges > (
    SELECT AVG(total_charges)
    FROM billing
)
ORDER BY total_charges DESC;


/*
Question 2
Business Question:
Who are the loyal customers?
*/

SELECT
    customer_id,
    tenure,
    total_charges
FROM billing
WHERE tenure >= 60
ORDER BY tenure DESC;


/*
Question 3
Business Question:
Who are the new customers?
*/

SELECT
    customer_id,
    tenure
FROM billing
WHERE tenure <= 12
ORDER BY tenure;


/*
Question 4
Business Question:
Who are the high-risk customers?
*/

SELECT
    b.customer_id,
    b.monthly_charges,
    c.contract_type,
    s.internet_service
FROM billing b
JOIN contracts c
ON b.customer_id = c.customer_id
JOIN services s
ON b.customer_id = s.customer_id
JOIN churn_status ch
ON b.customer_id = ch.customer_id
WHERE ch.churn = 'Yes'
ORDER BY b.monthly_charges DESC;


/*
Question 5
Business Question:
Who are the premium customers?
*/

SELECT
    b.customer_id,
    b.monthly_charges,
    s.internet_service,
    c.contract_type
FROM billing b
JOIN services s
ON b.customer_id = s.customer_id
JOIN contracts c
ON b.customer_id = c.customer_id
WHERE b.monthly_charges > 80
ORDER BY b.monthly_charges DESC;


/*
Question 6
Business Question:
Which customers have both Online Security and Tech Support?
*/

SELECT
    customer_id,
    online_security,
    tech_support
FROM services
WHERE online_security = 'Yes'
AND tech_support = 'Yes';


/*
Question 7
Business Question:
Which customers have no Online Security and no Tech Support?
*/

SELECT
    customer_id,
    online_security,
    tech_support
FROM services
WHERE online_security = 'No'
AND tech_support = 'No';


/*
Question 8
Business Question:
Which churned customers generated the highest lifetime revenue?
*/

SELECT
    b.customer_id,
    b.total_charges
FROM billing b
JOIN churn_status ch
ON b.customer_id = ch.customer_id
WHERE ch.churn = 'Yes'
ORDER BY b.total_charges DESC
LIMIT 10;


/*
Question 9
Business Question:
Which active customers generate the highest monthly revenue?
*/

SELECT
    b.customer_id,
    b.monthly_charges
FROM billing b
JOIN churn_status ch
ON b.customer_id = ch.customer_id
WHERE ch.churn = 'No'
ORDER BY b.monthly_charges DESC
LIMIT 10;


/*
Question 10
Business Question:
Which customers use Fiber Optic with Month-to-Month contracts?
*/

SELECT
    s.customer_id,
    s.internet_service,
    c.contract_type
FROM services s
JOIN contracts c
ON s.customer_id = c.customer_id
WHERE s.internet_service = 'Fiber optic'
AND c.contract_type = 'Month-to-month';

