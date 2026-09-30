# 📊 Customer Churn & Retention Intelligence Platform

From raw customer data to actionable retention intelligence.

An end-to-end **Customer Churn & Retention Analytics project** built using **MySQL, SQL, Power BI, and DAX** to analyze customer churn patterns, identify high-risk customer segments, understand churn-related factors, and quantify the revenue impact associated with churned customers.

The project follows a complete analytics workflow:

**Data Profiling → Data Cleaning → Database Normalization → SQL Analysis → Advanced SQL → Views & Indexes → Power BI → DAX → Business Insights**

---

## 🎯 Business Problem

Customer churn is a critical challenge for subscription-based businesses.

When customers leave, businesses lose recurring revenue and may need to spend additional resources acquiring new customers.

The goal of this project was to analyze customer-level telecom data and answer key business questions:

- What is the overall customer churn rate?
- Which contract types have the highest observed churn?
- How does churn vary across internet services?
- Which payment methods show higher observed churn?
- How does customer tenure relate to churn?
- How does churn differ for customers with and without Tech Support?
- How does Online Security relate to churn?
- How does churn vary across customer demographics?
- How much monthly revenue is associated with churned customers?
- Which contract types contribute most to revenue at risk?

---

# 📂 Dataset

# Dataset

* IBM Telco Customer Churn Dataset

# Source

Kaggle

# Dataset Size

- 7,043 customers
- 21 columns

The dataset contains customer information across demographics, tenure, services, contracts, billing, payment methods, and churn status.

# Main Data Categories

| Category | Examples |
|---|---|
| Customer Information | Customer ID, Gender, Senior Citizen |
| Demographics | Partner, Dependents |
| Tenure | Tenure |
| Services | Internet Service, Phone Service |
| Additional Services | Online Security, Online Backup, Device Protection, Tech Support |
| Contract | Contract Type |
| Billing | Monthly Charges, Total Charges |
| Payment | Payment Method |
| Churn | Churn Status |

---

# 🛠️ Tools & Technologies

### Database & SQL

- **MySQL 8.0**
- **MySQL Workbench**
- **SQL**

### Business Intelligence

- **Microsoft Power BI**
- **DAX**

---

# 🔄 Project Workflow

Raw Dataset
     ↓
Data Profiling
     ↓
Data Cleaning
     ↓
Database Normalization
     ↓
Business Analysis using SQL
     ↓
Customer & Revenue Analysis
     ↓
Advanced SQL
     ↓
Views & Indexes
     ↓
Power BI Connection
     ↓
DAX Measures
     ↓
Interactive Dashboard
     ↓
Business Insights

🧹 1. Data Profiling & Data Cleaning

The first stage focused on understanding the structure and quality of the dataset.

Data Quality Checks

The following checks were performed using SQL:

Row count validation
Missing value checks
Duplicate customer checks
Numeric range validation
Categorical value validation
Distinct value checks
Category distribution checks
Basic outlier checks
Business logic validation
Data Quality Findings
7,043 customer records
0 duplicate customer IDs
11 blank TotalCharges values
Blank TotalCharges values were associated with customers having zero tenure
No invalid categorical values were identified
No negative values were identified in the relevant numerical fields
Data Cleaning Performed
Handled blank TotalCharges
Converted TotalCharges to a numeric data type
Validated categorical values
Validated numerical fields
Checked duplicate records
Validated business rules

🗄️ 2. Database Normalization

After cleaning, the original flat dataset was transformed into a normalized relational database.

Production Tables
customers
services
contracts
billing
churn_status
Database Structure
                    ┌──────────────┐
                    │  customers   │
                    │ customer_id  │
                    └──────┬───────┘
                           │
             ┌─────────────┼─────────────┐
             │             │             │
             ▼             ▼             ▼
      ┌──────────┐  ┌────────────┐  ┌──────────┐
      │ services │  │ contracts  │  │ billing  │
      └──────────┘  └────────────┘  └──────────┘
                           │
                           ▼
                    ┌──────────────┐
                    │churn_status  │
                    └──────────────┘

The tables are connected using customer_id

This structure separates customer, service, contract, billing, and churn information into logical entities and provides a structured foundation for analysis.

🔎 3. SQL Business Analysis

The project includes multiple SQL analysis modules.

Business Analysis

Calculated:

Total customers
Churned customers
Active customers
Overall churn rate
Customer distribution
Demographics Analysis

Analyzed customer behavior by:

Gender
Senior Citizen status
Partner status
Dependents
Tenure
Service Subscription Analysis

Analyzed:

Internet Service
Phone Service
Multiple Lines
Online Security
Online Backup
Device Protection
Tech Support
Streaming TV
Streaming Movies
Churn Analysis

Analyzed churn across:

Contract Type
Internet Service
Payment Method
Gender
Senior Citizen
Partner
Dependents
Online Security
Tech Support
Tenure Groups
Revenue Analysis

Analyzed:

Total monthly revenue
Total charges
Average monthly charges
Average total charges
Revenue by contract
Revenue by internet service
Revenue by payment method
Revenue associated with churned customers
High-value customers
Customer Segmentation

Created analytical segments including:

High-value customers
Loyal customers
New customers
High-risk customers
Premium customers
Churned customers with high lifetime revenue
Active customers with high monthly charges
Fiber optic + month-to-month customers

🧠 4. Advanced SQL

Advanced SQL techniques were used for deeper analytical questions.

Techniques Used
JOIN
GROUP BY
CASE
Aggregate Functions
CTEs
Subqueries
RANK()
ROW_NUMBER()
DENSE_RANK()
Window Functions
Windowed SUM()
Windowed AVG()

These techniques were used for:

Customer ranking
Customer segmentation
Comparative analysis
Revenue analysis
Advanced customer-level calculations

👁️ 5. SQL Views

Reusable SQL views were created to simplify analytical access.

Views Created
vw_customer_profile
vw_high_value_customers
vw_churned_customers
vw_churn_dashboard

The main Power BI dataset was provided through:

vw_churn_dashboard

This view combines customer, service, contract, billing, and churn information into a Power BI-ready analytical dataset.

⚡ 6. SQL Indexing

Indexes were created on selected fields used in analysis.

Examples include:

idx_contract
idx_internet
idx_churn

Index selection was considered carefully to avoid unnecessary redundant indexing.

📊 7. Power BI Dashboard

The final Power BI dashboard is titled:

Customer Churn & Retention Intelligence Platform

The dashboard was designed to provide an executive-level view of:

Customer churn
Churn patterns
Customer segments
Churn-related factors
Revenue associated with churned customers
📌 Executive KPIs

The final dashboard contains four primary KPI cards:

KPI	Value
Total Customers	7K
Churned Customers	2K
Churn Rate	26.5%
Revenue at Risk	139.13K
Revenue at Risk

In this project, Revenue at Risk represents the monthly charges associated with customers who have churned.

It is calculated by summing monthly_charges for customers where churn = "Yes".

📈 8. Dashboard Visuals

The final dashboard contains the following analytical visuals.

Churn Analysis
Churn Rate by Payment Method
Churn Rate by Contract Type
Churn Rate by Dependents
Churn Rate by Online Security
Churn Rate by Internet Service
Churn Rate by Tech Support
Churn Rate by Partner
Churn Rate by Senior Citizen Group
Churn Rate by Tenure Group
Revenue Analysis
Revenue at Risk by Contract Type

🎛️ 9. Interactive Filters

The dashboard includes interactive filters for:

Contract Type
Internet Service
Gender
Senior Citizen
Payment Method
Churn Status

These filters allow users to analyze different customer segments interactively.

📐 10. DAX Measures

The Power BI dashboard uses DAX measures for KPI calculations.

Total Customers
Total Customers =
DISTINCTCOUNT(vw_churn_dashboard[customer_id])
Churned Customers
Churned Customers =
CALCULATE(
    [Total Customers],
    vw_churn_dashboard[churn] = "Yes"
)
Active Customers
Active Customers =
CALCULATE(
    [Total Customers],
    vw_churn_dashboard[churn] = "No"
)
Churn Rate
Churn Rate =
DIVIDE(
    [Churned Customers],
    [Total Customers],
    0
)
Total Monthly Revenue
Total Monthly Revenue =
SUM(vw_churn_dashboard[monthly_charges])
Revenue at Risk
Revenue at Risk =
CALCULATE(
    SUM(vw_churn_dashboard[monthly_charges]),
    vw_churn_dashboard[churn] = "Yes"
)
Average Monthly Charges
Average Monthly Charges =
AVERAGE(vw_churn_dashboard[monthly_charges])

🔍 11. Key Business Insights
1. Overall Customer Churn

The dashboard shows:

7K total customers
2K churned customers
26.5% overall churn rate

This indicates that customer churn represents a significant portion of the customer base in the dataset.

2. Contract Type Has a Strong Observed Relationship with Churn
Contract Type	Churn Rate
Month-to-month	42.7%
One year	11.3%
Two year	2.8%

Month-to-month customers have substantially higher observed churn than customers on longer-term contracts.

3. Payment Method Shows Significant Churn Differences
Payment Method	Churn Rate
Electronic check	45.3%
Mailed check	19.1%
Bank transfer	16.7%
Credit card	15.2%

Electronic check customers have the highest observed churn rate among the payment methods shown.

4. Tenure Is Strongly Associated with Churn
Tenure Group	Churn Rate
0–12 Months	47.4%
13–24 Months	28.7%
25–48 Months	20.4%
49–60 Months	14.4%
60+ Months	6.6%

The highest observed churn occurs among customers in their first 12 months.

Observed churn decreases substantially as customer tenure increases.

5. Tech Support and Churn
Tech Support	Churn Rate
No	41.6%
Yes	15.2%

Customers without Tech Support have a substantially higher observed churn rate than customers with Tech Support.

6. Online Security and Churn
Online Security	Churn Rate
No	41.8%
Yes	14.6%

Customers without Online Security show a substantially higher observed churn rate.

7. Senior Citizen Status
Customer Group	Churn Rate
Senior Citizen	41.7%
Non-Senior Citizen	23.6%

Senior Citizen status is associated with a higher observed churn rate in this dataset.

8. Partner Status
Partner Status	Churn Rate
No	33.0%
Yes	19.7%

Customers without a partner show a higher observed churn rate than customers with a partner.

9. Dependents
Dependents	Churn Rate
No	31.3%
Yes	15.5%

Customers without dependents show a higher observed churn rate than customers with dependents.

10. Revenue Impact of Churn

The dashboard reports:

139.13K in monthly revenue at risk.

Breakdown by contract type:

Contract Type	Revenue at Risk
Month-to-month	121K
One year	14K
Two year	4K

Month-to-month customers account for the largest portion of the monthly revenue associated with churned customers.

⚠️ Analytical Interpretation

The findings represent observed relationships within the dataset.

For example, customers without Tech Support have a higher observed churn rate than customers with Tech Support. This does not prove that the absence of Tech Support causes customers to churn.

Similarly, the differences observed across:

Contract type
Internet service
Payment method
Tenure
Demographics
Additional services

should be interpreted as associations within the dataset rather than causal relationships.

Further statistical analysis or predictive modeling would be required to investigate causality and control for interactions between variables.

💼 12. Business Value

The project provides a structured analytical framework that can help businesses:

Monitor customer churn
Identify customer segments with higher observed churn
Compare churn across contract types and services
Understand customer tenure patterns
Identify customer characteristics associated with different churn rates
Quantify monthly revenue associated with churned customers
Support customer retention analysis

🚀 13. Future Improvements

The current project focuses on descriptive and diagnostic churn analysis.

Future versions could incorporate additional customer behavior data such as:

Monthly usage
Customer support interactions
Payment history
Customer complaints
Customer engagement
Retention campaign responses

This could extend the project into:

Predictive churn modeling
Customer churn probability scoring
Customer lifetime value analysis
Customer risk scoring
Retention campaign targeting
Personalized retention strategies

📁 14. Project Structure
Customer-Churn-Analysis/
│
├── SQL/
│   ├── 01_Datasetup.sql
│   ├── 02_Data_Profiling.sql
│   ├── 03_Data_Cleaning.sql
│   ├── 04_Database_Normalization.sql
│   ├── 05_Business_Analysis.sql
│   ├── 06_Demographics_Analysis.sql
│   ├── 07_Service_Subscription_Analysis.sql
│   ├── 08_Churn_Analysis.sql
│   ├── 09_Revenue_Analysis.sql
│   ├── 10_Customer_Segmentation.sql
│   ├── 11_Advanced_SQL.sql
│   ├── 12_Views.sql
│   ├── 13_Indexes.sql
│   └── 14_Dashboard_View.sql
│
├── Documentation/
│   ├── Data_Quality_Report.md
│   └── Data_Cleaning_Report.md
│
├── PowerBI/
│   └── Customer_Churn_Dashboard.pbix
│
└── README.md]

🎓 15. Skills Demonstrated
SQL & MySQL
Data Profiling
Data Cleaning
Data Validation
Database Normalization
JOINs
GROUP BY
CASE Statements
Aggregate Functions
CTEs
Subqueries
Window Functions
Views
Indexes
Customer Segmentation
Power BI & DAX
MySQL to Power BI connection
DAX Measures
Calculated Columns
KPI Cards
Interactive Slicers
Bar Charts
Column Charts
Dashboard Design
Business-focused Data Visualization

🎯 16. Project Outcome

This project demonstrates an end-to-end Data Analyst workflow:

Raw Data
   ↓
Data Quality Assessment
   ↓
Data Cleaning
   ↓
Database Design
   ↓
SQL Analysis
   ↓
Advanced SQL
   ↓
Views & Indexes
   ↓
Power BI
   ↓
DAX
   ↓
Interactive Dashboard
   ↓
Business Insights

The project demonstrates how raw customer data can be transformed into a structured analytical solution using MySQL, SQL, Power BI, and DAX.

The final dashboard provides a clear view of customer churn, churn-related patterns, customer segments, and the monthly revenue associated with churned customers.



👤 Author
Varun Singh

Aspiring Data Analyst

Core Skills

SQL MySQL Power BI DAX
