-- Creating Database --

CREATE DATABASE customer_churn_db;
USE customer_churn_db;

-- Creating a Staging Table --

CREATE TABLE stg_customer_churn (
    customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(25),
    InternetService VARCHAR(25),
    OnlineSecurity VARCHAR(25),
    OnlineBackup VARCHAR(25),
    DeviceProtection VARCHAR(25),
    TechSupport VARCHAR(25),
    StreamingTV VARCHAR(25),
    StreamingMovies VARCHAR(25),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(8,2),
    TotalCharges VARCHAR(30),
    Churn VARCHAR(5)
);

-- Validate the Import --
SELECT *
FROM stg_customer_churn;

SELECT COUNT(*) AS total_rows 
FROM stg_customer_churn;

SELECT *
FROM stg_customer_churn
LIMIT 10;

DESCRIBE stg_customer_churn;

