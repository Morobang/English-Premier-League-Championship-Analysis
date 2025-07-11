CREATE TABLE Gold.FactMatches (
    MatchSK INT IDENTITY(1,1) PRIMARY KEY,
    DateSK INT FOREIGN KEY REFERENCES Gold.DimDate(DateSK),
    HomeTeamSK INT FOREIGN KEY REFERENCES Gold.DimTeam(TeamSK),
    AwayTeamSK INT FOREIGN KEY REFERENCES Gold.DimTeam(TeamSK),
    RefereeSK INT FOREIGN KEY REFERENCES Gold.DimReferee(RefereeSK),
    
    -- Core facts (available in both tables)
    FullTimeHomeGoals INT NOT NULL,
    FullTimeAwayGoals INT NOT NULL,
    
    -- Available in main table only
    HalfTimeHomeGoals INT,
    HalfTimeAwayGoals INT,
    HomeShots INT,
    AwayShots INT,
    HomeShotsOnTarget INT,
    AwayShotsOnTarget INT,
    HomeFouls INT,
    AwayFouls INT,
    HomeCorners INT,
    AwayCorners INT,
    HomeYellowCards INT,
    AwayYellowCards INT,
    HomeRedCards INT,
    AwayRedCards INT,
    
    -- Common metadata
    Division NVARCHAR(50),
    Season NVARCHAR(10),
    SourceFile NVARCHAR(255),
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
    )
);