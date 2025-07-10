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