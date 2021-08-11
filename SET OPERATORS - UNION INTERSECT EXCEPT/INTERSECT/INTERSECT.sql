SELECT * FROM [ADVENTUREWORKS].[dbo].[Person_Temporal]
SELECT * FROM [ADVENTUREWORKS].[dbo].[Person_Temporal_History]

SELECT  [PersonType],
		[NameStyle],
		[Title],
		[FirstName],
		[MiddleName] ,
		[LastName],
		[Suffix],
		[EmailPromotion],
		[ValidFrom],
		[ValidTo]
FROM	[ADVENTUREWORKS].[dbo].[Person_Temporal]
INTERSECT
SELECT  [PersonType],
		[NameStyle],
		[Title],
		[FirstName],
		[MiddleName] ,
		[LastName],
		[Suffix],
		[EmailPromotion],
		[ValidFrom],
		[ValidTo]
FROM	[ADVENTUREWORKS].[dbo].[Person_Temporal_History]
ORDER BY[FirstName]
-- INTERSECT operator to combine result sets of two input queries and return the distinct rows that appear in both inputs
--ORDER BY clause to the last query to sort the result set.
--ONLY Lia is common in both the result set from table Person_Temporal & Personal_Temporal_History