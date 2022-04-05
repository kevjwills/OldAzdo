CREATE PROCEDURE [oltp].[up_DeleteRows]
--WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
--AS BEGIN ATOMIC WITH (
--      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
--      LANGUAGE = N'English')
AS

	delete b
	from oltp.BigTable b
	JOIN oltp.RowsToDelete r ON b.Id = r.Id
	--END