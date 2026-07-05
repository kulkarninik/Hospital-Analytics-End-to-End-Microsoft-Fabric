-- =============================================
-- FIXED & CLEAN SCRIPT - Run All At Once
-- =============================================

USE master;
GO

-- Drop login if it already exists
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'FabricGatewayUser')
    DROP LOGIN FabricGatewayUser;
GO

-- Create Login at server level
CREATE LOGIN FabricGatewayUser 
    WITH PASSWORD = 'Gateway@123#',
         CHECK_EXPIRATION = OFF, 
         CHECK_POLICY = OFF;
GO

PRINT 'Login created at server level ✓';
GO

-- Now switch to HospitalDB to create user and permissions
USE HospitalDB;
GO

-- Drop user if it exists
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'FabricGatewayUser')
    DROP USER FabricGatewayUser;
GO

-- Create user in the database and give permissions
CREATE USER FabricGatewayUser FOR LOGIN FabricGatewayUser;
GO

ALTER ROLE db_datareader ADD MEMBER FabricGatewayUser;
ALTER ROLE db_datawriter ADD MEMBER FabricGatewayUser;
GO

PRINT '✅ FabricGatewayUser created successfully!';
PRINT 'Now please RESTART your SQL Server (SQLEXPRESS) service.';