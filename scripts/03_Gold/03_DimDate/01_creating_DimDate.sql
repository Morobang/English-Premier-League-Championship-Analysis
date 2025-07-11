IF EXISTS (SELECT * FROM sys.tables WHERE name = 'DimDate' AND schema_id = SCHEMA_ID('Gold'))
BEGIN
    PRINT 'Dropping existing Gold.DimDate table...'
    DROP TABLE Gold.DimDate;
END
GO


-- DimDate table
CREATE TABLE Gold.DimDate (
    DateSK INT PRIMARY KEY, -- YYYYMMDD format
    Date DATE NOT NULL,
    Day INT NOT NULL,
    Month INT NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    DayOfWeek NVARCHAR(10) NOT NULL,
    MonthName NVARCHAR(10) NOT NULL,
    IsWeekend BIT NOT NULL,
    Season NVARCHAR(10) -- 1999/00 format
);
PRINT 'Created Gold.DimDate table';