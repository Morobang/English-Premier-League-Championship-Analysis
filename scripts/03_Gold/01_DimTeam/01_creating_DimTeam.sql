CREATE TABLE Gold.DimTeam (
    TeamSK INT IDENTITY(1,1) PRIMARY KEY,
    TeamName NVARCHAR(100) NOT NULL,
    CurrentDivision NVARCHAR(50), -- From latest season in your data
    FirstSeenSeason NVARCHAR(10), -- Earliest season the team appears
    LastSeenSeason NVARCHAR(10), -- Most recent season the team appears
    IsActive BIT DEFAULT 1,
    LoadTimestamp DATETIME2 DEFAULT SYSUTCDATETIME()
);