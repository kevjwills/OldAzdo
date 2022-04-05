/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/
ALTER DATABASE [$(DatabaseName)]
	ADD FILE
	(
		NAME = [base],
		FILENAME = '$(DefaultDataPath)$(DefaultFilePrefix)_base.ndf'
		,FILEGROWTH = 1024000KB
	)
	
	TO FILEGROUP [base]