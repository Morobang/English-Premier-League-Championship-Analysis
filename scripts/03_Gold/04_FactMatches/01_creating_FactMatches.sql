IF EXISTS (SELECT * FROM sys.tables WHERE name = 'FactMatches' AND schema_id = SCHEMA_ID('Gold'))
BEGIN
    PRINT 'Dropping existing Gold.FactMatches table...'
    DROP TABLE Gold.FactMatches;
END
GO







CREATE TABLE Gold.FactMatches (
    MatchSK INT IDENTITY(1,1) PRIMARY KEY,
    DateSK INT NOT NULL FOREIGN KEY REFERENCES Gold.DimDate(DateSK),
    HomeTeamSK INT NOT NULL FOREIGN KEY REFERENCES Gold.DimTeam(TeamSK),
    AwayTeamSK INT NOT NULL FOREIGN KEY REFERENCES Gold.DimTeam(TeamSK),
    RefereeSK INT NULL FOREIGN KEY REFERENCES Gold.DimReferee(RefereeSK),
    
    -- Match facts
    FullTimeHomeGoals INT NOT NULL,
    FullTimeAwayGoals INT NOT NULL,
    HalfTimeHomeGoals INT NOT NULL,
    HalfTimeAwayGoals INT NOT NULL,
    
    -- Detailed stats
    HomeShots INT NOT NULL,
    AwayShots INT NOT NULL,
    HomeShotsOnTarget INT NOT NULL,
    AwayShotsOnTarget INT NOT NULL,
    HomeFouls INT NOT NULL,
    AwayFouls INT NOT NULL,
    HomeCorners INT NOT NULL,
    AwayCorners INT NOT NULL,
    HomeYellowCards INT NOT NULL,
    AwayYellowCards INT NOT NULL,
    HomeRedCards INT NOT NULL,
    AwayRedCards INT NOT NULL,
    
    -- Metadata
    Division NVARCHAR(50) NOT NULL,
    Season NVARCHAR(10) NOT NULL,
    SourceFile NVARCHAR(255) NOT NULL,
    LoadTimestamp DATETIME2 DEFAULT SYSUTCDATETIME(),
    
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
    INDEX IX_FactMatches_DateSK NONCLUSTERED (DateSK),
    INDEX IX_FactMatches_HomeTeamSK NONCLUSTERED (HomeTeamSK),
    INDEX IX_FactMatches_AwayTeamSK NONCLUSTERED (AwayTeamSK),
    INDEX IX_FactMatches_Season NONCLUSTERED (Season)
);
PRINT 'Created Gold.FactMatches table (complete stats only)';