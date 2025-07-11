-- 1. Drop existing tables if they exist (in correct dependency order)
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'FactMatches_Historical' AND schema_id = SCHEMA_ID('Gold'))
BEGIN
    PRINT 'Dropping existing Gold.FactMatches_Historical table...'
    DROP TABLE Gold.FactMatches_Historical;
END
GO



CREATE TABLE Gold.FactMatches_Historical (
    MatchSK INT IDENTITY(1,1) PRIMARY KEY,
    DateSK INT NOT NULL FOREIGN KEY REFERENCES Gold.DimDate(DateSK),
    HomeTeamSK INT NOT NULL FOREIGN KEY REFERENCES Gold.DimTeam(TeamSK),
    AwayTeamSK INT NOT NULL FOREIGN KEY REFERENCES Gold.DimTeam(TeamSK),
    RefereeSK INT NULL FOREIGN KEY REFERENCES Gold.DimReferee(RefereeSK),
    
    -- Core match facts only
    FullTimeHomeGoals INT NOT NULL,
    FullTimeAwayGoals INT NOT NULL,
    
    -- Metadata
    Division NVARCHAR(50) NOT NULL,
    Season NVARCHAR(10) NOT NULL,
    SourceFile NVARCHAR(255) NOT NULL,
    LoadTimestamp DATETIME2 DEFAULT SYSUTCDATETIME(),
    ArchiveReason NVARCHAR(200),
    
    -- Derived columns
    TotalGoals AS (FullTimeHomeGoals + FullTimeAwayGoals),
    GoalDifference AS (FullTimeHomeGoals - FullTimeAwayGoals),
    MatchResult AS (
        CASE 
            WHEN FullTimeHomeGoals > FullTimeAwayGoals THEN 'Home Win'
            WHEN FullTimeHomeGoals < FullTimeAwayGoals THEN 'Away Win'
            ELSE 'Draw'
        END
    ),
    
    -- Indexes for performance
    INDEX IX_FactMatchesHistorical_DateSK NONCLUSTERED (DateSK),
    INDEX IX_FactMatchesHistorical_HomeTeamSK NONCLUSTERED (HomeTeamSK),
    INDEX IX_FactMatchesHistorical_AwayTeamSK NONCLUSTERED (AwayTeamSK),
    INDEX IX_FactMatchesHistorical_Season NONCLUSTERED (Season)
);
PRINT 'Created Gold.FactMatches_Historical table (limited stats)';