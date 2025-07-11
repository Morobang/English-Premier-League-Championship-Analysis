-- Populate fact tables in a transaction for safety
BEGIN TRY
    BEGIN TRANSACTION;
    
    -- Populate complete matches fact table
    PRINT 'Populating Gold.FactMatches from Silver.Matches (complete stats)...';
    INSERT INTO Gold.FactMatches (
        DateSK, HomeTeamSK, AwayTeamSK, RefereeSK,
        FullTimeHomeGoals, FullTimeAwayGoals,
        HalfTimeHomeGoals, HalfTimeAwayGoals,
        HomeShots, AwayShots,
        HomeShotsOnTarget, AwayShotsOnTarget,
        HomeFouls, AwayFouls,
        HomeCorners, AwayCorners,
        HomeYellowCards, AwayYellowCards,
        HomeRedCards, AwayRedCards,
        Division, Season, SourceFile
    )
    SELECT 
        d.DateSK,
        ht.TeamSK,
        at.TeamSK,
        r.RefereeSK,
        sm.FullTimeHomeGoals,
        sm.FullTimeAwayGoals,
        sm.HalfTimeHomeGoals,
        sm.HalfTimeAwayGoals,
        sm.HomeShots,
        sm.AwayShots,
        sm.HomeShotsOnTarget,
        sm.AwayShotsOnTarget,
        sm.HomeFouls,
        sm.AwayFouls,
        sm.HomeCorners,
        sm.AwayCorners,
        sm.HomeYellowCards,
        sm.AwayYellowCards,
        sm.HomeRedCards,
        sm.AwayRedCards,
        sm.Division,
        sm.Season,
        sm.SourceFile
    FROM [English Premier League and Championship].[Silver].[Matches] sm
    JOIN Gold.DimDate d ON CONVERT(DATE, sm.MatchDate) = d.Date
    JOIN Gold.DimTeam ht ON sm.HomeTeam = ht.TeamName
    JOIN Gold.DimTeam at ON sm.AwayTeam = at.TeamName
    LEFT JOIN Gold.DimReferee r ON sm.Referee = r.RefereeName;
    
    PRINT CONCAT('Inserted ', @@ROWCOUNT, ' rows into Gold.FactMatches');