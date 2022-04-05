/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.
*/

CREATE PROCEDURE [disk].up_InsertIntoBigTableDestination
	

AS BEGIN 
	truncate table disk.BigTable_Destination;

	INSERT disk.BigTable_Destination(Id, GuidColumn, Name)
	SELECT Id , GuidColumn, Name
	from disk.BigTable
	

END