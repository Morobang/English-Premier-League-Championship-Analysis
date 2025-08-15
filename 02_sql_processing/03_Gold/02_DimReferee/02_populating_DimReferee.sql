-- Populate DimReferee
PRINT 'Populating Gold.DimReferee...';
INSERT INTO Gold.DimReferee (RefereeName, FirstSeenSeason, LastSeenSeason)
SELECT 
    Referee,
    MIN(Season) AS FirstSeenSeason,
    MAX(Season) AS LastSeenSeason
FROM (
    SELECT Referee, Season FROM [English Premier League and Championship].[Silver].[Matches] WHERE Referee <> 'Unknown'
    UNION ALL
    SELECT Referee, Season FROM [English Premier League and Championship].[Silver].[Matches_Historical] WHERE Referee <> 'Unknown'
) AllReferees
GROUP BY Referee;
PRINT CONCAT('Inserted ', @@ROWCOUNT, ' rows into Gold.DimReferee');

-- Update referee match counts
PRINT 'Updating referee match counts...';
UPDATE r
SET MatchesOfficiated = (
    SELECT COUNT(*) 
    FROM (
        SELECT Referee FROM [English Premier League and Championship].[Silver].[Matches] WHERE Referee <> 'Unknown'
        UNION ALL 
        SELECT Referee FROM [English Premier League and Championship].[Silver].[Matches_Historical] WHERE Referee <> 'Unknown'
    ) m 
    WHERE m.Referee = r.RefereeName
)
FROM Gold.DimReferee r;
PRINT CONCAT('Updated ', @@ROWCOUNT, ' referee records');