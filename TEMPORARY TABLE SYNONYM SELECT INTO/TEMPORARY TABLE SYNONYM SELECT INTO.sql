--useful for storing the immediate result sets that are accessed multiple times.
-- two ways to create temporary tables via SELECT INTO and CREATE TABLE
SELECT * FROM [ADVENTUREWORKS].[dbo].[Person]

CREATE SYNONYM PersonTable FOR [ADVENTUREWORKS].[dbo].[Person] -- CREATING SYNONYM
DROP SYNONYM IF EXISTS [dbo].PersonTable --DROP SYNONYM SChema.SYNONYM_NAME

SELECT		[FirstName], --SELECT INTO
			[LastName],
			[Title],
			[Net_Amount]
INTO		#Temp_Actors
FROM		[ADVENTUREWORKS].[dbo].[Person]
WHERE		[Title]='Actor'

SELECT * FROM #Temp_Actors

--OTHER WAY TO CREATE A TEMPORARY TABLE


CREATE TABLE #Temp_ActorTable
(
	[FirstName]		VARCHAR(20),
	[LastName]		VARCHAR(20),
	[Title]			NCHAR(16),
	[Net_Amount]	BIGINT
)

INSERT INTO #Temp_ActorTable
SELECT		[FirstName],
			[LastName],
			[Title],
			[Net_Amount]
FROM		[ADVENTUREWORKS].[dbo].[Person]
WHERE		[Title] = 'Actor'


SELECT * FROM #Temp_ActorTable

--GLOBAL TEMPORARY TABLES
SELECT		[FirstName],
			[LastName],
			[Title],
			[Net_Amount]
INTO		##Temp_Poet
FROM		[ADVENTUREWORKS].[dbo].[Person]
WHERE		[Title]='Poet'

SELECT * FROM ##Temp_Poet

DROP TABLE ##Temp_Poet
