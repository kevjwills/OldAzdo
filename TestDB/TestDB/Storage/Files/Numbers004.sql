/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [Numbers004],
		FILENAME = '$(DefaultDataPath)$(DefaultFilePrefix)_Numbers004.ndf'
	)
	
	TO FILEGROUP [Numbers004]