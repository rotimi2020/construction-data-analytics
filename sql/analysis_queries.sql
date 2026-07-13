-- ============================================================
-- SQL PORTFOLIO – CONSTRUCTION OPERATIONS
-- SCRIPT 5: BUSINESS ANALYSIS
-- ============================================================

-- Initial review of operational records
SELECT *
FROM Operations_Master_Log;

-- Project overview and data coverage
SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Location) AS Number_of_Locations,
    COUNT(DISTINCT Category) AS Number_of_Categories,
    COUNT(DISTINCT Item) AS Number_of_Items,
    MIN([Date]) AS Project_Start_Date,
    MAX([Date]) AS Project_End_Date,
    DATEDIFF(DAY, MIN([Date]), MAX([Date])) AS Project_Duration_Days
FROM Operations_Master_Log;

-- Calculate total project cost
SELECT
    SUM(Total_Cost_NGN) AS Total_Project_Cost
FROM vw_Operations_Cost;

-- Compare spending across project locations
SELECT
    Location,
    SUM(Total_Cost_NGN) AS Total_Cost
FROM vw_Operations_Cost
GROUP BY Location
ORDER BY Total_Cost DESC;

-- Identify the highest cost activities
SELECT TOP 5
    Item,
    SUM(Total_Cost_NGN) AS Cost
FROM vw_Operations_Cost
GROUP BY Item
ORDER BY Cost DESC;

-- Analyse labour expenditure by site
SELECT
    Location,
    SUM(Labour_Cost_NGN) AS Labour_Cost
FROM Operations_Master_Log
GROUP BY Location
ORDER BY Labour_Cost DESC;

-- Summarise material consumption
SELECT
    Item,
    SUM(Quantity) AS Total_Quantity,
    Unit
FROM Operations_Master_Log
WHERE Category = 'Material'
GROUP BY Item, Unit
ORDER BY Total_Quantity DESC;

-- Review monthly spending trends
SELECT
    YEAR([Date]) AS Year,
    MONTH([Date]) AS Month,
    SUM(Total_Cost_NGN) AS Monthly_Cost
FROM vw_Operations_Cost
GROUP BY YEAR([Date]), MONTH([Date])
ORDER BY Year, Month;

-- Evaluate equipment utilisation by site
SELECT
    Location,
    SUM(ISNULL(Mixer_Hours,0)) AS Total_Mixer_Hours,
    SUM(ISNULL(Vibrator_Hours,0)) AS Total_Vibrator_Hours,
    SUM(ISNULL(Mixer_Hours,0) + ISNULL(Vibrator_Hours,0))
        AS Total_Equipment_Hours
FROM Operations_Master_Log
GROUP BY Location
ORDER BY Total_Equipment_Hours DESC;

-- Track weekly operational output
SELECT
    Week,
    Item,
    SUM(Quantity) AS Total_Quantity
FROM Operations_Master_Log
WHERE Category IN ('Work','Operations')
GROUP BY Week, Item
ORDER BY Week, Item;

-- Compare productivity across project locations
SELECT
    Location,
    SUM(Quantity) AS Total_Work_Output
FROM Operations_Master_Log
WHERE Category = 'Work'
GROUP BY Location
ORDER BY Total_Work_Output DESC;

-- Summarise excavation performance
SELECT
    SUM(Quantity) AS Total_Excavation_m,
    AVG(Excavation_Rate) AS Avg_Excavation_Rate_NGN_per_m
FROM Operations_Master_Log
WHERE Item = 'Excavation';

-- Review cement movement records
SELECT
    Item,
    SUM(Quantity) AS Total_Bags
FROM Operations_Master_Log
WHERE Item LIKE '%Cement%'
GROUP BY Item
ORDER BY Item;

-- Reconcile cement inventory records
SELECT
    SUM(CASE WHEN Item = 'Cement Delivered'
             THEN Quantity ELSE 0 END) AS Cement_Delivered_Bags,
    SUM(CASE WHEN Item = 'Cement Used'
             THEN Quantity ELSE 0 END) AS Cement_Used_Bags,
    SUM(CASE WHEN Item = 'Cement Missing'
             THEN Quantity ELSE 0 END) AS Cement_Missing_Bags,
    SUM(CASE WHEN Item = 'Cement Spillage'
             THEN Quantity ELSE 0 END) AS Cement_Spillage_Bags,
    SUM(CASE WHEN Item = 'Cement Remaining'
             THEN Quantity ELSE 0 END) AS Cement_Remaining_Bags
FROM Operations_Master_Log
WHERE Item LIKE '%Cement%';

-- Identify excavation rate exceptions
SELECT
    [Date],
    Location,
    Item,
    Quantity,
    Excavation_Cost_NGN,
    Excavation_Rate_Check
FROM Operations_Master_Log
WHERE Excavation_Rate_Check IS NOT NULL
  AND Excavation_Rate_Check <> 800;