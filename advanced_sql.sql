-- advanced_sql

/*
Question 1
Business Question:
Rank customers based on total revenue.
*/

SELECT
    customer_id,
    total_charges,
    RANK() OVER(ORDER BY total_charges DESC) AS customer_rank
FROM billing;


/*
Question 2
Business Question:
Assign a unique row number to customers based on total revenue.
*/

SELECT
    customer_id,
    total_charges,
    ROW_NUMBER() OVER(ORDER BY total_charges DESC) AS row_num
FROM billing;


/*
Question 3
Business Question:
Rank customers without skipping rank values.
*/

SELECT
    customer_id,
    total_charges,
    DENSE_RANK() OVER(ORDER BY total_charges DESC) AS `dense_rank`
FROM billing;


/*
Question 4
Business Question:
Show cumulative monthly revenue.
*/

SELECT
    customer_id,
    monthly_charges,
    SUM(monthly_charges) OVER(
        ORDER BY monthly_charges DESC
    ) AS running_revenue
FROM billing;


/*
Question 5
Business Question:
Show average monthly charge by contract type.
*/

SELECT
    c.customer_id,
    c.contract_type,
    b.monthly_charges,
    ROUND(
        AVG(b.monthly_charges) OVER(PARTITION BY c.contract_type),
        2
    ) AS avg_contract_charge
FROM contracts c
JOIN billing b
ON c.customer_id = b.customer_id;


/*
Question 6
Business Question:
Find customers paying above average monthly charges.
*/

WITH avg_charge AS
(
    SELECT AVG(monthly_charges) AS avg_monthly
    FROM billing
)

SELECT
    customer_id,
    monthly_charges
FROM billing
WHERE monthly_charges >
(
    SELECT avg_monthly
    FROM avg_charge
);


/*
Question 7
Business Question:
Find the top 5 customers by total revenue.
*/

SELECT
    customer_id,
    total_charges
FROM billing
ORDER BY total_charges DESC
LIMIT 5;


/*
Question 8
Business Question:
Find customers whose total revenue is above the company average.
*/

SELECT
    customer_id,
    total_charges
FROM billing
WHERE total_charges >
(
    SELECT AVG(total_charges)
    FROM billing
);


/*
Question 9
Business Question:
Calculate each customer's contribution to total revenue.
*/

SELECT
    customer_id,
    total_charges,
    ROUND(
        total_charges * 100 /
        (SELECT SUM(total_charges) FROM billing),
        4
    ) AS revenue_percentage
FROM billing
ORDER BY revenue_percentage DESC;


/*
Question 10
Business Question:
Find the top revenue customer in each contract type.
*/

WITH ranked_customers AS
(
    SELECT
        c.contract_type,
        b.customer_id,
        b.total_charges,
        ROW_NUMBER() OVER(
            PARTITION BY c.contract_type
            ORDER BY b.total_charges DESC
        ) AS rn
    FROM contracts c
    JOIN billing b
    ON c.customer_id = b.customer_id
)

SELECT
    contract_type,
    customer_id,
    total_charges
FROM ranked_customers
WHERE rn = 1;



