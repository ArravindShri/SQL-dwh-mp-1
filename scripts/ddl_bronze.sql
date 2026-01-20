/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates the tables in the 'bronze' schema for the Data Warehouse.
    It drops existing tables if they exist and re-creates them.
    Run this script to re-initialize the DDL structure of the Bronze Layer.
===============================================================================
*/

USE DataWarehouse;
GO

PRINT '>> Creating Tables for Bronze Layer';

-- 1. Create Table: crm_cust_info
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info (
    cst_id              INT,
    cst_key             NVARCHAR(50),
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_material_status NVARCHAR(50),
    cst_gndr            NVARCHAR(50),
    cst_create_date     DATE
);
GO

-- 2. Create Table: crm_prd_info
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(100),
    prd_cost     DECIMAL(10, 2),
    prd_line     NVARCHAR(10),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);
GO

-- 3. Create Table: crm_sales_details
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    DECIMAL(18, 2),
    sls_quantity INT,
    sls_price    DECIMAL(18, 2)
);
GO

-- 4. Create Table: erp_cust_az12
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(20)
);
GO

-- 5. Create Table: erp_crm_cust_loc
IF OBJECT_ID('bronze.erp_crm_cust_loc', 'U') IS NOT NULL
    DROP TABLE bronze.erp_crm_cust_loc;
GO

CREATE TABLE bronze.erp_crm_cust_loc (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);
GO

-- 6. Create Table: erp_px_cat_g1v2
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);
GO

PRINT '>> Bronze Tables Created Successfully';
