-- Populate DimDate (covering all dates in both tables)
PRINT 'Populating Gold.DimDate...';
INSERT INTO Gold.DimDate
SELECT 
    CONVERT(INT, CONVERT(VARCHAR(8), MatchDate, 112)) AS DateSK,
    MatchDate AS Date,
    DAY(MatchDate) AS Day,
    MONTH(MatchDate) AS Month,
    YEAR(MatchDate) AS Year,
    DATEPART(QUARTER, MatchDate) AS Quarter,
    DATENAME(WEEKDAY, MatchDate) AS DayOfWeek,
    DATENAME(MONTH, MatchDate) AS MonthName,
    CASE WHEN DATENAME(WEEKDAY, MatchDate) IN ('Saturday', 'Sunday') THEN 1 ELSE 0 END AS IsWeekend,
    Season
FROM (
    SELECT DISTINCT MatchDate, Season FROM [English Premier League and Championship].[Silver].[Matches]
    UNION
    SELECT DISTINCT MatchDate, Season FROM [English Premier League and Championship].[Silver].[Matches_Historical]
) AllDates;
PRINT CONCAT('Inserted ', @@ROWCOUNT, ' rows into Gold.DimDate');