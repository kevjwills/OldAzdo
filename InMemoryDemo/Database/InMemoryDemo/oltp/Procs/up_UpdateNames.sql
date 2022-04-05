/*
The database must have a MEMORY_OPTIMIZED_DATA filegroup
before the memory optimized object can be created.
*/

CREATE PROCEDURE [oltp].[up_UpdateNames]
	
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS BEGIN ATOMIC WITH (
      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
      LANGUAGE = N'English')
	update oltp.BigTable_Destination
SET Name = 'Tomas'
--RETURN 0
END