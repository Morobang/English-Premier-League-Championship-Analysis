-- First insert from main table (complete stats)
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
FROM Silver.Matches sm
JOIN Gold.DimDate d ON CONVERT(DATE, sm.MatchDate) = d.Date
JOIN Gold.DimTeam ht ON sm.HomeTeam = ht.TeamName
JOIN Gold.DimTeam at ON sm.AwayTeam = at.TeamName
LEFT JOIN Gold.DimReferee r ON sm.Referee = r.RefereeName;

-- Then insert from historical table (limited stats)
INSERT INTO Gold.FactMatches (
    DateSK, HomeTeamSK, AwayTeamSK, RefereeSK,
    FullTimeHomeGoals, FullTimeAwayGoals,
    Division, Season, SourceFile
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
    sm.SourceFile
FROM Silver.Matches_Historical sm
JOIN Gold.DimDate d ON CONVERT(DATE, sm.MatchDate) = d.Date
JOIN Gold.DimTeam ht ON sm.HomeTeam = ht.TeamName
JOIN Gold.DimTeam at ON sm.AwayTeam = at.TeamName
LEFT JOIN Gold.DimReferee r ON sm.Referee = r.RefereeName;