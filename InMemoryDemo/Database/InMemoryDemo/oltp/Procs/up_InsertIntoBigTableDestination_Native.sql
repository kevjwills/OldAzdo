/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.
*/

CREATE PROCEDURE [oltp].up_InsertIntoBigTableDestination_Native
	
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS BEGIN ATOMIC WITH (
      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
      LANGUAGE = N'English')
	
	delete oltp.BigTable_Destination;

	INSERT oltp.BigTable_Destination(Id, GuidColumn, Name)
	SELECT Id , GuidColumn, Name
	from oltp.BigTable
	

END