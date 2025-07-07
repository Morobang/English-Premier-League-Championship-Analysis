-- if both columns havr the same columns i wanna see if i can just make the tables in a bronze layer into one


	SELECT 
		a.COLUMN_NAME AS England_CSV_Columns,
		b.COLUMN_NAME AS England_2_CSV_Columns
	FROM 
		(SELECT COLUMN_NAME 
		 FROM INFORMATION_SCHEMA.COLUMNS 
		 WHERE TABLE_NAME = 'England_CSV' AND TABLE_SCHEMA = 'Bronze') AS a
	FULL OUTER JOIN 
		(SELECT COLUMN_NAME 
		 FROM INFORMATION_SCHEMA.COLUMNS 
		 WHERE TABLE_NAME = 'England_2_CSV' AND TABLE_SCHEMA = 'Bronze') AS b
	ON a.COLUMN_NAME = b.COLUMN_NAME;







SELECT *
FROM [Bronze].[England_CSV];








