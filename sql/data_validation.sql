-- ============================================================
-- SQL PORTFOLIO – CONSTRUCTION OPERATIONS
-- SCRIPT 3: DATA VALIDATION
-- ============================================================

-- Confirm the total number of records loaded into the dataset
SELECT
    COUNT(*) AS Total_Records
FROM Operations_Master_Log;

-- Check for records with missing unique identifiers
SELECT
    COUNT(*) AS Null_Log_ID_Count
FROM Operations_Master_Log
WHERE Log_ID IS NULL;

-- Identify duplicate log entries that may require investigation
SELECT
    Log_ID,
    COUNT(*) AS Duplicate_Count
FROM Operations_Master_Log
GROUP BY Log_ID
HAVING COUNT(*) > 1;

-- Review the available project date range
SELECT
    MIN([Date]) AS First_Project_Date,
    MAX([Date]) AS Last_Project_Date
FROM Operations_Master_Log;

-- Check for invalid negative quantities
SELECT
    COUNT(*) AS Negative_Quantity_Count
FROM Operations_Master_Log
WHERE Quantity < 0;

-- Review missing values in key operational fields
SELECT
    SUM(CASE WHEN Log_ID IS NULL THEN 1 ELSE 0 END) AS Null_Log_ID_Count,
    SUM(CASE WHEN [Date] IS NULL THEN 1 ELSE 0 END) AS Null_Date_Count,
    SUM(CASE WHEN Category IS NULL THEN 1 ELSE 0 END) AS Null_Category_Count,
    SUM(CASE WHEN Item IS NULL THEN 1 ELSE 0 END) AS Null_Item_Count,
    SUM(CASE WHEN Location IS NULL THEN 1 ELSE 0 END) AS Null_Location_Count
FROM Operations_Master_Log;

-- Review all project locations captured in the dataset
SELECT DISTINCT
    Location
FROM Operations_Master_Log
ORDER BY Location;

-- Review activity categories used across the project
SELECT DISTINCT
    Category
FROM Operations_Master_Log
ORDER BY Category;

-- Review reporting weeks available in the dataset
SELECT DISTINCT
    Week
FROM Operations_Master_Log
ORDER BY Week;

-- Identify work records with missing excavation rates
SELECT
    COUNT(*) AS Missing_Excavation_Rate_Count
FROM Operations_Master_Log
WHERE Excavation_Rate IS NULL
  AND Category = 'Work';

-- Review work records with missing excavation rates
SELECT *
FROM Operations_Master_Log
WHERE Excavation_Rate IS NULL
  AND Category = 'Work';