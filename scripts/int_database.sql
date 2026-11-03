/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.
*/
```


USE Master; 

-- Drop and recreate the 'DataWarehouse_Sidiq' database
IF Exist (SELECT 1 FROM sys.databases WHERE name = 'DataWareHouse_Sidiq')
BEGIN
  ALTER DATABASE DataWareHouse_Sidiq SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWareHouse;
CREATE DATABASE DataWareHouse_Sidiq;

CREATE SCHEMA bronze;  -- for organization into logical groups 
GO
CREATE SCHEMA silver; 
GO
CREATE SCHEMA gold; 
GO

SELECT  -- checking schemas 
    name AS SchemaName,
    schema_id AS SchemaID
FROM sys.schemas
ORDER BY name;
