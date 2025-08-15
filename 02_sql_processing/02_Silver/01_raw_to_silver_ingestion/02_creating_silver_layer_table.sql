-- Step 1: Create the Silver.Matches table if it doesn't exist (same as before)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Matches' AND schema_id = SCHEMA_ID('Silver'))
BEGIN
    CREATE TABLE Silver.Matches (
        MatchDate DATE,
        HomeTeam NVARCHAR(100),
        AwayTeam NVARCHAR(100),
        FullTimeHomeGoals INT,
        FullTimeAwayGoals INT,
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
        Referee NVARCHAR(100),
        Division NVARCHAR(50),
        Season NVARCHAR(50),
        SourceFile NVARCHAR(255),
        LoadTimestamp DATETIME2 DEFAULT SYSUTCDATETIME()
    );
END
GO