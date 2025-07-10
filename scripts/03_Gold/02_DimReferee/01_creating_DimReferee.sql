CREATE TABLE Gold.DimReferee (
    RefereeSK INT IDENTITY(1,1) PRIMARY KEY,
    RefereeName NVARCHAR(100) NOT NULL,
    FirstSeenSeason NVARCHAR(10),
    LastSeenSeason NVARCHAR(10),
    MatchesOfficiated INT DEFAULT 0,
    LoadTimestamp DATETIME2 DEFAULT SYSUTCDATETIME()
);