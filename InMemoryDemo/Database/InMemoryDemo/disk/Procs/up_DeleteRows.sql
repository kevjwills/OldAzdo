CREATE PROCEDURE [disk].[up_DeleteRows]
	
AS
	delete b
	from disk.BigTable b
	JOIN disk.RowsToDelete r ON b.Id = r.Id