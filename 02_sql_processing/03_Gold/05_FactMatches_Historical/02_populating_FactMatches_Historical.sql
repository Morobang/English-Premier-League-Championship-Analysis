-- =============================================
-- Populate Gold.FactMatches_Historical from Silver.Matches_Historical
-- =============================================
BEGIN TRY
    BEGIN TRANSACTION;

    PRINT 'Populating Gold.FactMatches_Historical from Silver.Matches_Historical (limited stats)...';

    INSERT INTO Gold.FactMatches_Historical (
        DateSK, HomeTeamSK, AwayTeamSK, RefereeSK,
        FullTimeHomeGoals, FullTimeAwayGoals,
        Division, Season, SourceFile, ArchiveReason
    )
    SELECT 
        d.DateSK,
        ht.TeamSK,
        at.TeamSK,
        r.RefereeSK,
        sm.FullTimeHomeGoals,
        sm.FullTimeAwayGoals,
        sm.Division,
        sm.Season,
        sm.SourceFile,
        sm.ArchiveReason
    FROM [English Premier League and Championship].[Silver].[Matches_Historical] sm
    JOIN Gold.DimDate d ON CONVERT(DATE, sm.MatchDate) = d.Date
    JOIN Gold.DimTeam ht ON sm.HomeTeam = ht.TeamName
    JOIN Gold.DimTeam at ON sm.AwayTeam = at.TeamName
    LEFT JOIN Gold.DimReferee r ON sm.Referee = r.RefereeName;

    DECLARE @msg NVARCHAR(100);
    SET @msg = 'Inserted ' + CAST(@@ROWCOUNT AS NVARCHAR(10)) + ' rows into Gold.FactMatches_Historical';
    PRINT @msg;

    COMMIT TRANSACTION;
    PRINT 'Gold layer population completed successfully';

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT 'Error occurred during Gold layer population:';
    PRINT ERROR_MESSAGE();

    -- Re-throw the error properly
    THROW;
END CATCH;


