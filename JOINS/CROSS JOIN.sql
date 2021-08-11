SELECT * FROM [ADVENTUREWORKS].[dbo].[StateProvince]
SELECT * FROM [ADVENTUREWORKS].[dbo].[CountryRegion]

-- [CountryRegionCode] Column is common in both the above tables

SELECT		[StateProvinceCode], [CountryRegion].[Name], [TerritoryID], [StateProvince].[CountryRegionCode]
FROM		[ADVENTUREWORKS].[dbo].[StateProvince]
CROSS JOIN  [ADVENTUREWORKS].[dbo].[CountryRegion]

-- Returns a cartesian product of  both tables 6*4 = 24 rows generated in CROSS JOIN
-- CROSS JOIN Doesnt allow ON clause