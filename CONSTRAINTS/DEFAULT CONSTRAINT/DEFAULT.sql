ALTER TABLE			[ADVENTUREWORKS].[dbo].[Person]
ADD CONSTRAINT		DF_Person_AdditionalContactInfo 
DEFAULT				'No information available' FOR [AdditionalContactInfo]

ALTER TABLE			[ADVENTUREWORKS].[dbo].[Person]
DROP CONSTRAINT		DF_Person_AdditionalContactInfo 

ALTER TABLE			[ADVENTUREWORKS].[dbo].[StateProvince]
ADD CONSTRAINT		DF_StateProvince_TerritoryID
DEFAULT 111 FOR		[TerritoryID]

ALTER TABLE			[ADVENTUREWORKS].[dbo].[StateProvince]
DROP CONSTRAINT		DF_StateProvince_TerritoryID