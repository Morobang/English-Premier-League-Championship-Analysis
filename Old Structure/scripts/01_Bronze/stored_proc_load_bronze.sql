CREATE OR ALTER PROCEDURE [Bronze].[load_bronze]
AS
BEGIN
    SET NOCOUNT ON;

    -- Declare variables to track load durations
    DECLARE 
        @StartTime DATETIME2 = SYSDATETIME(),
        @FileStart DATETIME2,
        @FileEnd DATETIME2,
        @DurationMs INT;

    PRINT 'Starting Bronze Layer Load...';

    ----------------------------------------
    -- CRM Data Loads
    ----------------------------------------

    -- Load CRM: Customer Info
    PRINT 'Loading CRM: Customer Info...';
    SET @FileStart = SYSDATETIME();

    TRUNCATE TABLE [Bronze].[crm_customer_info];
    BULK INSERT [Bronze].[crm_customer_info]
    FROM 'C:\Users\Morobang\Documents\Data With Baraa\SQL Data Warehouse Projects\datasets\source_crm\customer_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    SET @FileEnd = SYSDATETIME();
    SET @DurationMs = DATEDIFF(MILLISECOND, @FileStart, @FileEnd);
    PRINT 'CRM: Customer Info Loaded in ' + CAST(@DurationMs AS VARCHAR) + ' ms';

    -- Load CRM: Product Info
    PRINT 'Loading CRM: Product Info...';
    SET @FileStart = SYSDATETIME();

    TRUNCATE TABLE [Bronze].[crm_product_info];
    BULK INSERT [Bronze].[crm_product_info]
    FROM 'C:\Users\Morobang\Documents\Data With Baraa\SQL Data Warehouse Projects\datasets\source_crm\product_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    SET @FileEnd = SYSDATETIME();
    SET @DurationMs = DATEDIFF(MILLISECOND, @FileStart, @FileEnd);
    PRINT 'CRM: Product Info Loaded in ' + CAST(@DurationMs AS VARCHAR) + ' ms';

    -- Load CRM: Sales Details
    PRINT 'Loading CRM: Sales Details...';
    SET @FileStart = SYSDATETIME();

    TRUNCATE TABLE [Bronze].[crm_sales_details];
    BULK INSERT [Bronze].[crm_sales_details]
    FROM 'C:\Users\Morobang\Documents\Data With Baraa\SQL Data Warehouse Projects\datasets\source_crm\sales_details.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    SET @FileEnd = SYSDATETIME();
    SET @DurationMs = DATEDIFF(MILLISECOND, @FileStart, @FileEnd);
    PRINT 'CRM: Sales Details Loaded in ' + CAST(@DurationMs AS VARCHAR) + ' ms';


    ----------------------------------------
    -- ERP Data Loads
    ----------------------------------------

    -- Load ERP: Customer AZ12
    PRINT 'Loading ERP: Customer AZ12...';
    SET @FileStart = SYSDATETIME();

    TRUNCATE TABLE [Bronze].[erp_cust_az12];
    BULK INSERT [Bronze].[erp_cust_az12]
    FROM 'C:\Users\Morobang\Documents\Data With Baraa\SQL Data Warehouse Projects\datasets\source_erp\CUST_AZ12.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    SET @FileEnd = SYSDATETIME();
    SET @DurationMs = DATEDIFF(MILLISECOND, @FileStart, @FileEnd);
    PRINT 'ERP: Customer AZ12 Loaded in ' + CAST(@DurationMs AS VARCHAR) + ' ms';

    -- Load ERP: Location A101
    PRINT 'Loading ERP: Location A101...';
    SET @FileStart = SYSDATETIME();

    TRUNCATE TABLE [Bronze].[erp_loc_a101];
    BULK INSERT [Bronze].[erp_loc_a101]
    FROM 'C:\Users\Morobang\Documents\Data With Baraa\SQL Data Warehouse Projects\datasets\source_erp\LOC_A101.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    SET @FileEnd = SYSDATETIME();
    SET @DurationMs = DATEDIFF(MILLISECOND, @FileStart, @FileEnd);
    PRINT 'ERP: Location A101 Loaded in ' + CAST(@DurationMs AS VARCHAR) + ' ms';

    -- Load ERP: Product Category G1V2
    PRINT 'Loading ERP: Product Category G1V2...';
    SET @FileStart = SYSDATETIME();

    TRUNCATE TABLE [Bronze].[erp_px_cat_g1v2];
    BULK INSERT [Bronze].[erp_px_cat_g1v2]
    FROM 'C:\Users\Morobang\Documents\Data With Baraa\SQL Data Warehouse Projects\datasets\source_erp\PX_CAT_G1V2.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    SET @FileEnd = SYSDATETIME();
    SET @DurationMs = DATEDIFF(MILLISECOND, @FileStart, @FileEnd);
    PRINT 'ERP: Product Category G1V2 Loaded in ' + CAST(@DurationMs AS VARCHAR) + ' ms';


    ----------------------------------------
    -- Finish
    ----------------------------------------
    DECLARE @EndTime DATETIME2 = SYSDATETIME();
    DECLARE @TotalDurationMs INT = DATEDIFF(MILLISECOND, @StartTime, @EndTime);
    PRINT 'Bronze Layer Load Complete. Total Duration: ' + CAST(@TotalDurationMs AS VARCHAR) + ' ms';
END;


EXEC [Bronze].[load_bronze];
