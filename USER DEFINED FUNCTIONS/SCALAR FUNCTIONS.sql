--The SQL Server user-defined functions help you simplify your development by encapsulating complex business logic and make them available for reuse in every query.

--CREATE FUNCTION [schema_name.]function_name (parameter_list)
--RETURNS data_type AS
--BEGIN
--    statements
--    RETURN value
--END

SELECT * FROM [ADVENTUREWORKS].[dbo].[Person]
GO

CREATE OR ALTER FUNCTION GetEmailPromotionByNet (
@emailPromotion INT,
@netamount BIGINT
)
RETURNS BIGINT AS
BEGIN
		RETURN @emailPromotion * @netamount *(@netamount-7673) -- Ignore calculations I dont know what I did myself
END

SELECT [FirstName],[dbo].GetEmailPromotionByNet([EmailPromotion],[Net_Amount]) AS [Calculated Something] --(it was schema.functionname I keep messing up)
FROM [ADVENTUREWORKS].[dbo].[Person]
GO
--Programmability->Functions->Scalar-valued Functions

--Scalar functions can be used almost anywhere in T-SQL statements.
--Scalar functions accept one or more parameters but return only one value, therefore, they must include a RETURN statement.
--Scalar functions can use logic such as IF blocks or WHILE loops.
--Scalar functions cannot update data. They can access data but this is not a good practice.
--Scalar functions can call other functions.

