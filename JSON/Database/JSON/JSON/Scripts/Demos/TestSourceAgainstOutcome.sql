--Test one way
SELECT [CustomerId]
      ,[CustomerName]
      ,[CustomerTransactionID]
      ,[TransactionDate]
      ,[AmountExcludingTax]
  FROM [Json_Demo].[dbo].[FromSQL]
  except
  SELECT [CustomerId]
      ,[CustomerName]
      ,[CustomerTransactionID]
      ,[TransactionDate]
      ,[AmountExcludingTax]
  FROM [Json_Demo].[dbo].[FromCSharp]

--Then the other
SELECT [CustomerId]
      ,[CustomerName]
      ,[CustomerTransactionID]
      ,[TransactionDate]
      ,[AmountExcludingTax]
  FROM [Json_Demo].[dbo].[FromCSharp]
except
SELECT [CustomerId]
      ,[CustomerName]
      ,[CustomerTransactionID]
      ,[TransactionDate]
      ,[AmountExcludingTax]
  FROM [Json_Demo].[dbo].[FromSQL]

--Now we know both tables match, check against original source:

declare @parseddata table(
[CustomerId] [int] NULL,
	[CustomerName] [nvarchar](100) NULL,
	[CustomerTransactionID] [int] NULL,
	[TransactionDate] [varchar](10) NULL,
	[AmountExcludingTax] [decimal](18, 2) NULL
	)


insert @parseddata ([CustomerId], [CustomerName], [CustomerTransactionID], [TransactionDate], [AmountExcludingTax])
SELECT [CustomerId]
      ,[CustomerName]
      ,[CustomerTransactionID]
      ,[TransactionDate]
      ,[AmountExcludingTax]
  FROM [Json_Demo].[dbo].[FromCSharp]
union
SELECT [CustomerId]
      ,[CustomerName]
      ,[CustomerTransactionID]
      ,[TransactionDate]
      ,[AmountExcludingTax]
  FROM [Json_Demo].[dbo].[FromSQL]





  SELECT   c.CustomerID, c.CustomerName collate database_default, ct.CustomerTransactionID, ct.TransactionDate, ct.AmountExcludingTax
					FROM        [WideWorldImporters].Sales.CustomerTransactions AS ct INNER JOIN
											[WideWorldImporters].Sales.Customers AS c ON ct.CustomerID = c.CustomerID
EXcept
select * from @parseddata

select * from @parseddata
except
SELECT   c.CustomerID, c.CustomerName collate database_default, ct.CustomerTransactionID, ct.TransactionDate, ct.AmountExcludingTax
					FROM        [WideWorldImporters].Sales.CustomerTransactions AS ct INNER JOIN
											[WideWorldImporters].Sales.Customers AS c ON ct.CustomerID = c.CustomerID											 
					