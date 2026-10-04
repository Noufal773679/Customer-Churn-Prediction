CREATE DATABASE churn_analysis;

USE churn_analysis;
--total customers
SELECT COUNT(*) AS total_customers
FROM customer_churn;
--Churned customers
SELECT COUNT(*) AS churned_customers
FROM customer_churn

WHERE Churn = 'Yes';
--Churn percentage
SELECT
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0
    / COUNT(*) AS churn_percentage
FROM customer_churn;
--Churn by contract
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM customer_churn
GROUP BY Contract;
--Average monthly charges by churn
SELECT
    Churn,
    AVG(MonthlyCharges) AS avg_monthly_charges
FROM customer_churn
GROUP BY Churn;
--Churn by internet service
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(
        CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers
FROM customer_churn
GROUP BY InternetService;
