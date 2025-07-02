Select * from [England Cleaned CSV];



-- 1. Basic Queries

-- Show all matches played in the 2023-24 season
Select * 
From [England Cleaned CSV]
WHERE Season = '2023/24';

-- List the top 10 most recent matches played.
SELECT TOP 10 * 
FROM [England Cleaned CSV];


-- Count how many matches are in the dataset.
SELECT COUNT(*) AS Tatol_Matches
FROM [England Cleaned CSV];

-- Show all matches where Manchester United played at home.
Select * 
From [England Cleaned CSV]
Where HomeTeam ='Man United';


-- Show all matches where Arsenal played away.
Select * 
From [England Cleaned CSV]
Where AwayTeam ='Arsenal';

--List all matches where the referee was Mike Dean.
Select * 
FROM [England Cleaned CSV]
WHERE Referee='M Dean';


--Show all matches played on a Saturday.
SELECT * 
FROM [England Cleaned CSV]
WHERE DATEPART(dw, CONVERT(DATE, Date, 103)) = 7;

--List all matches where the total goals were exactly 0.
SELECT * 
FROM [England Cleaned CSV]
WHERE FTH_Goals = 0 AND FTA_Goals = 0;

--Show matches played by a specific team (e.g., 'Arsenal') regardless of home or away.
SELECT * 
FROM [England Cleaned CSV]
WHERE HomeTeam = 'Arsenal' OR AwayTeam = 'Arsenal';

--Find matches where both teams scored at least 2 goals.
SELECT * 
FROM [England Cleaned CSV]
WHERE FTH_Goals >= 2 AND FTA_Goals >= 2;
