-- Transforming the raw data into clean, production-ready data before loading it into normalized tables --

CREATE TABLE clean_customer_churn 
LIKE stg_customer_churn;

INSERT INTO clean_customer_churn
SELECT * FROM stg_customer_churn;

SELECT COUNT(*) FROM clean_customer_churn;

-- Check Blank TotalCharges 

SELECT * 
FROM clean_customer_churn
WHERE TRIM(totalcharges) = '';

SELECT
    customerID,
    tenure,
    MonthlyCharges,                               -- The TotalCharges is blank beacuse customers are new and the bill is not generated yet --
    TotalCharges,
    Churn
FROM clean_customer_churn
WHERE TRIM(TotalCharges) = '';

-- Replace Blank TotalCharges 

UPDATE clean_customer_churn
SET TotalCharges = '0'
WHERE TRIM(TotalCharges) = '';

SELECT COUNT(*)
FROM stg_customer_churn
WHERE TRIM(TotalCharges) = '';

-- Convert TotalCharges to Decimal 

ALTER TABLE clean_customer_churn
MODIFY COLUMN TotalCharges DECIMAL(10,2);

DESCRIBE clean_customer_churn;

-- Validate Yes / No Columns

SELECT DISTINCT Partner
FROM clean_customer_churn;

SELECT DISTINCT Dependents
FROM clean_customer_churn;

SELECT DISTINCT PhoneService
FROM clean_customer_churn;

SELECT DISTINCT PaperlessBilling
FROM clean_customer_churn;

SELECT DISTINCT Churn
FROM clean_customer_churn;

-- Validate seniorCitizen

SELECT DISTINCT seniorcitizen
FROM clean_customer_churn;

-- Check Numeric Validity 

-- Monthly Charges
SELECT *
FROM clean_customer_churn
WHERE MonthlyCharges < 0;

-- Tenure
SELECT *
FROM clean_customer_churn
WHERE tenure < 0;

-- Total Charges
SELECT *
FROM clean_customer_churn
WHERE TotalCharges < 0;

-- Final  validation
SELECT
COUNT(*) AS Total_Customers
FROM clean_customer_churn;


SELECT *
FROM clean_customer_churn
WHERE TRIM(TotalCharges) = 0;
