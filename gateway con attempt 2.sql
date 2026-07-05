-- =============================================
-- DIAGNOSTIC + FIX SCRIPT
-- =============================================

USE master;
GO

PRINT '=== Current Authentication Mode ==='
SELECT 
    CASE SERVERPROPERTY('IsIntegratedSecurityOnly')
        WHEN 1 THEN 'Windows Authentication Only (This is the problem!)'
        WHEN 0 THEN 'Mixed Mode Authentication (Good)'
    END AS AuthenticationMode;
GO

-- Enable Mixed Mode Authentication
EXEC xp_instance_regwrite 
    N'HKEY_LOCAL_MACHINE', 
    N'Software\Microsoft\MSSQLServer\MSSQLServer', 
    N'LoginMode', 
    REG_DWORD, 2;
GO

PRINT 'Mixed Mode Authentication has been enabled.';
GO

-- Create/Recreate Login
IF EXISTS (SELECT * FROM sys.server_principals WHERE name = 'FabricGatewayUser')
    DROP LOGIN FabricGatewayUser;
GO

CREATE LOGIN FabricGatewayUser 
    WITH PASSWORD = 'Gateway@123#',
         CHECK_EXPIRATION = OFF, 
         CHECK_POLICY = OFF;
GO

ALTER LOGIN FabricGatewayUser ENABLE;
GO

PRINT '✅ Login FabricGatewayUser created and enabled.';
PRINT ' ';
PRINT 'IMPORTANT: Please RESTART SQL Server Service now.';