/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [idx],
		FILENAME = '$(DefaultDataPath)$(DefaultFilePrefix)_idx.ndf'
		,FILEGROWTH = 1024000KB
	)
	
	TO FILEGROUP [idx]