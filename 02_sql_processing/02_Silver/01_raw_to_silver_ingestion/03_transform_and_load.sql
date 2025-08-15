-- Step 2: Transform and load data from both Bronze tables
TRUNCATE TABLE [Silver].[Matches];
INSERT INTO Silver.Matches (
    MatchDate,
    HomeTeam,
    AwayTeam,
    FullTimeHomeGoals,
    FullTimeAwayGoals,
    HalfTimeHomeGoals,
    HalfTimeAwayGoals,
    HomeShots,
    AwayShots,
    HomeShotsOnTarget,
    AwayShotsOnTarget,
    HomeFouls,
    AwayFouls,
    HomeCorners,
    AwayCorners,
    HomeYellowCards,
    AwayYellowCards,
    HomeRedCards,
    AwayRedCards,
    Referee,
    Division,
    Season,
    SourceFile
)
-- Data from England_CSV
SELECT
    TRY_CONVERT(DATE, [Date], 103) AS MatchDate,
    TRIM(HomeTeam) AS HomeTeam,
    TRIM(AwayTeam) AS AwayTeam,
    TRY_CONVERT(INT, [FTH Goals]) AS FullTimeHomeGoals,
    TRY_CONVERT(INT, [FTA Goals]) AS FullTimeAwayGoals,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [HTH Goals])) AS HalfTimeHomeGoals,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [HTA Goals])) AS HalfTimeAwayGoals,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H Shots])) AS HomeShots,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A Shots])) AS AwayShots,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H SOT])) AS HomeShotsOnTarget,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A SOT])) AS AwayShotsOnTarget,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H Fouls])) AS HomeFouls,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A Fouls])) AS AwayFouls,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H Corners])) AS HomeCorners,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A Corners])) AS AwayCorners,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H Yellow])) AS HomeYellowCards,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A Yellow])) AS AwayYellowCards,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H Red])) AS HomeRedCards,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A Red])) AS AwayRedCards,
    TRIM(Referee) AS Referee,
    CASE 
        WHEN [League] = 'Premier League' THEN 'Premier League'
        ELSE TRIM([League])
    END AS Division,
    REPLACE(TRIM([Season]), ' ', '') AS Season,
    'England_CSV' AS SourceFile
FROM 
    [Bronze].[England_CSV]
WHERE
    TRY_CONVERT(DATE, [Date], 103) IS NOT NULL
    AND TRIM(HomeTeam) <> ''
    AND TRIM(AwayTeam) <> ''
    AND TRY_CONVERT(INT, [FTH Goals]) IS NOT NULL
    AND TRY_CONVERT(INT, [FTA Goals]) IS NOT NULL

UNION ALL

-- Data from England_2_CSV
SELECT
    TRY_CONVERT(DATE, [Date], 103) AS MatchDate,
    TRIM(HomeTeam) AS HomeTeam,
    TRIM(AwayTeam) AS AwayTeam,
    TRY_CONVERT(INT, [FTH Goals]) AS FullTimeHomeGoals,
    TRY_CONVERT(INT, [FTA Goals]) AS FullTimeAwayGoals,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [HTH Goals])) AS HalfTimeHomeGoals,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [HTA Goals])) AS HalfTimeAwayGoals,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H Shots])) AS HomeShots,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A Shots])) AS AwayShots,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H SOT])) AS HomeShotsOnTarget,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A SOT])) AS AwayShotsOnTarget,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H Fouls])) AS HomeFouls,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A Fouls])) AS AwayFouls,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H Corners])) AS HomeCorners,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A Corners])) AS AwayCorners,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H Yellow])) AS HomeYellowCards,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A Yellow])) AS AwayYellowCards,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [H Red])) AS HomeRedCards,
    TRY_CONVERT(INT, TRY_CONVERT(DECIMAL(5,1), [A Red])) AS AwayRedCards,
    TRIM(Referee) AS Referee,
    CASE 
        WHEN [League] = 'Premier League' THEN 'Premier League'
        ELSE TRIM([League])
    END AS Division,
    REPLACE(TRIM([Season]), ' ', '') AS Season,
    'England_2_CSV' AS SourceFile
FROM 
    [Bronze].[England_2_CSV]
WHERE
    TRY_CONVERT(DATE, [Date], 103) IS NOT NULL
    AND TRIM(HomeTeam) <> ''
    AND TRIM(AwayTeam) <> ''
    AND TRY_CONVERT(INT, [FTH Goals]) IS NOT NULL
    AND TRY_CONVERT(INT, [FTA Goals]) IS NOT NULL;
GO


select HomeTeam
from Silver.Matches
group by HomeTeam
order by HomeTeam;


