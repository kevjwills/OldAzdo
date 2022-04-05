/*
Do not change the database path or name variables.
Any sqlcmd variables will be properly substituted during 
build and deployment.
*/


	ALTER DATABASE [$(DatabaseName)] ADD FILE (name='imoltp_mod1', filename='$(DefaultDataPath)oltp') TO FILEGROUP oltp