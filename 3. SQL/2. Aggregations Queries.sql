Select * from [England Cleaned CSV];



-- 2. Aggregations

--Total number of goals scored in the dataset.
Select SUM(FTH_Goals) + SUM(FTA_Goals) AS Total_Goals  
from [England Cleaned CSV];

--Average number of goals per match.
SELECT 
    (SUM(FTH_Goals) + SUM(FTA_Goals)) / COUNT(*) AS Average_Goals_Per_Match
FROM 
    [England Cleaned CSV];


--Total home wins, away wins, and draws.
SELECT 
    SUM(CASE WHEN FT_Result = 'H' THEN 1 ELSE 0 END) AS Total_Home_Wins,
    SUM(CASE WHEN FT_Result = 'A' THEN 1 ELSE 0 END) AS Total_Away_Wins,
    SUM(CASE WHEN FT_Result = 'D' THEN 1 ELSE 0 END) AS Total_Draws
FROM 
    [England Cleaned CSV]
WHERE HomeTeam = 'Arsenal' OR AwayTeam = 'Arsenal';

--Total number of red cards given.
SELECT 
    SUM(CASE WHEN H_Red = '1' THEN 1 ELSE 0 END) +
    SUM(CASE WHEN A_Red = '1' THEN 1 ELSE 0 END) AS Total_Red_Cards_Given
FROM 
    [England Cleaned CSV];



--Average number of yellow cards per match.
SELECT 
    (SUM(H_Yellow) + SUM(A_Yellow)) / COUNT(*) AS Average_Goals_Per_Match
FROM 
    [England Cleaned CSV];

--Total number of matches with more than 4 goals.
SELECT count(*) Total_Number_Of_Matches
FROM [England Cleaned CSV]
WHERE FTH_Goals + FTA_Goals > 4;

--Count of matches that ended in a draw.
SELECT count(*) Total_Number_Of_Matches_I_Draw
FROM [England Cleaned CSV]
WHERE FT_Result > 'D';


--Number of matches with at least one red card.

--Highest number of goals scored by a single team in a match.
SELECT 
    MAX(GREATEST(FTH_Goals, FTA_Goals)) AS Highest_Goals_Scored_By_Team
FROM 
    [England Cleaned CSV];

--Count of matches with more than 10 combined shots on target.

SELECT COUNT(*)
FROM [England Cleaned CSV]
where H_Shots + A_Shots > 10;