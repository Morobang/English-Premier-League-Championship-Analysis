DECLARE @bronze_count INT;
DECLARE @silver_count INT;

-- Count the rows in Bronze layer tables
SELECT @bronze_count = 
    (SELECT COUNT(*) FROM [Bronze].[England_2_CSV]) + 
    (SELECT COUNT(*) FROM [Bronze].[England_CSV]);

-- Count the rows in Silver layer table
SELECT @silver_count = COUNT(*) FROM [Silver].[Matches];

-- Compare the counts
IF @bronze_count = @silver_count
BEGIN
    PRINT 'Row counts match: ' + CAST(@bronze_count AS NVARCHAR);
END
ELSE
BEGIN
    PRINT 'Row counts do not match. Bronze: ' + CAST(@bronze_count AS NVARCHAR) + 
          ', Silver: ' + CAST(@silver_count AS NVARCHAR);
END
