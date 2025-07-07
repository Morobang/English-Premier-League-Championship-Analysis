-- =============================================
-- Database Creation for English Football Data
-- =============================================

-- Check if database exists first
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'English Premier League and Championship')
BEGIN
    -- Create the database (with brackets to handle spaces)
    CREATE DATABASE [English Premier League and Championship];
    PRINT 'Created database: [English Premier League and Championship]';
END
ELSE
BEGIN
    PRINT 'Database [English Premier League and Championship] already exists';
END
GO

-- =============================================
-- Schema Creation for Data Architecture Layers
-- =============================================

USE [English Premier League and Championship];
GO

-- Create Bronze schema if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Bronze')
BEGIN
    EXEC('CREATE SCHEMA Bronze');
    PRINT 'Created schema: Bronze';
END
ELSE
BEGIN
    PRINT 'Schema Bronze already exists';
END
GO

-- Create Silver schema if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Silver')
BEGIN
    EXEC('CREATE SCHEMA Silver');
    PRINT 'Created schema: Silver';
END
ELSE
BEGIN
    PRINT 'Schema Silver already exists';
END
GO

-- Create Gold schema if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Gold')
BEGIN
    EXEC('CREATE SCHEMA Gold');
    PRINT 'Created schema: Gold';
END
ELSE
BEGIN
    PRINT 'Schema Gold already exists';
END
GO

PRINT 'All operations completed successfully';
GO