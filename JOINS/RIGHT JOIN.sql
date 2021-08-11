SELECT * FROM [ADVENTUREWORKS].[dbo].[StateProvince]
SELECT * FROM [ADVENTUREWORKS].[dbo].[CountryRegion]

-- [CountryRegionCode] Column is common in both the above tables

SELECT		[StateProvinceCode], [CountryRegion].[Name], [TerritoryID], [StateProvince].[CountryRegionCode]
FROM		[ADVENTUREWORKS].[dbo].[StateProvince]
RIGHT JOIN  [ADVENTUREWORKS].[dbo].[CountryRegion]
ON			[StateProvince].[CountryRegionCode] = [CountryRegion].[CountryRegionCode]

--matching rows and non matching rows from right table [CountryRegion] are displayed i.e NON NULL + NULL