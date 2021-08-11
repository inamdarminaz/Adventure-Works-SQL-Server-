--SQL Server stored procedures are used to group one or more Transact-SQL statements into logical units.
--The stored procedure are stored as named objects in the SQL Server Database Server.
--When you call a stored procedure for the first time, SQL Server creates an execution plan and stores it in the cache. 
--In the subsequent executions of the stored procedure, SQL Server reuses the plan so that the stored procedure can execute very fast with reliable performance.


--BEGIN...END statement is used to define a statement block. A statement block consists of a set of SQL statements that execute together. A statement block is also known as a batch.

--
SELECT * FROM [ADVENTUREWORKS].[dbo].[Person]
GO
--SIMPLE PROC
CREATE PROC spGetFullName
AS
BEGIN
	SELECT  [FirstName],
			COALESCE([MiddleName],SUBSTRING([FirstName],1,1)) AS [Middle Initial],
			[LastName]
	FROM    [ADVENTUREWORKS].[dbo].[Person_Temporal_History]
END
GO

EXEC spGetFullName

DROP PROC spGetFullName
GO

-------------------------------------------------------------------------------------------------------------------
-- PROC WITH ONE PARAMETER
CREATE PROC usp_GetAverageOFTitle (@title VARCHAR(20))
AS
BEGIN
	SELECT		[Title], AVG(Net_AMOUNT) AS [Average Net ICome]
	FROM		[ADVENTUREWORKS].[dbo].[Person]
	GROUP BY	[Title]
	HAving		[Title] = @title
END
GO

EXEC usp_GetAverageOFTitle 'Poet'
GO 

--PROC WITH MULTIPLE PARAMETERS 
CREATE PROC spGetMaleActors
@Title NCHAR(20),
@Suffix NVARCHAR(20)
AS
BEGIN
	SELECT	concat([Suffix],'.',[FirstName],[AdditionalContactInfo]) AS [Actor's Information]
	FROM    [ADVENTUREWORKS].[dbo].[Person]
	WHERE   [Title]=@Title AND
			[Suffix]=@Suffix
END

EXEC spGetMaleActors 'Actor','Mr'
GO 

--PROC WITH MULTIPLE PARAMETERS AND OPTIONAL PARAMETERS(provide a default value or use null)
ALTER PROC spGetFemalePoet
(
@Title NCHAR(20),
@Suffix NVARCHAR(20) = 'Ms')
AS
BEGIN
	SELECT	concat([Suffix],'. ',[FirstName],[AdditionalContactInfo]) AS [Actor's Information]
	FROM    [ADVENTUREWORKS].[dbo].[Person]
	WHERE   [Title]=@Title AND
			[Suffix]=@Suffix
END

EXEC spGetFemalePoet 'Poet'
GO 


--------------------------------------------------------------------------------------------------------------------
--OUTPUT PARAMETERS 
CREATE PROC uspGetMaxEmailPromotion
@suffix VARCHAR(3),
@maxEmailPromotion INT OUT
AS
BEGIN
	SELECT		[Suffix],MAX([EmailPromotion]) AS [Maximum Email Promotion]
	FROM		[ADVENTUREWORKS].[dbo].[Person]
	WHERE		[Suffix] = @suffix
	GROUP BY	[Suffix]
END
GO

DECLARE @suffix INT
EXEC uspGetMaxEmailPromotion 'Mr', @suffix OUT
PRINT @suffix
GO

ALTER PROC uspGetMrCount
@suffix VARCHAR(3) = 'Mr',
@MrCount INT OUT
AS
BEGIN
	SELECT  [Suffix],
			[FirstName],
			[Net_Amount]
    FROM    [ADVENTUREWORKS].[dbo].[Person]
    WHERE   [Suffix] = @suffix;

    SELECT @MrCount = @@ROWCOUNT
END
GO

DECLARE @count INT
EXEC uspGetMrCount 'Mrs', @count OUT

SELECT @count AS [Count ot same Suffix as pressed]
GO
--------------------------------------------------------------------------------------------------------------------
--IF ELSE
ALTER PROC uspCheckMaxNetMount
@suffix VARCHAR(3)
AS
BEGIN 
	DECLARE		@netamount INT
	SELECT		@netamount = MAX([Net_Amount])
	FROM		[ADVENTUREWORKS].[dbo].[Person]
	WHERE		[Suffix] = @suffix

	SELECT		@netamount

	IF	@netamount>1000000
	BEGIN
		PRINT		'Great, The Net Amount is higher than 1000000'
	END
	ELSE
	BEGIN
		PRINT		'Sad, The Net Amount is less is 1000000'
	END
END
GO

EXEC uspCheckMaxNetMount 'Mrs'
GO
-------------------------------------------------------------------------------------------------------------
--Todos 
--Nested BEGIN END
--WHILE, BREAK, CONTINUE, 
--CURSORS
--HANDLING EXCEPTION
--DYNAMIC SQL