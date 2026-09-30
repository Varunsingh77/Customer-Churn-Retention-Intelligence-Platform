-- views

/*
Customer Profile View
*/

CREATE VIEW vw_customer_profile AS
SELECT
    c.customer_id,
    c.gender,
    c.senior_citizen,
    c.partner,
    c.dependents,
    s.internet_service,
    ct.contract_type,
    b.monthly_charges,
    ch.churn
FROM customers c
JOIN services s
ON c.customer_id = s.customer_id
JOIN contracts ct
ON c.customer_id = ct.customer_id
JOIN billing b
ON c.customer_id = b.customer_id
JOIN churn_status ch
ON c.customer_id = ch.customer_id;


/*
High Value Customers
*/

CREATE VIEW vw_high_value_customers AS

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
Churned Customers
*/

CREATE VIEW vw_churned_customers AS

SELECT
    b.customer_id,
    b.monthly_charges,
    b.total_charges
FROM billing b
JOIN churn_status ch
ON b.customer_id = ch.customer_id
WHERE ch.churn='Yes';

