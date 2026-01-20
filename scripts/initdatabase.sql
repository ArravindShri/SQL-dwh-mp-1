## 🗄️ Database Setup

To initialize the project, run the following SQL script. This sets up the main `DataWarehouse` and creates the three schemas required for the Medallion Architecture (**Bronze**, **Silver**, **Gold**).

```sql
USE master;
GO

-- 1. Create the main database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- 2. Create Schemas for Medallion Architecture
CREATE SCHEMA bronze; -- Raw Layer
GO

CREATE SCHEMA silver; -- Cleansed & Transformed Layer
GO

CREATE SCHEMA gold;   -- Analytical & Reporting Layer
GO
