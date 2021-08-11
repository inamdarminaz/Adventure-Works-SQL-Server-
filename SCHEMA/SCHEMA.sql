USE ADVENTUREWORKS
GO
-- schema is a collection of database objects 
CREATE SCHEMA test_schema
GO

CREATE TABLE [ADVENTUREWORKS].[test_schema].[TestTable]
(
	ID		INT 
	IDENTITY,
	Name	VARCHAR(20),
	Email	VARCHAR(50),
	City	VARCHAR(180)
)

INSERT INTO [ADVENTUREWORKS].[test_schema].[TestTable]
VALUES
('Desmond','desmond@c.com','London'),
('Altair','altair@c.com','London'),
('Evie','evie@c.com','Egypt'),
('Jacob','jacob@c.com','New Zealand')

SELECT * From [ADVENTUREWORKS].[test_schema].[TestTable] ORDER BY [Name]

--ALTER SCHEMA
--STEP 1
--CREATE A TABLE in dbo schema
CREATE TABLE [ADVENTUREWORKS].[dbo].[TestingTable]
(
    ID		INT 
	IDENTITY,
	Name	VARCHAR(20),
	Email	VARCHAR(50),
	City	VARCHAR(180)
);


--STEP 2 Insert some rows in it
INSERT INTO [ADVENTUREWORKS].[dbo].[TestingTable]
VALUES
('Desmond','desmond@c.com','London'),
('Altair','altair@c.com','London')


--STEP 3 CREATE PROC on dbo.testingtable
CREATE PROC usp_GetNameCityById(
@id INT
)
AS
BEGIN
	SELECT  [Name], [City]
	FROM	[ADVENTUREWORKS].[dbo].[TestingTable]
	WHERE   [Id]=@id
END


--STEP 4 ALTER SCHEMA 
--ALTER SCHEMA statement to transfer a securable from one schema to another within the same database.
ALTER SCHEMA [test_schema]	TRANSFER	OBJECT::[dbo].[TestingTable]

--CAnt use the sp_GetNameCityById SP 
EXEC usp_GetNameCityById 1
--Invalid object name 'ADVENTUREWORKS.dbo.TestingTable'.

--STEP 5 ALTER THE SP
ALTER PROC usp_GetNameCityById(
@id INT
)
AS
BEGIN
	SELECT  [Name], [City]
	FROM	[ADVENTUREWORKS].[test_schema].[TestingTable]
	WHERE   [Id]=@id	
END

EXEC usp_GetNameCityById 1

-- it is recommended that you drop and re-create these objects in the new schema instead of using the ALTER SCHEMA statement for moving

--DROP SCHEMA

DROP SCHEMA IF EXISTS [test_schema] --Cannot drop schema 'test_schema' because it is being referenced by object 'TestingTable'.

DROP TABLE IF EXISTS [test_schema].[TestingTable]--Commands completed successfully.
DROP TABLE IF EXISTS [test_schema].[TestTable] --Commands completed successfully.

DROP SCHEMA [test_schema] --Commands completed successfully.