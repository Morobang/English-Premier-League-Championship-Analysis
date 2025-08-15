IF EXISTS (SELECT * FROM sys.tables WHERE name = 'DimTeam' AND schema_id = SCHEMA_ID('Gold'))
BEGIN
    PRINT 'Dropping existing Gold.DimTeam table...'
    DROP TABLE Gold.DimTeam;
END
GO


-- DimTeam table (using only available data)
CREATE TABLE Gold.DimTeam (
    TeamSK INT IDENTITY(1,1) PRIMARY KEY,
    TeamName NVARCHAR(100) NOT NULL,
    CurrentDivision NVARCHAR(50),
    FirstSeenSeason NVARCHAR(10),
    LastSeenSeason NVARCHAR(10),
    IsActive BIT DEFAULT 1,
    LoadTimestamp DATETIME2 DEFAULT SYSUTCDATETIME(),
    CONSTRAINT UQ_TeamName UNIQUE (TeamName)
);
PRINT 'Created Gold.DimTeam table';











