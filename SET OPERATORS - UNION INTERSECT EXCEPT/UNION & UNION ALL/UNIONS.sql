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
UNION
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

-- combines result set rows of two/more tables in on result set
-- UNION removes redundant rows so has to perform DISTINCT SORT


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
UNION ALL
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

--LIA is displayed twice.. redundant rows are not removed in UNION ALL


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
UNION ALL
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
ORDER BY [EmailPromotion]