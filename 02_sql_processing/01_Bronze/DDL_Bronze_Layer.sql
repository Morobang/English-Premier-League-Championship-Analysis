-- =============================================
-- Premier League Data Table (Bronze Layer)
-- =============================================

-- Drop the table if it already exists
IF OBJECT_ID('Bronze.England_CSV', 'U') IS NOT NULL
    DROP TABLE Bronze.England_CSV;
GO

-- Create the England_CSV table with all columns as VARCHAR(50)
-- This table holds raw Premier League match data in the Bronze layer
CREATE TABLE [Bronze].[England_CSV] (
    [Date] VARCHAR(50),              -- Match date
    [Season] VARCHAR(50),            -- Football season (e.g., 2024/25)
    [HomeTeam] VARCHAR(50),          -- Home team name
    [AwayTeam] VARCHAR(50),          -- Away team name
    [FTH Goals] VARCHAR(50),         -- Full-Time Home Goals
    [FTA Goals] VARCHAR(50),         -- Full-Time Away Goals
    [FT Result] VARCHAR(50),         -- Full-Time result (H/A/D)
    [HTH Goals] VARCHAR(50),         -- Half-Time Home Goals
    [HTA Goals] VARCHAR(50),         -- Half-Time Away Goals
    [HT Result] VARCHAR(50),         -- Half-Time result (H/A/D)
    [Referee] VARCHAR(50),           -- Match referee
    [H Shots] VARCHAR(50),           -- Home team shots
    [A Shots] VARCHAR(50),           -- Away team shots
    [H SOT] VARCHAR(50),             -- Home shots on target
    [A SOT] VARCHAR(50),             -- Away shots on target
    [H Fouls] VARCHAR(50),           -- Home team fouls
    [A Fouls] VARCHAR(50),           -- Away team fouls
    [H Corners] VARCHAR(50),         -- Home team corners
    [A Corners] VARCHAR(50),         -- Away team corners
    [H Yellow] VARCHAR(50),          -- Home yellow cards
    [A Yellow] VARCHAR(50),          -- Away yellow cards
    [H Red] VARCHAR(50),             -- Home red cards
    [A Red] VARCHAR(50),             -- Away red cards
    [Display Order] VARCHAR(50),     -- Sort order or match ID (usually yyyymmdd)
    [League] VARCHAR(50)             -- League name (e.g., Premier League)
);
GO

-- =============================================
-- Championship Data Table (Bronze Layer)
-- =============================================

-- Drop the table if it already exists
IF OBJECT_ID('Bronze.England_2_CSV', 'U') IS NOT NULL
    DROP TABLE Bronze.England_2_CSV;
GO

-- Create the England_2_CSV table with all columns as VARCHAR(50)
-- This table holds raw Championship (2nd tier) match data in the Bronze layer
CREATE TABLE [Bronze].[England_2_CSV] (
    [Date] VARCHAR(50),         -- Match date
    [Season] VARCHAR(50),            -- Football season
    [HomeTeam] VARCHAR(50),          -- Home team name
    [AwayTeam] VARCHAR(50),          -- Away team name
    [FTH Goals] VARCHAR(50),         -- Full-Time Home Goals
    [FTA Goals] VARCHAR(50),         -- Full-Time Away Goals
    [FT Result] VARCHAR(50),         -- Full-Time result (H/A/D)
    [HTH Goals] VARCHAR(50),         -- Half-Time Home Goals
    [HTA Goals] VARCHAR(50),         -- Half-Time Away Goals
    [HT Result] VARCHAR(50),         -- Half-Time result
    [Referee] VARCHAR(50),           -- Match referee
    [H Shots] VARCHAR(50),           -- Home team shots
    [A Shots] VARCHAR(50),           -- Away team shots
    [H SOT] VARCHAR(50),             -- Home shots on target
    [A SOT] VARCHAR(50),             -- Away shots on target
    [H Fouls] VARCHAR(50),           -- Home team fouls
    [A Fouls] VARCHAR(50),           -- Away team fouls
    [H Corners] VARCHAR(50),         -- Home team corners
    [A Corners] VARCHAR(50),         -- Away team corners
    [H Yellow] VARCHAR(50),          -- Home yellow cards
    [A Yellow] VARCHAR(50),          -- Away yellow cards
    [H Red] VARCHAR(50),             -- Home red cards
    [A Red] VARCHAR(50),             -- Away red cards
    [Display Order] VARCHAR(50),     -- Sort order or match ID
    [League] VARCHAR(50)             -- League name (e.g., Championship)
);
GO



