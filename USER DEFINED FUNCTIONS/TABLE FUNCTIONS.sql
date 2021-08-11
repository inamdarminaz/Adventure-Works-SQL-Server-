
SELECT * FROM [ADVENTUREWORKS].[dbo].[Person]
GO

CREATE OR ALTER FUNCTION udfTitles
(
@title NCHAR(6) --(Messed up by writing it VARCHAR write the same datatype you used whene defining the table)
)
RETURNS TABLE AS
RETURN
SELECT		[FirstName],[Title],[Net_Amount] FROM [ADVENTUREWORKS].[dbo].[Person] WHERE [Title] =@title


SELECT * FROM udfTitles('Poet') --now remember just as variables these tables also  have scope of one batch so 
GO

DROP FUNCTION IF EXISTS [dbo].udfTitles,[dbo].GetEmailPromotionByNet
GO

--SCHEMA BINDING
