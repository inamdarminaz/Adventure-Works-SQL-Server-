CREATE TABLE [ADVENTUREWORKS].[dbo].[TestingTable]
(
    ID		INT,
	Name	VARCHAR(20),
	Email	VARCHAR(50),
	City	VARCHAR(180)
)
GO

INSERT INTO [ADVENTUREWORKS].[dbo].[TestingTable]
VALUES
(1,'Emily','e@e.com','Paris'),
(2,'Johnny','j@e.com','Paris'),
(3,'Sarah','s@e.com','London'),
(4,'Harry','h@e.com','UK'),
(5,'Ron','r@e.com','New Jersey'),
(6,'Chris','c@e.com','UK')

CREATE NONCLUSTERED INDEX	IX_Name_Email --KEYWORD NONCLUSTERED is Optional
ON [ADVENTUREWORKS].[dbo].[TestingTable] ([Name],[Email])


CREATE PROC usp_GetCityByNameAndEmail(
@name VARCHAR(20),
@email VARCHAR(50))
AS
BEGIN
	SELECT 
		CONCAT([Name], ' lives in ' ,[City]) AS [Address of User]
	FROM
		[ADVENTUREWORKS].[dbo].[TestingTable]
	WHERE
		[Name]=@name
		AND
		[Email]=@email
END

EXEC usp_GetCityByNameAndEmail 'Chris', 'c@e.com'
-- the query optimizer uses the index IX_Name_Email to find the customer.


--FILTERED INDEXEs