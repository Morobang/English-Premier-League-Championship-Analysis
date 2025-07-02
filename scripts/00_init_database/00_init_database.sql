-- =============================================
-- Database Creation for English Football Data
-- =============================================

-- Create the database to store Premier League and Championship data
-- Using brackets for name to handle spaces in SQL Server
CREATE DATABASE [English Premier League and Championship];
GO -- Ensures the command executes before moving to next

-- =============================================
-- Schema Creation for Data Architecture Layers
-- =============================================

-- Bronze layer: Raw, unprocessed data directly from source
CREATE SCHEMA Bronze;
GO

-- Silver layer: Cleaned and validated data
CREATE SCHEMA Silver;
GO

-- Gold layer: Business-ready, aggregated data for reporting
CREATE SCHEMA Gold;
GO

