ALTER TABLE			[ADVENTUREWORKS].[dbo].[StateProvince]
ADD CONSTRAINT		CK_StateProvince_TerritoryID 
CHECK				([TerritoryID]>0 AND [TerritoryID]<500)