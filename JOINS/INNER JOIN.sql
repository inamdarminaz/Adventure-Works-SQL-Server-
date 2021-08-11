SELECT * FROM [ADVENTUREWORKS].[dbo].[StateProvince]
SELECT * FROM [ADVENTUREWORKS].[dbo].[CountryRegion]

-- [CountryRegionCode] Column is common in both the above tables

SELECT		[StateProvinceCode], [StateProvince].[Name], [TerritoryID],[StateProvince].[CountryRegionCode]
FROM		[ADVENTUREWORKS].[dbo].[StateProvince]
INNER JOIN  [ADVENTUREWORKS].[dbo].[CountryRegion]
ON			[StateProvince].[CountryRegionCode] = [CountryRegion].[CountryRegionCode]

--Only matching rows are displayed ONLY NON NULL