
SET NOCOUNT ON;

DECLARE @cnt INT = 0

DECLARE @id INT;
DECLARE @sql NVARCHAR(MAX);

DECLARE sales CURSOR FOR
SELECT CustomerID
FROM  [$(WideWorldImporters)].Sales.Customers 
ORDER BY 1

OPEN sales
FETCH NEXT FROM sales INTO @id

WHILE @@FETCH_STATUS = 0
BEGIN
	
	SET @sql = (
				SELECT   c.CustomerID, c.CustomerName, ct.CustomerTransactionID, ct.TransactionDate, ct.AmountExcludingTax
					FROM        [$(WideWorldImporters)].Sales.CustomerTransactions AS ct INNER JOIN
											[$(WideWorldImporters)].Sales.Customers AS c ON ct.CustomerID = c.CustomerID
											 WHERE c.CustomerID = @id
					ORDER BY 1
					FOR JSON AUTO, WITHOUT_ARRAY_WRAPPER
	)
	IF LEN(@sql) > 0
	BEGIN
	INSERT dbo.TableOfJSON([TheJson])
	SELECT @sql
	
	SET @cnt += 1;
	END
	FETCH NEXT FROM sales INTO @id

	
END

CLOSE sales
DEALLOCATE sales

PRINT FORMATMESSAGE('%i Rows inserted', @cnt);

GO