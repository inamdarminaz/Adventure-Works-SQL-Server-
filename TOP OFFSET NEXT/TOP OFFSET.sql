SELECT TOP 3 [BusinessEntityId], [FirstName] FROM [ADVENTUREWORKS].[dbo].[Person] ORDER BY [BusinessEntityId]
SELECT TOP 80 PERCENT [BusinessEntityId], [FirstName] FROM [ADVENTUREWORKS].[dbo].[Person] ORDER BY [BusinessEntityId] DESC

--ORDER BY column_list [ASC |DESC]
--OFFSET offset_row_count {ROW | ROWS}
--FETCH {FIRST | NEXT} fetch_row_count {ROW | ROWS} ONLY

--OFFSET clause specifies the number of rows to skip before starting to return rows from the query.
--FETCH clause specifies the number of rows to return after the OFFSET clause has been processed.
--OFFSET IS MANDATORY FETCH IS OPTIONAL 
--FIRST and NEXT are synonyms respectively so you can use them interchangeably
SELECT		[Title],
			[FirstName] 
FROM		[ADVENTUREWORKS].[dbo].[Person]
ORDER BY	[Title]
OFFSET		1 ROW
FETCH NEXT  3 ROWS ONLY

SELECT		[Title],
			[FirstName]
FROM		[ADVENTUREWORKS].[dbo].[Person]
ORDER BY	[Title]
OFFSET		3 ROW

SELECT		[Title],
			[FirstName]
FROM		[ADVENTUREWORKS].[dbo].[Person]
ORDER BY	[Title] DESC
OFFSET		2 ROWS
FETCH FIRST  4 ROWS ONLY

--Note that you must use the OFFSET and FETCH clauses with the ORDER BY clause. Otherwise, you will get an error.