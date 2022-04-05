/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [Numbers001],
		FILENAME = '$(DefaultDataPath)$(DefaultFilePrefix)_Numbers001.ndf'
	)
	to filegroup [Numbers001]

GO

