-- File: 01_data_quality_assessment.sql
-- Purpose: Document null values and completeness issues
-- Date: [Current Date]

-- Count total records
SELECT COUNT(*) AS TotalRecords FROM [Silver].[Matches];

-- Count incomplete records (missing detailed stats)
SELECT 
    COUNT(*) AS IncompleteRecords,
    MIN(Season) AS EarliestSeason,
    MAX(Season) AS LatestSeason
FROM [Silver].[Matches]
WHERE 
    HomeShots IS NULL AND
    AwayShots IS NULL;

-- Breakdown by season/division
SELECT 
    Season,
    Division,
    COUNT(*) AS RecordsMissingStats
FROM [Silver].[Matches]
WHERE 
    HomeShots IS NULL
GROUP BY Season, Division
ORDER BY Season;

-- Sample of affected records
SELECT *
FROM [Silver].[Matches]
WHERE 
    HomeShots IS NULL
ORDER BY MatchDate;