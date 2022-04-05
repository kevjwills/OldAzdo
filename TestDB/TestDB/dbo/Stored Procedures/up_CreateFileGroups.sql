--USE [master]
--GO
--ALTER DATABASE [TestDB] ADD FILEGROUP [Numbers1]
--GO
--ALTER DATABASE [TestDB] ADD FILEGROUP [Numbers2]
--GO


CREATE PROC up_CreateFileGroups
AS
DECLARE @sql VARCHAR(max)
DECLARE @i int = 1

WHILE @i < = 10
BEGIN
	SET @sql = 'ALTER DATABASE [TestDB] ADD FILEGROUP [Numbers' + RIGHT('00' + CONVERT(VARCHAR(3),@i),3) + ']'

	EXEC (@sql)

	SET @i += 1
END