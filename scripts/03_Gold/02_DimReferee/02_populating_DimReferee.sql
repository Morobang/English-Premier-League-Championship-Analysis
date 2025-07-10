-- Insert referees from both tables (excluding 'Unknown')
INSERT INTO Gold.DimReferee (RefereeName, FirstSeenSeason, LastSeenSeason)
SELECT 
    Referee,
    MIN(Season) AS FirstSeenSeason,
    MAX(Season) AS LastSeenSeason
FROM (
    SELECT Referee, Season FROM Silver.Matches WHERE Referee <> 'Unknown'
    UNION ALL
    SELECT Referee, Season FROM Silver.Matches_Historical WHERE Referee <> 'Unknown'
) AllReferees
GROUP BY Referee;

-- Update match counts
UPDATE r
SET MatchesOfficiated = (
    SELECT COUNT(*) 
    FROM (
        SELECT Referee FROM Silver.Matches 
        UNION ALL 
        SELECT Referee FROM Silver.Matches_Historical
    ) m 
    WHERE m.Referee = r.RefereeName
)
FROM Gold.DimReferee r;

Select * 
from Gold.DimReferee;