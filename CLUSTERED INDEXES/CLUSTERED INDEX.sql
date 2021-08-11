CREATE TABLE [ADVENTUREWORKS].[dbo].[TestingTable]
(
    ID		INT,
	Name	VARCHAR(20),
	Email	VARCHAR(50),
	City	VARCHAR(180)
)
GO
-- table does not have a primary key, therefore, SQL Server stores its rows in an unordered structure called a heap.
--A clustered index stores data rows in a sorted structure based on its key values. Each table has only one clustered index because data rows can be only sorted in one order.
CREATE		CLUSTERED INDEX IX_ID
ON			[ADVENTUREWORKS].[dbo].[TestingTable](ID)
GO

ALTER		INDEX IX_ID
ON			[dbo].[TestingTable] 
DISABLE		--DISABLE INDEX
GO

ALTER		INDEX IX_ID
ON			[dbo].[TestingTable] 
REBUILD		--RE-ENABLE INDEX
GO

DROP		INDEX IX_ID
ON			[dbo].[TestingTable] 
GO			--DROP INDEX

--RENAME

EXEC sp_rename 
        @objname = N'[dbo].[TestingTable].IX_ID',
        @newname = N'ix_id_col' ,
        @objtype = N'INDEX';
