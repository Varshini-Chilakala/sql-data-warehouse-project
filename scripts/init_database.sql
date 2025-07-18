/*
=============================================================
Create  Database and Schemas
=============================================================

Script Purpose:
    This script creates a new database named "DataWarehouse" after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas within 
    the database : 'bronze','silver' and 'gold'.

WARNING:
  Running this script will drop the enire 'DataWarehouse' database if it exists.
  All the data in the database will be deleted permanently.Proceed with caution and ensure you have proper 
  backups before running this script.
*/

USE master;
GO --separator

-- Drop and recreate the 'Datawarehouse' database if it already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name='DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

--create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
