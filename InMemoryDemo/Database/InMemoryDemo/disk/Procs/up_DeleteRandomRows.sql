CREATE PROCEDURE [disk].[up_DeleteRandomRows] @Number INT

AS 
begin
	  DELETE 
from disk.BigTable
where Id % @Number = 0
	END