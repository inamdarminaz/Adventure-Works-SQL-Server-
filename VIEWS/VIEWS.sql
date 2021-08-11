--VIEWS
--views do not store data except for indexed views.

--A view may consist of columns from multiple tables using joins or just a subset of columns of a single table
--This makes views useful for abstracting or hiding complex queries

-- Advantages [restrict users to access directly]
--			  [simplify the complex queries with joins and conditions using a set of view]
--			  [simplify the complex queries with joins and conditions using a set of view]
--			  [can reference the logic from the views rather than rewriting it in separate queries.]

SELECT * FROM [ADVENTUREWORKS].[dbo].[Person]

SELECT * FROM [ADVENTUREWORKS].[dbo].[StateProvince]

SELECT * FROM [ADVENTUREWORKS].[dbo].[CountryRegion]

SELECT * FROM [ADVENTUREWORKS].[dbo].[Person_Temporal]

SELECT * FROM [ADVENTUREWORKS].[dbo].[Person_Temporal_History]

SELECT * FROM [ADVENTUREWORKS].[dbo].[TestingTable]

CREATE TABLE [ADVENTUREWORKS].[dbo].[TestingTable2]
(
	TId INT PRIMARY KEY,
	SALARY BIGINT,
)

INSERT INTO [ADVENTUREWORKS].[dbo].[TestingTable2]
VALUES
(1,6487684),
(3,877796),
(2,243232),
(6,54634.785),
(5,5674346)

CREATE OR ALTER  VIEW			[dbo].[ViewonTestingTable]
AS
SELECT	[ID],
		[Name],
		[Salary]
FROM  [ADVENTUREWORKS].[dbo].[TestingTable]
INNER JOIN [ADVENTUREWORKS].[dbo].[TestingTable2]
ON [TestingTable].[ID] = [TestingTable2].[TId]


SELECT * FROM [dbo].[ViewonTestingTable2]

CREATE OR ALTER  VIEW			[dbo].[ViewonTestingTable2]
AS
SELECT				[ID],
					[Name],
					SUM([Salary]) AS [SalaryAMT]
FROM				[ADVENTUREWORKS].[dbo].[TestingTable]
INNER JOIN			[ADVENTUREWORKS].[dbo].[TestingTable2]
ON					[TestingTable].[ID] = [TestingTable2].[TId]
GROUP BY			[Name],[ID]
HAVING				SUM([SALARY]) > 54634 AND [Name]  LIKE '[^RJ]%'


SELECT * FROM [dbo].[ViewonTestingTable2]

CREATE OR ALTER VIEW [ViewPeople]
AS 
SELECT
		YEAR([ModifiedDate]) AS [Year],
		MONTH([ModifiedDate]) AS [Month],
		DAY([ModifiedDate]) AS [Day],
		CONCAT([Name],'has territory ID',[TerritoryID]) AS [Territory Information]
FROM   [ADVENTUREWORKS].[dbo].[StateProvince]

SELECT * FROM [ViewPeople] ORDER BY [Month], [Day]

CREATE OR ALTER  VIEW [ViewPeople]
AS 
SELECT
		YEAR([ModifiedDate]) AS [Year],
		MONTH([ModifiedDate]) AS [Month],
		DAY([ModifiedDate]) AS [Day],
		CONCAT([Name],' has territory ID ',[TerritoryID]) AS [Territory Information]
FROM   [ADVENTUREWORKS].[dbo].[StateProvince]

--GET VIEW INFORMATION
SELECT 
    OBJECT_DEFINITION(
        OBJECT_ID(
            '[dbo].[ViewPeople]'
        )
) view_info;

EXEC sp_helptext '[dbo].[ViewPeople]' 
GO

--DROP VIEW
DROP VIEW IF EXISTS [dbo].[ViewPeople]

--TO-DOs
--Listing all views
--Creating a view using aggregate
--SQL Server Indexed View