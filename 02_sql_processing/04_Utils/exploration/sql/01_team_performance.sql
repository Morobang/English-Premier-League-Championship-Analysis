WITH TeamResults AS (
    -- Home matches from FactMatches (complete stats)
    SELECT 
        t.TeamName,
        COUNT(*) AS TotalMatches,
        SUM(CASE WHEN fm.FullTimeHomeGoals > fm.FullTimeAwayGoals THEN 1 ELSE 0 END) AS Wins,
        SUM(CASE WHEN fm.FullTimeHomeGoals = fm.FullTimeAwayGoals THEN 1 ELSE 0 END) AS Draws,
        'Home' AS MatchType,
        'Complete' AS DataSource
    FROM Gold.FactMatches fm
    JOIN Gold.DimTeam t ON fm.HomeTeamSK = t.TeamSK
    GROUP BY t.TeamName
    
    UNION ALL
    
    -- Away matches from FactMatches (complete stats)
    SELECT 
        t.TeamName,
        COUNT(*) AS TotalMatches,
        SUM(CASE WHEN fm.FullTimeAwayGoals > fm.FullTimeHomeGoals THEN 1 ELSE 0 END) AS Wins,
        SUM(CASE WHEN fm.FullTimeAwayGoals = fm.FullTimeHomeGoals THEN 1 ELSE 0 END) AS Draws,
        'Away' AS MatchType,
        'Complete' AS DataSource
    FROM Gold.FactMatches fm
    JOIN Gold.DimTeam t ON fm.AwayTeamSK = t.TeamSK
    GROUP BY t.TeamName
    
    UNION ALL
    
    -- Home matches from FactMatches_Historical (limited stats)
    SELECT 
        t.TeamName,
        COUNT(*) AS TotalMatches,
        SUM(CASE WHEN fh.FullTimeHomeGoals > fh.FullTimeAwayGoals THEN 1 ELSE 0 END) AS Wins,
        SUM(CASE WHEN fh.FullTimeHomeGoals = fh.FullTimeAwayGoals THEN 1 ELSE 0 END) AS Draws,
        'Home' AS MatchType,
        'Historical' AS DataSource
    FROM Gold.FactMatches_Historical fh
    JOIN Gold.DimTeam t ON fh.HomeTeamSK = t.TeamSK
    GROUP BY t.TeamName
    
    UNION ALL
    
    -- Away matches from FactMatches_Historical (limited stats)
    SELECT 
        t.TeamName,
        COUNT(*) AS TotalMatches,
        SUM(CASE WHEN fh.FullTimeAwayGoals > fh.FullTimeHomeGoals THEN 1 ELSE 0 END) AS Wins,
        SUM(CASE WHEN fh.FullTimeAwayGoals = fh.FullTimeHomeGoals THEN 1 ELSE 0 END) AS Draws,
        'Away' AS MatchType,
        'Historical' AS DataSource
    FROM Gold.FactMatches_Historical fh
    JOIN Gold.DimTeam t ON fh.AwayTeamSK = t.TeamSK
    GROUP BY t.TeamName
)
SELECT 
    TeamName,
    SUM(TotalMatches) AS TotalMatches,
    SUM(Wins) AS TotalWins,
    SUM(Draws) AS TotalDraws,
    SUM(TotalMatches) - SUM(Wins) - SUM(Draws) AS TotalLosses,
    ROUND(SUM(Wins) * 100.0 / NULLIF(SUM(TotalMatches), 0), 2) AS WinPercentage,
    ROUND((SUM(Wins) + SUM(Draws)) * 100.0 / NULLIF(SUM(TotalMatches), 0), 2) AS UnbeatenPercentage,
    -- Complete stats only metrics
    ROUND(SUM(CASE WHEN DataSource = 'Complete' THEN Wins ELSE 0 END) * 100.0 / 
          NULLIF(SUM(CASE WHEN DataSource = 'Complete' THEN TotalMatches ELSE 0 END), 0), 2) AS CompleteDataWinPercentage,
    -- Home vs Away
    ROUND(SUM(CASE WHEN MatchType = 'Home' THEN Wins ELSE 0 END) * 100.0 / 
          NULLIF(SUM(CASE WHEN MatchType = 'Home' THEN TotalMatches ELSE 0 END), 0), 2) AS HomeWinPercentage,
    ROUND(SUM(CASE WHEN MatchType = 'Away' THEN Wins ELSE 0 END) * 100.0 / 
          NULLIF(SUM(CASE WHEN MatchType = 'Away' THEN TotalMatches ELSE 0 END), 0), 2) AS AwayWinPercentage
FROM TeamResults
GROUP BY TeamName
HAVING SUM(TotalMatches) >= 20  -- Only include teams with sufficient data
ORDER BY WinPercentage DESC;


SELECT * 
FROM [Gold].[FactMatches];