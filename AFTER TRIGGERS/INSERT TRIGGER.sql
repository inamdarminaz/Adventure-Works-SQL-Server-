SELECT * FROM [ADVENTUREWORKS].[dbo].[Person_Temporal]
SELECT * FROM [ADVENTUREWORKS].[dbo].[Person_Temporal_History]
GO
--INSERT TRIGGER

CREATE OR ALTER TRIGGER [dbo].TRG_Person_Temporal_History_ForInsert
ON	[ADVENTUREWORKS].[dbo].[Person_Temporal]
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO [ADVENTUREWORKS].[dbo].[Person_Temporal_History]
			([PersonType],
			[NameStyle],
			[Title],
			[FirstName],
			[MiddleName] ,
			[LastName],
			[Suffix],
			[EmailPromotion],
			[ValidFrom],
			[ValidTo])

	SELECT	[PersonType],
			[NameStyle],
			[Title],
			[FirstName],
			[MiddleName] ,
			[LastName],
			[Suffix],
			[EmailPromotion],
			[ValidFrom],
			[ValidTo]
	FROM inserted 
END

INSERT INTO [ADVENTUREWORKS].[dbo].[Person_Temporal]
(	
	[PersonType],
	[NameStyle],
	[Title],
	[FirstName],
	[MiddleName] ,
	[LastName],
	[Suffix],
	[EmailPromotion],
	[ValidFrom],
	[ValidTo]
)
VALUES
('F','F-M-I','Asst','Chloe','M','Ellie','Mrs',7564,'2006-05-08 12:35:29.1234567','2007-05-08 12:35:29.1234567')