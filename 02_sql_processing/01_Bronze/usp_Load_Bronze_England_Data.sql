-- =============================================
-- Stored Procedure: usp_Load_Bronze_England_Data
-- Purpose: Loads Premier League & Championship CSVs into Bronze Layer
-- =============================================
CREATE OR ALTER PROCEDURE [Bronze].[usp_Load_Bronze_England_Data]
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        ------------------------------------------------------------
        -- 1. Load Premier League Data into Bronze.England_CSV
        ------------------------------------------------------------
        PRINT 'Loading Premier League data...';
        TRUNCATE TABLE [Bronze].[England_CSV];

        BULK INSERT [Bronze].[England_CSV]
        FROM 'C:\\Users\\Morobang\\Documents\\GitHub\\English Premier League & Championship Analysis\\scripts\\01_Bronze\\Correctly_Formated Dataset\\England CSV.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        PRINT 'Premier League data loaded successfully.';

        ------------------------------------------------------------
        -- 2. Load Championship Data into Bronze.England_2_CSV
        ------------------------------------------------------------
        PRINT 'Loading Championship data...';
        TRUNCATE TABLE [Bronze].[England_2_CSV];

        BULK INSERT [Bronze].[England_2_CSV]
        FROM 'C:\\Users\\Morobang\\Documents\\GitHub\\English Premier League & Championship Analysis\\scripts\\01_Bronze\\Correctly_Formated Dataset\\England 2 CSV.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        PRINT 'Championship data loaded successfully.';

        ------------------------------------------------------------
        -- 3. Commit Transaction
        ------------------------------------------------------------
        COMMIT TRANSACTION;
        PRINT 'All data loaded into Bronze layer successfully.';

    END TRY
    BEGIN CATCH
        PRINT 'Error occurred while loading data.';
        PRINT ERROR_MESSAGE();
        ROLLBACK TRANSACTION;
    END CATCH;
END;
GO

EXEC Bronze.usp_Load_Bronze_England_Data;
GO



SELECT * 
FROM [Bronze].[England_CSV];


SELECT * 
FROM [Bronze].[England_2_CSV];




select League,count(League)
from [Bronze].[England_2_CSV]
group by League;



select League,count(League)
from [Bronze].[England_CSV]
group by League;



select * 
from [Bronze].[England_2_CSV]
where League != 'English Second';

select * 
from [Bronze].[England_CSV]
where League != 'English Second';


