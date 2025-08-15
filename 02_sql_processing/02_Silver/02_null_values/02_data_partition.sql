-- Create archive table with ALL columns from the main table
CREATE TABLE [Silver].[Matches_Historical] (
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
    LoadTimestamp DATETIME2,
    -- Additional archive-specific columns
    ArchiveReason NVARCHAR(200) DEFAULT 'Incomplete statistics',
    ArchiveDate DATETIME2 DEFAULT SYSUTCDATETIME()
);





BEGIN TRANSACTION;

-- Move ALL columns from main table to historical archive
INSERT INTO [Silver].[Matches_Historical] (
    MatchDate, HomeTeam, AwayTeam,
    FullTimeHomeGoals, FullTimeAwayGoals,
    HalfTimeHomeGoals, HalfTimeAwayGoals,
    HomeShots, AwayShots,
    HomeShotsOnTarget, AwayShotsOnTarget,
    HomeFouls, AwayFouls,
    HomeCorners, AwayCorners,
    HomeYellowCards, AwayYellowCards,
    HomeRedCards, AwayRedCards,
    Referee, Division, Season,
    SourceFile, LoadTimestamp,
    ArchiveReason
)
SELECT 
    MatchDate, HomeTeam, AwayTeam,
    FullTimeHomeGoals, FullTimeAwayGoals,
    HalfTimeHomeGoals, HalfTimeAwayGoals,
    HomeShots, AwayShots,
    HomeShotsOnTarget, AwayShotsOnTarget,
    HomeFouls, AwayFouls,
    HomeCorners, AwayCorners,
    HomeYellowCards, AwayYellowCards,
    HomeRedCards, AwayRedCards,
    Referee, Division, Season,
    SourceFile, LoadTimestamp,
    'Missing detailed match statistics' AS ArchiveReason
FROM [Silver].[Matches]
WHERE 
    HomeShots IS NULL AND
    AwayShots IS NULL AND
    HomeShotsOnTarget IS NULL AND
    AwayShotsOnTarget IS NULL AND
    HomeFouls IS NULL AND
    AwayFouls IS NULL AND
    HomeCorners IS NULL AND
    AwayCorners IS NULL AND
    HomeYellowCards IS NULL AND
    AwayYellowCards IS NULL AND
    HomeRedCards IS NULL AND
    AwayRedCards IS NULL;

-- Verify counts before deletion
DECLARE @RecordsToMove INT = @@ROWCOUNT;
PRINT CONCAT('Moving ', @RecordsToMove, ' records to historical archive');

-- Delete from main table (all matching records)
DELETE FROM [Silver].[Matches]
WHERE 
    HomeShots IS NULL AND
    AwayShots IS NULL AND
    HomeShotsOnTarget IS NULL AND
    AwayShotsOnTarget IS NULL AND
    HomeFouls IS NULL AND
    AwayFouls IS NULL AND
    HomeCorners IS NULL AND
    AwayCorners IS NULL AND
    HomeYellowCards IS NULL AND
    AwayYellowCards IS NULL AND
    HomeRedCards IS NULL AND
    AwayRedCards IS NULL;

-- Final verification
DECLARE @RemainingRecords INT = (SELECT COUNT(*) FROM [Silver].[Matches]);
DECLARE @ArchivedRecords INT = (SELECT COUNT(*) FROM [Silver].[Matches_Historical]);
PRINT CONCAT('Remaining records: ', @RemainingRecords);
PRINT CONCAT('Archived records: ', @ArchivedRecords);

COMMIT TRANSACTION;


-- Verify no data loss occurred
SELECT 
    (SELECT COUNT(*) FROM [Silver].[Matches]) + 
    (SELECT COUNT(*) FROM [Silver].[Matches_Historical]) AS TotalRecords,
    (SELECT COUNT(*) FROM [Bronze].[England_CSV]) + 
    (SELECT COUNT(*) FROM [Bronze].[England_2_CSV]) AS OriginalCount;

-- Check archive completeness
SELECT 
    COUNT(*) AS ArchivedRecords,
    MIN(MatchDate) AS EarliestArchived,
    MAX(MatchDate) AS LatestArchived
FROM [Silver].[Matches_Historical];

-- Sample archived records
SELECT TOP 5 * 
FROM [Silver].[Matches_Historical]
ORDER BY MatchDate;



