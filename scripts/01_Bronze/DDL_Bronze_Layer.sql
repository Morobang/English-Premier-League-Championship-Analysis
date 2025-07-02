-- =============================================
-- Premier League Data Table (Bronze Layer)
-- =============================================

-- Check if table exists and drop it if it does
-- Note: Original code had syntax errors in OBJECT_DEFINITION check
IF OBJECT_ID('Bronze.England_CSV', 'U') IS NOT NULL
    DROP TABLE Bronze.England_CSV;
GO

-- Create table for Premier League match data
CREATE TABLE Bronze.England_CSV(
    MatchDate DATE,               -- Date of the match (converted to DATE type)
    Season VARCHAR(10),           -- Format: YYYY/YY (e.g., 2024/25)
    HomeTeam VARCHAR(50),         -- Name of home team
    AwayTeam VARCHAR(50),         -- Name of away team
    FTH_Goals INT,                -- Full Time Home Goals
    FTA_Goals INT,                -- Full Time Away Goals
    FT_Result VARCHAR(50),        -- Full Time Result (H=Home, A=Away, D=Draw)
    HTH_Goals INT,                -- Half Time Home Goals
    HTA_Goals INT,                -- Half Time Away Goals
    HT_Result VARCHAR(50),        -- Half Time Result
    Referee VARCHAR(50),          -- Match referee name
    H_Shots INT,                  -- Home team total shots
    A_Shots INT,                  -- Away team total shots
    H_SOT INT,                    -- Home team shots on target
    A_SOT INT,                    -- Away team shots on target
    H_Fouls INT,                  -- Home team fouls committed
    A_Fouls INT,                  -- Away team fouls committed
    H_Corners INT,                -- Home team corner kicks
    A_Corners INT,                -- Away team corner kicks
    H_Yellow INT,                 -- Home team yellow cards
    A_Yellow INT,                 -- Away team yellow cards
    H_Red INT,                    -- Home team red cards
    A_Red INT,                    -- Away team red cards
    Display_Order BIGINT,         -- Unique match identifier (timestamp format)
    League VARCHAR(50)            -- League name (e.g., 'Premier League')
);
GO

-- =============================================
-- Championship Data Table (Bronze Layer)
-- =============================================

-- Check if table exists and drop it if it does
IF OBJECT_ID('Bronze.England_2_CSV', 'U') IS NOT NULL
    DROP TABLE Bronze.England_2_CSV;
GO

-- Create table for Championship (2nd division) match data
-- Note: Structure is identical to Premier League table for consistency
CREATE TABLE Bronze.England_2_CSV (
    MatchDate DATE,
    Season VARCHAR(10),
    HomeTeam VARCHAR(50),
    AwayTeam VARCHAR(50),
    FTH_Goals INT,
    FTA_Goals INT,
    FT_Result VARCHAR(50),
    HTH_Goals INT,
    HTA_Goals INT,
    HT_Result VARCHAR(50),
    Referee VARCHAR(50),
    H_Shots INT,
    A_Shots INT,
    H_SOT INT,
    A_SOT INT,
    H_Fouls INT,
    A_Fouls INT,
    H_Corners INT,
    A_Corners INT,
    H_Yellow INT,
    A_Yellow INT,
    H_Red INT,
    A_Red INT,
    Display_Order BIGINT,
    League VARCHAR(50)
);
GO

-- =============================================
-- Important Notes:
-- 1. The Bronze layer contains raw data exactly as imported
-- 2. Consider adding constraints in Silver layer tables:
--    - PRIMARY KEY on Display_Order
--    - CHECK constraints on valid results (H/A/D)
--    - FOREIGN KEYS for team references
-- 3. For production, consider adding:
--    - CreatedDate/ModifiedDate timestamps
--    - Data source tracking columns
--    - Indexes on frequently queried columns
-- 4. The Display_Order appears to be a timestamp-derived ID (YYYYMMDD)
--    but should be verified for uniqueness across leagues
-- =============================================