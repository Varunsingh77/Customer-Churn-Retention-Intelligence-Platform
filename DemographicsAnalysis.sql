-- Customer Demographics Analysis 

-- What is the gender distribution of customers? 
SELECT
    gender,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),2) AS percentage
FROM customers
GROUP BY gender;

-- How many customers are senior citizens? 
SELECT
    CASE
        WHEN senior_citizen = 1 THEN 'Senior Citizen'
        ELSE 'Non Senior Citizen'
    END AS customer_type,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),2) AS percentage
FROM customers
GROUP BY senior_citizen;


-- How many customers have a partner? 
SELECT
    partner,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),2) AS percentage
FROM customers
GROUP BY partner;


-- How many customers have dependents? 
SELECT
    dependents,
    COUNT(*) AS total_customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(),2) AS percentage
FROM customers
GROUP BY dependents;

-- What is the average customer tenure? 

SELECT
    ROUND(AVG(tenure),2) AS average_tenure_months
FROM billing;

-- How are customers distributed across different tenure groups? 

SELECT
CASE
    WHEN tenure < 12 THEN '0-11 Months'
    WHEN tenure BETWEEN 12 AND 24 THEN '12-24 Months'
    WHEN tenure BETWEEN 25 AND 48 THEN '25-48 Months'
    ELSE '49+ Months'
END AS tenure_group,
COUNT(*) AS customers
FROM billing
GROUP BY tenure_group
ORDER BY MIN(tenure);


