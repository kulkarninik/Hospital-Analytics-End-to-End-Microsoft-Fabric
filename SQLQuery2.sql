-- =============================================
-- Grant Database Access to FabricGatewayUser
-- =============================================

USE HospitalDB;
GO

-- Drop existing user if any
IF EXISTS (SELECT * FROM sys.database_principals WHERE name = 'FabricGatewayUser')
    DROP USER FabricGatewayUser;
GO

-- Create user mapped to the server login
CREATE USER FabricGatewayUser FOR LOGIN FabricGatewayUser;
GO

-- Give full read/write access
ALTER ROLE db_datareader ADD MEMBER FabricGatewayUser;
ALTER ROLE db_datawriter ADD MEMBER FabricGatewayUser;

-- Also grant schema owner if needed
GRANT ALTER ON SCHEMA::dbo TO FabricGatewayUser;
GO

PRINT '✅ FabricGatewayUser now has full access to HospitalDB';