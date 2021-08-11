UPDATE		[ADVENTUREWORKS].[dbo].[Person]
SET			[Net_Amount] = 65473
WHERE		[BusinessEntityId] = 106

UPDATE		[ADVENTUREWORKS].[dbo].[Person]
SET			[FirstName] = 'Josh'
WHERE		[BusinessEntityId] = 104

UPDATE		[ADVENTUREWORKS].[dbo].[Person]
SET			[Title] = 'Actor'
WHERE		[FirstName] = 'Sherlock'

UPDATE		[ADVENTUREWORKS].[dbo].[Person]
SET			[Title] = 'Student'
WHERE		[Title] IS NULL