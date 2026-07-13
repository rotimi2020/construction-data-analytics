-- ============================================================
-- SQL PORTFOLIO – CONSTRUCTION OPERATIONS
-- SCRIPT 1: DATABASE SETUP
-- ============================================================

-- Remove existing reporting view to allow a clean rebuild
IF OBJECT_ID('vw_Operations_Cost', 'V') IS NOT NULL
DROP VIEW vw_Operations_Cost;

-- Remove existing operational table before recreating the structure
IF OBJECT_ID('Operations_Master_Log', 'U') IS NOT NULL
DROP TABLE Operations_Master_Log;

-- Create the master table for operational, productivity, material and cost records
CREATE TABLE Operations_Master_Log (
    Log_ID VARCHAR(20) NOT NULL PRIMARY KEY,
    [Date] DATE NOT NULL,
    [Day] VARCHAR(15),
    [Week] VARCHAR(5),
    [Month] VARCHAR(20),
    Category VARCHAR(100),
    Item VARCHAR(100),
    Quantity DECIMAL(18,2),
    Unit VARCHAR(20),
    [Operation] VARCHAR(100),
    Location VARCHAR(100),
    Notes VARCHAR(MAX),
    [Source] VARCHAR(100),
    Labour_Cost_NGN DECIMAL(18,2),
    Mixer_Hours DECIMAL(18,2),
    Vibrator_Hours DECIMAL(18,2),
    Excavation_Rate DECIMAL(18,2),
    Excavation_Cost_NGN DECIMAL(18,2),
    Base_Casting_Cost_NGN DECIMAL(18,2),
    Wall_Casting_Cost_NGN DECIMAL(18,2),
    Water_Trip_Cost_NGN DECIMAL(18,2)
);

-- Create an index to improve date-based reporting and analysis
CREATE INDEX IX_Operations_Date
ON Operations_Master_Log([Date]);