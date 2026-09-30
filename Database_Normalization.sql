-- Data Loading & Database Normalization --

CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    senior_citizen TINYINT,
    partner VARCHAR(5),
    dependents VARCHAR(5)
);

CREATE TABLE services (
    customer_id VARCHAR(20) PRIMARY KEY,
    phone_service VARCHAR(5),
    multiple_lines VARCHAR(25),
    internet_service VARCHAR(25),
    online_security VARCHAR(25),
    online_backup VARCHAR(25),
    device_protection VARCHAR(25),
    tech_support VARCHAR(25),
    streaming_tv VARCHAR(25),
    streaming_movies VARCHAR(25),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE  contracts (
    customer_id VARCHAR(20) PRIMARY KEY,
    contract_type VARCHAR(30),
    paperless_billing VARCHAR(5),
    payment_method VARCHAR(50),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE billing (
    customer_id VARCHAR(20) PRIMARY KEY,
    tenure INT,
    monthly_charges DECIMAL(10,2),
    total_charges DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE churn_status (
    customer_id VARCHAR(20) PRIMARY KEY,
    churn VARCHAR(5),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

-- Inserting Data into Tables --

INSERT INTO customers
(
    customer_id,
    gender,
    senior_citizen,
    partner,
    dependents
)

SELECT
    customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents

FROM clean_customer_churn;

INSERT INTO services
(
    customer_id,
    phone_service,
    multiple_lines,
    internet_service,
    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies
)

SELECT
    customerID,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies

FROM clean_customer_churn;


INSERT INTO contracts
(
    customer_id,
    contract_type,
    paperless_billing,
    payment_method
)

SELECT
    customerID,
    Contract,
    PaperlessBilling,
    PaymentMethod

FROM clean_customer_churn;

INSERT INTO billing
(
    customer_id,
    tenure,
    monthly_charges,
    total_charges
)

SELECT
    customerID,
    tenure,
    monthlycharges,
    TotalCharges

FROM clean_customer_churn;


INSERT INTO churn_status
(
    customer_id,
    churn
)

SELECT
    customerID,
    Churn

FROM clean_customer_churn;

-- Final Validation 

SELECT COUNT(*) AS customers
FROM customers;

SELECT COUNT(*) AS services
FROM services;

SELECT COUNT(*) AS contracts
FROM contracts;

SELECT COUNT(*) AS billing
FROM billing;

SELECT COUNT(*) AS churn_status
FROM churn_status;

-- Additional Validation 

SELECT COUNT(*)
FROM customers c
LEFT JOIN billing b
ON c.customer_id = b.customer_id
WHERE b.customer_id IS NULL;


