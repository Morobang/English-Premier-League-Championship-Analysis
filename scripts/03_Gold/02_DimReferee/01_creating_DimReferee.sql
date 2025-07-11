IF EXISTS (SELECT * FROM sys.tables WHERE name = 'DimReferee' AND schema_id = SCHEMA_ID('Gold'))
BEGIN
    PRINT 'Dropping existing Gold.DimReferee table...'
    DROP TABLE Gold.DimReferee;
END
GO


-- DimReferee table (basic version)
CREATE TABLE Gold.DimReferee (
    RefereeSK INT IDENTITY(1,1) PRIMARY KEY,
    RefereeName NVARCHAR(100) NOT NULL,
    FirstSeenSeason NVARCHAR(10),
    LastSeenSeason NVARCHAR(10),
    MatchesOfficiated INT DEFAULT 0,
    LoadTimestamp DATETIME2 DEFAULT SYSUTCDATETIME(),
    CONSTRAINT UQ_RefereeName UNIQUE (RefereeName)
);
PRINT 'Created Gold.DimReferee table';