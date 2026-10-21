-- Select the HR analytics database
USE hr_analytics;

-- 1. Overall employee attrition summary
SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0), 2
    ) AS Attrition_Rate_Percent
FROM employees;

-- 2. Department-wise attrition analysis
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0), 2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY Department
ORDER BY Attrition_Rate_Percent DESC;

-- Analyze attrition across departments
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY Department
ORDER BY Attrition_Rate_Percent DESC;



-- Analyze attrition by overtime status
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY OverTime
ORDER BY Attrition_Rate_Percent DESC;



-- Analyze attrition by job satisfaction level
SELECT
    JobSatisfaction,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;



-- Analyze employee attrition by job role
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY JobRole
ORDER BY Attrition_Rate_Percent DESC;




-- Analyze employee attrition by business travel frequency
SELECT
    BusinessTravel,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY BusinessTravel
ORDER BY Attrition_Rate_Percent DESC;



-- Analyze attrition by monthly income range
SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN '0-3K'
        WHEN MonthlyIncome < 5000 THEN '3K-5K'
        WHEN MonthlyIncome < 8000 THEN '5K-8K'
        WHEN MonthlyIncome < 12000 THEN '8K-12K'
        ELSE '12K+'
    END AS Salary_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY Salary_Group
ORDER BY MIN(MonthlyIncome);




-- Analyze employee attrition by age group
SELECT
    CASE
        WHEN Age <= 25 THEN '18-25'
        WHEN Age <= 35 THEN '26-35'
        WHEN Age <= 45 THEN '36-45'
        WHEN Age <= 55 THEN '46-55'
        ELSE '56+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY Age_Group
ORDER BY MIN(Age);



-- Analyze employee attrition by company tenure
SELECT
    CASE
        WHEN YearsAtCompany <= 1 THEN '0-1 Years'
        WHEN YearsAtCompany <= 3 THEN '2-3 Years'
        WHEN YearsAtCompany <= 5 THEN '4-5 Years'
        WHEN YearsAtCompany <= 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS Tenure_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY Tenure_Group
ORDER BY MIN(YearsAtCompany);




-- Analyze employee attrition by marital status
SELECT
    MaritalStatus,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY MaritalStatus
ORDER BY Attrition_Rate_Percent DESC;




-- Analyze employee attrition by job level
SELECT
    JobLevel,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY JobLevel
ORDER BY JobLevel;



-- Analyze attrition by time since last promotion
SELECT
    CASE
        WHEN YearsSinceLastPromotion <= 1 THEN '0-1 Years'
        WHEN YearsSinceLastPromotion <= 3 THEN '2-3 Years'
        WHEN YearsSinceLastPromotion <= 5 THEN '4-5 Years'
        ELSE '6+ Years'
    END AS Promotion_Wait_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY Promotion_Wait_Group
ORDER BY MIN(YearsSinceLastPromotion);



-- Analyze employee attrition by work-life balance
SELECT
    WorkLifeBalance,
    COUNT(*) AS Total_Employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;


-- Check for duplicate employee IDs
SELECT
    EmployeeNumber,
    COUNT(*) AS Record_Count
FROM employees
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- Check for missing values in key columns
SELECT
    SUM(EmployeeNumber IS NULL) AS Missing_Employee_ID,
    SUM(Attrition IS NULL) AS Missing_Attrition,
    SUM(Department IS NULL) AS Missing_Department,
    SUM(MonthlyIncome IS NULL) AS Missing_Monthly_Income
FROM employees;



-- Analyze attrition by department and overtime status
SELECT
    Department,
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Attrition_Rate_Percent
FROM employees
GROUP BY Department, OverTime
ORDER BY Department, Attrition_Rate_Percent DESC;
