
USE [ADVENTUREWORKS]
GO
DBCC CHECKIDENT ('[ADVENTUREWORKS].[dbo].[Person]',RESEED,99)
GO

SELECT SCOPE_IDENTITY() -- same session same scope
SELECT @@IDENTITY  -- same session across any scope
SELECT IDENT_CURRENT('[ADVENTUREWORKS].[dbo].[StateProvince]') -- table specific any session any any scope

DBCC CHECKIDENT ('[ADVENTUREWORKS].[dbo].[StateProvince]',RESEED,4)
GO

DBCC CHECKIDENT ('[ADVENTUREWORKS].[dbo].[Person_temporal]',RESEED,99)
GO


DBCC CHECKIDENT ('[ADVENTUREWORKS].[dbo].[Person_temporal_History]',RESEED,99)
GO
