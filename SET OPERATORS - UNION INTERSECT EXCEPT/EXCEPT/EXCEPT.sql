--EXCEPT to subtract a result set of a query from another result set of another query.
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
EXCEPT
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
ORDER BY [LastName]

--REturns Dia and Mia from Table 1 because it subtracts table1-table 2 (So mia who belongs to both tables is exculded)
--T1 result set includes 1, 2, and 3.
--T2 result set includes 2, 3, and 4.
--The except of  the T1 and T2 returns 1 which is the distinct row from the T1 result set that does not appear in the T2 result set.