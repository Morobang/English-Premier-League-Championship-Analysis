Select * from [England Cleaned CSV];


-- 3. Goals Analysis
--List the top 10 highest scoring matches.
SELECT TOP 10 *
FROM [England Cleaned CSV]
ORDER BY (FTH_Goals + FTA_Goals) DESC;

--Which team scored the most home goals overall?
SELECT HomeTeam, SUM(FTH_Goals) AS Total_Home_Goals
FROM [England Cleaned CSV]
GROUP BY HomeTeam
ORDER BY Total_Home_Goals DESC;


--What’s the biggest goal difference in a match?
SELECT 
    MAX(GREATEST(FTH_Goals, FTA_Goals)) AS Highest_Goals_Scored_By_Team
FROM 
    [England Cleaned CSV];

--Which match had the most combined shots?
SELECT Top 1 HomeTeam ,AwayTeam ,H_Shots + A_Shots AS Combined_Shots
FROM [England Cleaned CSV]
ORDER BY Combined_Shots DESC;

--List top 10 matches with the biggest home wins.
SELECT TOP 10 HomeTeam, AwayTeam, (FTH_Goals - FTA_Goals) AS Biggest_Home_Wins
FROM [England Cleaned CSV]
WHERE FT_Result = 'H'
ORDER BY Biggest_Home_Wins DESC;

--List top 10 matches with the biggest away wins.
SELECT TOP 10 HomeTeam, AwayTeam, (FTA_Goals - FTH_Goals) AS Biggest_Away_Wins
FROM [England Cleaned CSV]
WHERE FT_Result = 'A'
ORDER BY Biggest_Away_Wins DESC;

--Show matches with odd total goal counts.
SELECT *
FROM [England Cleaned CSV]
WHERE (FTH_Goals + FTA_Goals) % 2 = 1;

--List teams with an average of 2+ goals per home game.
SELECT HomeTeam, AVG(FTH_Goals) AS Average_Home_Goals
FROM [England Cleaned CSV]
GROUP BY HomeTeam
HAVING AVG(FTH_Goals) >= 2;

--Average number of goals scored by each team when playing away.
Select AwayTeam,AVG(FTA_Goals) AS Average_Away_Goals
from [England Cleaned CSV]
Group by AwayTeam;