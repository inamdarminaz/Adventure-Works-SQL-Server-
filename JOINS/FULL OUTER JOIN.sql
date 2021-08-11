SELECT * FROM [ADVENTUREWORKS].[dbo].[StateProvince]
SELECT * FROM [ADVENTUREWORKS].[dbo].[CountryRegion]

-- [CountryRegionCode] Column is common in both the above tables

SELECT		[StateProvinceCode], [CountryRegion].[Name], [TerritoryID], [StateProvince].[CountryRegionCode]
FROM		[ADVENTUREWORKS].[dbo].[StateProvince]
FULL JOIN   [ADVENTUREWORKS].[dbo].[CountryRegion]
ON			[StateProvince].[CountryRegionCode] = [CountryRegion].[CountryRegionCode]

--Returns all matching and non matching rows from both tables 