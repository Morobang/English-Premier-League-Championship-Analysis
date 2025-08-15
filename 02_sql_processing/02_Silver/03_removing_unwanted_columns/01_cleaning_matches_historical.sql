SELECT *
FROM [Silver].[Matches_Historical];



-- check showing the columns that have null values only
SELECT [HalfTimeHomeGoals]
      ,[HalfTimeAwayGoals]
      ,[HomeShots]
      ,[AwayShots]
      ,[HomeShotsOnTarget]
      ,[AwayShotsOnTarget]
      ,[HomeFouls]
      ,[AwayFouls]
      ,[HomeCorners]
      ,[AwayCorners]
      ,[HomeYellowCards]
      ,[AwayYellowCards]
      ,[HomeRedCards]
      ,[AwayRedCards]
FROM [Silver].[Matches_Historical];



-- dropping all coulmns with null values
ALTER TABLE [Silver].[Matches_Historical]
DROP COLUMN [HalfTimeHomeGoals]
			,[HalfTimeAwayGoals]
			,[HomeShots]
			,[AwayShots]
			,[HomeShotsOnTarget]
			,[AwayShotsOnTarget]
			,[HomeFouls]
			,[AwayFouls]
			,[HomeCorners]
			,[AwayCorners]
			,[HomeYellowCards]
			,[AwayYellowCards]
			,[HomeRedCards]
		 ,[AwayRedCards];