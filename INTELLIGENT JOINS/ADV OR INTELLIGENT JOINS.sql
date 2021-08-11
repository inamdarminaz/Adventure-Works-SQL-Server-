SELECT * FROM [ADVENTUREWORKS].[dbo].[StateProvince]
SELECT * FROM [ADVENTUREWORKS].[dbo].[CountryRegion]

-- [CountryRegionCode] Column is common in both the above tables

SELECT		[StateProvinceCode], [CountryRegion].[Name], [TerritoryID], [StateProvince].[CountryRegionCode]
FROM		[ADVENTUREWORKS].[dbo].[StateProvince]
LEFT JOIN  [ADVENTUREWORKS].[dbo].[CountryRegion]
ON			[StateProvince].[CountryRegionCode] = [CountryRegion].[CountryRegionCode]
WHERE		[CountryRegion].[CountryRegionCode] IS NULL -- returns only LEFT TABLE NON MATCHING ROWS (NULL) SP5 & SP6



SELECT		[StateProvinceCode], [CountryRegion].[Name], [TerritoryID], [StateProvince].[CountryRegionCode]
FROM		[ADVENTUREWORKS].[dbo].[StateProvince]
RIGHT JOIN  [ADVENTUREWORKS].[dbo].[CountryRegion]
ON			[StateProvince].[CountryRegionCode] = [CountryRegion].[CountryRegionCode]
WHERE		[StateProvince].[CountryRegionCode] IS NULL -- returns only RIGHT TABLE NON MATCHING ROWS (NULL) TOKYO 


SELECT		[StateProvinceCode], [CountryRegion].[Name], [TerritoryID], [StateProvince].[CountryRegionCode]
FROM		[ADVENTUREWORKS].[dbo].[StateProvince]
FULL  JOIN  [ADVENTUREWORKS].[dbo].[CountryRegion]
ON			[StateProvince].[CountryRegionCode] = [CountryRegion].[CountryRegionCode]
WHERE		[CountryRegion].[CountryRegionCode] IS NULL
			OR
			[StateProvince].[CountryRegionCode] IS NULL
-- returns NON MATCHING ROWS (NULL) IN BOTH TABLES tokyo , SP5, SP6
