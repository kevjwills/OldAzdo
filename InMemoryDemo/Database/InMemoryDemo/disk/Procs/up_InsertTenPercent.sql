CREATE PROCEDURE [disk].[up_InsertTenPercent]
	
AS
	truncate table disk.RowsToDelete

	INSERT disk.RowsToDelete
	SELECT Id 
	from disk.BigTable
	WHERE Id % 10 = 0
