--Minaz read more about LOGON triggers 

CREATE OR ALTER TRIGGER [dbo].TRG_Person_Temporal_History_ForDelete
ON	[ADVENTUREWORKS].[dbo].[Person_Temporal]
FOR DELETE
AS
BEGIN
	DECLARE @Id INT
	SELECT @Id= [BusinessEntityId] from deleted
	DELETE FROM [ADVENTUREWORKS].[dbo].[Person_Temporal_History] WHERE [BusinessEntityId]= @Id
END
GO

DELETE FROM [ADVENTUREWORKS].[dbo].[Person_Temporal] WHERE [BusinessEntityId]=100
GO

DISABLE TRIGGER [dbo].TRG_Person_Temporal_History_ForDelete
ON				[ADVENTUREWORKS].[dbo].[Person_Temporal]
GO

ENABLE TRIGGER  [dbo].TRG_Person_Temporal_History_ForDelete
ON				[ADVENTUREWORKS].[dbo].[Person_Temporal]
GO

DROP TRIGGER IF EXISTS TRG_Person_Temporal_History_ForDelete --Cannot specify a schema name as a prefix to the trigger name for database and server level triggers.
ON ALL SERVER

