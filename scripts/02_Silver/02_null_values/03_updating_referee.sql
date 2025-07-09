-- Update referee in main table
UPDATE [Silver].[Matches]
SET Referee = 'Unknown'
WHERE Referee = 'nan' OR Referee IS NULL;



-- Update referee in historical table
UPDATE [Silver].[Matches_Historical]
SET Referee = 'Unknown'
WHERE Referee = 'nan' OR Referee IS NULL;





-- Verify changes in main table
SELECT 
    COUNT(*) AS TotalRecords,
    SUM(CASE WHEN Referee = 'Unknown' THEN 1 ELSE 0 END) AS UnknownReferees,
    SUM(CASE WHEN Referee IS NULL THEN 1 ELSE 0 END) AS NullReferees
FROM [Silver].[Matches];



-- Verify changes in historical table
SELECT 
    COUNT(*) AS TotalRecords,
    SUM(CASE WHEN Referee = 'Unknown' THEN 1 ELSE 0 END) AS UnknownReferees,
    SUM(CASE WHEN Referee IS NULL THEN 1 ELSE 0 END) AS NullReferees
FROM [Silver].[Matches_Historical];




