CREATE OR ALTER TRIGGER [dbo].TRG_Person_Temporal_History_ForUpdate
ON	[ADVENTUREWORKS].[dbo].[Person_Temporal]
FOR UPDATE
AS
BEGIN
	DECLARE @id INT,
			@personType NCHAR(20),
			@namestyle  VARCHAR(20),
			@title NCHAR(20),
			@suffix NVARCHAR(20),
			@email INT,
			@message VARCHAR(50)

	SELECT @id = [BusinessEntityId] from inserted
	SELECT @personType = [PersonType] from inserted
	SELECT @namestyle = [NameStyle] from inserted
	SELECT @title = [Title] from inserted
	SELECT @suffix = [Suffix] from inserted
	SELECT @email = [EmailPromotion] from inserted

	IF UPDATE([PersonType])
	BEGIN
		SET @message = 'Updated person type'
	END

	IF UPDATE([NameStyle])
	BEGIN
		SET @message = 'Updated person name style'
	END

	IF UPDATE([Title])
	BEGIN
		SET @message = 'Updated person title'
	END

	IF UPDATE([Suffix])
	BEGIN
		SET @message = 'Updated person suffix'
	END

	IF UPDATE([EmailPromotion])
	BEGIN
		SET @message = 'Updated person email promotion'
	END

	 UPDATE [ADVENTUREWORKS].[dbo].[Person_Temporal_History]
	 SET
			[PersonType]= @personType,
			[NameStyle]= @namestyle,
			[Title] =@title,
			[Suffix]=@suffix,
			[EmailPromotion]=@email
	WHERE   [BusinessEntityId] = @id
	PRINT @message
END
GO

SELECT * FROM [ADVENTUREWORKS].[dbo].[Person_Temporal]
SELECT * FROM [ADVENTUREWORKS].[dbo].[Person_Temporal_History]
GO

UPDATE [ADVENTUREWORKS].[dbo].[Person_Temporal] 
SET [Title] = 'Actor'
WHERE [BusinessEntityId] = 101