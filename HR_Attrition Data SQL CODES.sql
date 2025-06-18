SELECT * FROM policy_insureance.`wa_fn-usec_-hr-employee-attrition`;

-- Q1 
SELECT COUNT(*) AS TotalEmployees
FROM policy_insureance.`wa_fn-usec_-hr-employee-attrition`;

-- Q2 
SELECT COUNT(*) AS EmployeesLeft
FROM policy_insureance.`wa_fn-usec_-hr-employee-attrition`
WHERE Attrition = 'Yes';

-- Q3
SELECT 
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS AttritionRatePercentage
FROM policy_insureance.`wa_fn-usec_-hr-employee-attrition`;

-- Q4
SELECT 
    OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesWhoLeft,
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS AttritionRatePercentage
FROM policy_insureance.`wa_fn-usec_-hr-employee-attrition`
GROUP BY OverTime;

-- Q5 
SELECT 
  CASE 
    WHEN Age < 25 THEN '<25'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
  END AS AgeGroup,
  COUNT(*) AS TotalEmployees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesWhoLeft,
  ROUND(
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
    2
  ) AS AttritionRatePercentage
FROM policy_insureance.`wa_fn-usec_-hr-employee-attrition`
GROUP BY 
  CASE 
    WHEN Age < 25 THEN '<25'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
  END
ORDER BY AgeGroup;

-- Q6
SELECT 
    JobRole,
    Attrition,
    COUNT(*) AS EmployeeCount,
    ROUND(AVG(MonthlyIncome), 2) AS AvgMonthlyIncome
FROM policy_insureance.`wa_fn-usec_-hr-employee-attrition`
GROUP BY JobRole, Attrition
ORDER BY JobRole, Attrition;

-- Q7 
SELECT 
    JobSatisfaction,
    Attrition,
    COUNT(*) AS EmployeeCount
FROM policy_insureance.`wa_fn-usec_-hr-employee-attrition`
GROUP BY JobSatisfaction, Attrition
ORDER BY JobSatisfaction, Attrition;

SELECT 
    EnvironmentSatisfaction,
    Attrition,
    COUNT(*) AS EmployeeCount
FROM policy_insureance.`wa_fn-usec_-hr-employee-attrition`
GROUP BY EnvironmentSatisfaction, Attrition
ORDER BY EnvironmentSatisfaction, Attrition;

SELECT 
    RelationshipSatisfaction,
    Attrition,
    COUNT(*) AS EmployeeCount
FROM policy_insureance.`wa_fn-usec_-hr-employee-attrition`
GROUP BY RelationshipSatisfaction, Attrition
ORDER BY RelationshipSatisfaction, Attrition;

SELECT 
    JobSatisfaction,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesWhoLeft,
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*),
        2
    ) AS AttritionRatePercentage
FROM policy_insureance.`wa_fn-usec_-hr-employee-attrition`
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;









