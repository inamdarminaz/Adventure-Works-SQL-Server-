--set primary key
ALTER TABLE [ADVENTUREWORKS].[dbo].[ContactType]
ADD CONSTRAINT PK_ContactType_ContactTypeID PRIMARY KEY (ContactTypeID)
GO

--Drop a column
ALTER TABLE [ADVENTUREWORKS].[dbo].[EmailAddress]
DROP COLUMN [RowGuid]

--Adding a new  column with its constraint
ALTER TABLE [ADVENTUREWORKS].[dbo].[EmailAddress]
ADD [RowGuid] INT UNIQUE

--ALTER ADD NEW COLUMN
-- Ignore next three query, was a mistake
ALTER TABLE [ADVENTUREWORKS].[dbo].[ContactType]
ADD [Net_Amount] BIGINT CHECK (Net_Amount>0 AND Net_Amount<100000000)

ALTER TABLE [ADVENTUREWORKS].[dbo].[ContactType]
DROP CONSTRAINT CK__ContactTy__Net_A__46E78A0C

ALTER TABLE [ADVENTUREWORKS].[dbo].[ContactType]
DROP COLUMN [Net_Amount]

--Object '[Person].Net_Amount' cannot be renamed because the object participates in enforced dependencies.
EXEC sp_rename '[ADVENTUREWORKS].[dbo].[Person].Net_Amount', 'NetAmount', 'COLUMN'

--ADD NEW COLUMN TO PERSON TABLE
ALTER TABLE [ADVENTUREWORKS].[dbo].[Person]
ADD [Net_Amount] BIGINT CHECK (Net_Amount>0 AND Net_Amount<100000000)

--ALTER DATATYPE TO USER DEFINED DATATYPE
ALTER TABLE [ADVENTUREWORKS].[dbo].[Person]
ALTER COLUMN [FirstName] Name

ALTER TABLE [ADVENTUREWORKS].[dbo].[Person]
ALTER COLUMN [LastName] Name

ALTER TABLE [ADVENTUREWORKS].[dbo].[Person]
ALTER COLUMN [NameStyle] NameStyle