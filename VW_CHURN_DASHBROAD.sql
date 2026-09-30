/*

Customer Churn & Retention Intelligence Platform
Dashboard View


Purpose:
Create a single analytical view for Power BI.

The view combines customer demographics, services,
contract information, billing information and churn status.

Source Tables:
    customers
    services
    contracts
    billing
    churn_status

*/

CREATE VIEW vw_churn_dashboard AS

SELECT
    -- Customer Information
    c.customer_id,

    -- Demographics
    c.gender,
    c.senior_citizen,
    c.partner,
    c.dependents,

    -- Customer Tenure & Billing
    b.tenure,
    b.monthly_charges,
    b.total_charges,

    -- Contract & Payment
    ct.contract_type,
    ct.paperless_billing,
    ct.payment_method,

    -- Internet & Services
    s.internet_service,
    s.online_security,
    s.online_backup,
    s.device_protection,
    s.tech_support,

    -- Phone & Entertainment
    s.phone_service,
    s.multiple_lines,
    s.streaming_tv,
    s.streaming_movies,

    -- Churn
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
    
    
    
    -- Check total records

SELECT COUNT(*) AS total_customers
FROM vw_churn_dashboard;
    
    
    -- Check for duplicate customers

SELECT
    customer_id,
    COUNT(*) AS record_count
FROM vw_churn_dashboard
GROUP BY customer_id
HAVING COUNT(*) > 1;
    
    
    
    
    
    
    