SELECT * from [ADVENTUREWORKS].[dbo].[Person]

SELECT		[Title], COUNT([EmailPromotion]) AS [Total Count]
FROM		[ADVENTUREWORKS].[dbo].[Person]
GROUP BY	[Title]
ORDER BY    [Title]

SELECT		[Title], SUM([EmailPromotion]) AS [SUM OF EMAIL PROMOTION]
FROM		[ADVENTUREWORKS].[dbo].[Person]
GROUP BY	[Title]
ORDER BY    [Title]

SELECT		[Title], MAX([Net_Amount]) AS [MAX NET AMOUNT]
FROM		[ADVENTUREWORKS].[dbo].[Person]
GROUP BY	[Title]
ORDER BY    [Title]

SELECT		[Title], MIN([Net_Amount]) AS [MIN NET AMOUNT]
FROM		[ADVENTUREWORKS].[dbo].[Person]
GROUP BY	[Title]
ORDER BY    [Title]

SELECT		[Title], STDEVP([Net_Amount]) AS [Standard Deviation in Net Amount]
FROM		[ADVENTUREWORKS].[dbo].[Person]
GROUP BY	[Title]
ORDER BY    [Title]

SELECT		[Title], VAR([Net_Amount]) AS [Variance in Net Amount]
FROM		[ADVENTUREWORKS].[dbo].[Person]
GROUP BY	[Title]
ORDER BY    [Title] --return NULL to uncalculated rows

SELECT		[Title], VARP([Net_Amount]) AS [Variance Population in Net AMount]
FROM		[ADVENTUREWORKS].[dbo].[Person]
GROUP BY	[Title]
ORDER BY    [Title] --return 0 to uncalculated rows

SELECT		[Title],[Suffix], SUM([Net_Amount]) AS [TOTAL NET INCOME]
FROM		[ADVENTUREWORKS].[dbo].[Person]
GROUP BY	[Title],[Suffix]
HAVING		[Suffix] IN ('Mr','Ms')

SELECT		[Title],[Suffix], SUM([Net_Amount]) AS [TOTAL NET INCOME]
FROM		[ADVENTUREWORKS].[dbo].[Person]
GROUP BY	[Title],[Suffix]
HAVING		[Suffix] NOT IN ('Mr','Ms') -- only For Mrs

SELECT		[Title], SUM([Net_Amount]) AS [TOTAL NET INCOME],  MAX([Net_Amount]) AS [MAX NET AMOUNT]
FROM		[ADVENTUREWORKS].[dbo].[Person]
GROUP BY	[Title]


