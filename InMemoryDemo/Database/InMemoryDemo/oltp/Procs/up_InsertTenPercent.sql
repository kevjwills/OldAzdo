/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.
*/

CREATE PROCEDURE [oltp].[up_InsertTenPercent]
	
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS BEGIN ATOMIC WITH (
      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
      LANGUAGE = N'English')

	delete oltp.RowsToDelete

	INSERT oltp.RowsToDelete
	SELECT Id 
	from oltp.BigTable
	WHERE Id % 10 = 0
RETURN 0
END