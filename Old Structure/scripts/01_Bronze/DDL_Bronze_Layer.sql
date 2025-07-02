/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
  Purpose:
    - Drop and recreate all Bronze layer tables.
    - Run this when initializing or resetting the Bronze stage in your Data Warehouse.
    - NOTE: This will remove all existing data in these tables.
===============================================================================
*/

-- Ensure you're using the correct database
USE DataWareHouse;
GO

-- (Optional) Create 'Bronze' schema if it doesn't exist
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Bronze')
    EXEC('CREATE SCHEMA Bronze');
GO

--------------------------------------------------------------------------------
-- CRM: Customer Info Table
--------------------------------------------------------------------------------
IF OBJECT_ID('Bronze.crm_customer_info', 'U') IS NOT NULL
    DROP TABLE Bronze.crm_customer_info;
GO

CREATE TABLE Bronze.crm_customer_info (
    cst_id              INT,             -- Customer ID
    cst_key             NVARCHAR(50),    -- Unique customer key
    cst_firstname       NVARCHAR(50),    -- First name
    cst_lastname        NVARCHAR(50),    -- Last name
    cst_marital_status  NVARCHAR(50),    -- Marital status (e.g., Single, Married)
    cst_gndr            NVARCHAR(50),    -- Gender
    cst_create_date     DATE             -- Customer creation/registration date
);
GO

--------------------------------------------------------------------------------
-- CRM: Product Info Table
--------------------------------------------------------------------------------
CREATE TABLE Bronze.crm_product_info (
    prd_id       INT,             -- Product ID
    prd_key      NVARCHAR(50),    -- Unique product key
    prd_nm       NVARCHAR(50),    -- Product name
    prd_cost     INT,             -- Cost of product
    prd_line     NVARCHAR(50),    -- Product line/category
    prd_start_dt DATETIME,        -- Start date of availability
    prd_end_dt   DATETIME         -- End date of availability
);
GO

--------------------------------------------------------------------------------
-- CRM: Sales Details Table
--------------------------------------------------------------------------------
CREATE TABLE Bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),    -- Sales order number
    sls_prd_key  NVARCHAR(50),    -- Product key (FK to product)
    sls_cust_id  INT,             -- Customer ID (FK to customer)
    sls_order_dt INT,             -- Order date (as integer format)
    sls_ship_dt  INT,             -- Ship date
    sls_due_dt   INT,             -- Due date
    sls_sales    INT,             -- Sales amount
    sls_quantity INT,             -- Quantity sold
    sls_price    INT              -- Product price
);
GO

--------------------------------------------------------------------------------
-- ERP: Location Table (LOC_A101)
--------------------------------------------------------------------------------
CREATE TABLE Bronze.erp_loc_a101 (
    cid    NVARCHAR(50),         -- Customer ID or Location ID
    cntry  NVARCHAR(50)          -- Country
);
GO

--------------------------------------------------------------------------------
-- ERP: Customer Table (CUST_AZ12)
--------------------------------------------------------------------------------
CREATE TABLE Bronze.erp_cust_az12 (
    cid    NVARCHAR(50),         -- Customer ID
    bdate  DATE,                 -- Birthdate
    gen    NVARCHAR(50)          -- Gender
);
GO

--------------------------------------------------------------------------------
-- ERP: Product Category Table (PX_CAT_G1V2)
--------------------------------------------------------------------------------
CREATE TABLE Bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),   -- Product ID
    cat          NVARCHAR(50),   -- Category
    subcat       NVARCHAR(50),   -- Subcategory
    maintenance  NVARCHAR(50)    -- Maintenance flag or description
);
GO
