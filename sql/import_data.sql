-- ============================================================
-- SQL PORTFOLIO – CONSTRUCTION OPERATIONS
-- SCRIPT 2: DATA IMPORT
-- ============================================================

-- Load operational records from the source CSV file into the master table
BULK INSERT Operations_Master_Log
FROM 'C:\Users\HP\Desktop\construction data analyst\kwaya kursar site Analysis\github\Operations_Master_Log.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A',
    FIRSTROW = 2,
    CODEPAGE = '65001'
);

-- Verify the number of records successfully loaded into the dataset
SELECT
    COUNT(*) AS Total_Records_Loaded
FROM Operations_Master_Log;