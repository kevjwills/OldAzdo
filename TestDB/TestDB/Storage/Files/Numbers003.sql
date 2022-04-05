/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [Numbers003],
		FILENAME = '$(DefaultDataPath)$(DefaultFilePrefix)_Numbers003.ndf'
	)
	
	TO FILEGROUP [Numbers003]