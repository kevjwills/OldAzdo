CREATE PROCEDURE [oltp].[up_DeleteRandomRows] @Number INT
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER 
AS BEGIN ATOMIC WITH (
      TRANSACTION ISOLATION LEVEL = SNAPSHOT,
      LANGUAGE = N'English')

	  DELETE 
from oltp.BigTable
where Id % @Number = 0
	END