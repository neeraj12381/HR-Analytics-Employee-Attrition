
-- Select the HR analytics database
USE hr_analytics;

-- Create the employee analysis table
CREATE TABLE IF NOT EXISTS employees (
    EmployeeNumber INT PRIMARY KEY,
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(30),
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    Gender VARCHAR(15),
    JobLevel INT,
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome DECIMAL(10,2),
    OverTime VARCHAR(10),
    PercentSalaryHike INT,
    PerformanceRating INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);
-- Check whether the employee table existsemployeesemployeesemployeesemployees
USE hr_analytics;

-- Check the table structure
DESCRIBE employees;