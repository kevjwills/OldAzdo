CREATE proc [dbo].[spPopNumbers]
		(@Records INT = 10000000
	
		)

AS

SET NOCOUNT ON






DECLARE @max INT, @rc INT;
SET @max = @Records
SET @rc = 1;

INSERT INTO dbo.tblNumbers ([dbo].[tblNumbers].[n])
VALUES(1);

WHILE @rc * 2 <= @max
	BEGIN
		INSERT INTO dbo.tblNumbers([dbo].[tblNumbers].[n], GUIDValue)
		SELECT [dbo].[tblNumbers].[n] + @rc , NEWID()
		FROM dbo.tblNumbers WITH(NOLOCK)

		SET @rc = @rc * 2 
	END

INSERT INTO dbo.tblNumbers(n, GUIDValue)
SELECT [dbo].[tblNumbers].[n] + @rc, NEWID()

FROM dbo.tblNumbers WITH(NOLOCK)
WHERE [dbo].[tblNumbers].[n] + @rc <= @max
