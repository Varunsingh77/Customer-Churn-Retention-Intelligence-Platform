-- Data Profiling

-- 1: Checking For Missing Values 
SELECT *
FROM stg_customer_churn
WHERE TRIM(TotalCharges) = '';

SELECT
    COUNT(*) AS blank_total_charges
FROM stg_customer_churn
WHERE TRIM(TotalCharges) = '';

-- 2: Check Duplicate Customers
SELECT
    customerID,
    COUNT(*) AS duplicate_count
FROM stg_customer_churn
GROUP BY customerID
HAVING COUNT(*) > 1;

-- 3: Verify Tenure --
SELECT
MIN(tenure) AS minimum_tenure,
MAX(tenure) AS maximum_tenure
FROM stg_customer_churn;

-- 4: Monthly Charges  (Any negative values ? Are values reasonable? ) -- 
SELECT
MIN(MonthlyCharges),
MAX(MonthlyCharges),
AVG(MonthlyCharges)
FROM stg_customer_churn;

-- 5: Unique Values in Every Categorical Column -- ( Checking for any Typos)

-- Gender --
SELECT
DISTINCT gender FROM stg_customer_churn;

-- Partner --
SELECT 
DISTINCT partner  FROM stg_customer_churn;

-- Dependent -- 
SELECT 
DISTINCT dependents FROM stg_customer_churn;

-- Contract --
SELECT
DISTINCT contract FROM stg_customer_churn ;

-- Internet Service -- 
SELECT 
DISTINCT internetservice  FROM stg_customer_churn;

-- Payment Method-- 
SELECT
DISTINCT paymentmethod  FROM stg_customer_churn;

-- Churn -- 
SELECT 
DISTINCT churn FROM stg_customer_churn;

-- 6:Counting Each Category --

SELECT
Churn,
COUNT(*) AS customers
FROM stg_customer_churn
GROUP BY Churn;

SELECT
gender,
COUNT(*) AS customers
FROM stg_customer_churn
GROUP BY gender;

SELECT
Contract,
COUNT(*) AS customers
FROM stg_customer_churn
GROUP BY Contract;

SELECT
PaymentMethod,
COUNT(*) AS customers
FROM stg_customer_churn
GROUP BY PaymentMethod;

SELECT
InternetService,
COUNT(*) AS customers
FROM stg_customer_churn
GROUP BY InternetService;

SELECT
Partner,
COUNT(*) AS customers
FROM stg_customer_churn
GROUP BY Partner;

SELECT
SeniorCitizen,
COUNT(*) AS customers
FROM stg_customer_churn
GROUP BY SeniorCitizen;

-- 7: Check Numeric Outliers

SELECT *
FROM stg_customer_churn
WHERE MonthlyCharges < 0;

SELECT *
FROM stg_customer_churn
WHERE tenure < 0;

-- 8: Validate Business Logic 
-- Customers with tenure = 0 (Is TotalCharges blank? Are they churned? )
SELECT *
FROM stg_customer_churn
WHERE tenure = 0;

-- Churned Customers with Two-Year Contracts --
SELECT *
FROM stg_customer_churn
WHERE Contract = 'Two year'
AND Churn = 'Yes';
