

CREATE PROC [dbo].[up_AddDatabaseFiles]
AS
DECLARE @sql VARCHAR(max)
DECLARE @i int = 1
DECLARE @Suffix varchar(3)
WHILE @i < = 10
BEGIN
	SET @Suffix = RIGHT('00' + CONVERT(VARCHAR(3),@i),3)
	--SET @sql = 'ALTER DATABASE [TestDB] ADD FILEGROUP [Numbers' + RIGHT('00' + CONVERT(VARCHAR(3),@i),3) + ']'
	SET @sql = 'ALTER DATABASE [TestDB] ADD FILE ( NAME = N''TestDB_Numbers' + @Suffix + '''
									, FILENAME = N''C:\Program Files\Microsoft SQL Server\MSSQL12.MIS2014\MSSQL\DATA\TestDB_Numbers' + @Suffix  + '.ndf''' 
								+	', SIZE = 5120KB , FILEGROWTH = 1024KB ) TO FILEGROUP [Numbers' + @Suffix + ']'
	EXEC (@sql)

	SET @i += 1
END


