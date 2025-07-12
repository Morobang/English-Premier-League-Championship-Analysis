-- =============================================
-- Populate Gold.FactMatches from Silver.Matches
-- =============================================
BEGIN TRY
    BEGIN TRANSACTION;

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

    DECLARE @msg NVARCHAR(100);
    SET @msg = 'Inserted ' + CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' rows into Gold.FactMatches';
    PRINT @msg;

    COMMIT TRANSACTION;
    PRINT 'Transaction committed successfully.';

END TRY
BEGIN CATCH
    PRINT 'Error: ' + ERROR_MESSAGE();
    ROLLBACK TRANSACTION;
END CATCH;

    
DECLARE @rowcountMessage NVARCHAR(100);
SET @rowcountMessage = 'Inserted ' + CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' rows into Gold.FactMatches';
PRINT @rowcountMessage;



select *
from Gold.FactMatches;