-- ============================================================
-- SQL PORTFOLIO – CONSTRUCTION OPERATIONS
-- SCRIPT 4: DATA CLEANING & VALIDATION
-- ============================================================

-- Standardise missing unit values to improve reporting consistency
UPDATE Operations_Master_Log
SET Unit = 'Unknown'
WHERE Unit IS NULL;

-- Create a validation field for excavation rate checks if it does not already exist
IF COL_LENGTH('Operations_Master_Log', 'Excavation_Rate_Check') IS NULL
BEGIN
    ALTER TABLE Operations_Master_Log
    ADD Excavation_Rate_Check DECIMAL(18,2);
END;

-- Populate excavation rate validation values for quality control checks
UPDATE Operations_Master_Log
SET Excavation_Rate_Check =
CASE
    WHEN Excavation_Rate = 800 THEN 800
    WHEN Excavation_Rate = 1000 THEN 1000
    ELSE NULL
END;

-- Rebuild the reporting view with a consolidated project cost calculation
IF OBJECT_ID('vw_Operations_Cost', 'V') IS NOT NULL
DROP VIEW vw_Operations_Cost;
GO

CREATE VIEW vw_Operations_Cost AS
SELECT
    *,
    ISNULL(Labour_Cost_NGN,0)
    + ISNULL(Excavation_Cost_NGN,0)
    + ISNULL(Base_Casting_Cost_NGN,0)
    + ISNULL(Wall_Casting_Cost_NGN,0)
    + ISNULL(Water_Trip_Cost_NGN,0) AS Total_Cost_NGN
FROM Operations_Master_Log;
GO

-- Review key data quality indicators after cleaning
SELECT
    COUNT(*) AS Total_Activity_Records,
    SUM(CASE WHEN Unit = 'Unknown' THEN 1 ELSE 0 END) AS Records_With_Unknown_Units,
    SUM(
        CASE
            WHEN Excavation_Rate IS NULL
             AND Category = 'Work'
            THEN 1
            ELSE 0
        END
    ) AS Work_Records_Missing_Rates
FROM Operations_Master_Log;

-- Identify excavation records that require further rate verification
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