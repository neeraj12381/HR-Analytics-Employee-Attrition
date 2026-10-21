-- Select the HR analytics database
USE hr_analytics;

-- Verify the imported employee records
SELECT COUNT(*) AS total_employees
FROM employees;




USE hr_analytics;

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT EmployeeNumber) AS unique_employee_ids,
    SUM(
        CASE
            WHEN Attrition NOT IN ('Yes', 'No')
                 OR Attrition IS NULL
            THEN 1
            ELSE 0
        END
    ) AS invalid_attrition_values
FROM employees;

