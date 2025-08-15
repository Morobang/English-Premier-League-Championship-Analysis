-- Populate DimTeam
PRINT 'Populating Gold.DimTeam...';
INSERT INTO Gold.DimTeam (TeamName, CurrentDivision, FirstSeenSeason, LastSeenSeason)
SELECT 
    TeamName,
    MAX(Division) AS CurrentDivision, -- Most recent division
    MIN(Season) AS FirstSeenSeason,
    MAX(Season) AS LastSeenSeason
FROM (
    SELECT HomeTeam AS TeamName, Division, Season FROM [English Premier League and Championship].[Silver].[Matches]
    UNION ALL
    SELECT AwayTeam AS TeamName, Division, Season FROM [English Premier League and Championship].[Silver].[Matches]
    UNION ALL
    SELECT HomeTeam AS TeamName, Division, Season FROM [English Premier League and Championship].[Silver].[Matches_Historical]
    UNION ALL
    SELECT AwayTeam AS TeamName, Division, Season FROM [English Premier League and Championship].[Silver].[Matches_Historical]
) AllTeams
GROUP BY TeamName;
PRINT CONCAT('Inserted ', @@ROWCOUNT, ' rows into Gold.DimTeam');