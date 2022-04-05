CREATE proc [dbo].[spPopulateTableOfNumbers]
		(@Records INT = 1000000
	--	,@DropTable bit
		)

AS

SET NOCOUNT ON



IF OBJECT_ID('TestDB.dbo.tblNumbers','u') IS NOT NULL --AND @DropTable = 1
	BEGIN
		DROP TABLE dbo.tblNumbers 
	END

IF OBJECT_ID('TestDB.dbo.tblNumbers','u') IS NULL
BEGIN
	CREATE TABLE dbo.tblNumbers (
								n INT NOT NULL
								)
ON [Numbers001]


CREATE CLUSTERED COLUMNSTORE INDEX [ix_CC_Numbers] ON [dbo].[tblNumbers] WITH (DROP_EXISTING = OFF, COMPRESSION_DELAY = 0) ON [Numbers001]

END

--DECLARE @CurrentMax INT = (SELECT MAX(n) from dbo.tblNumbers)

--IF @Records < @CurrentMax
--BEGIN
--	DELETE FROM dbo.tblNumbers WHERE n > @Records
--	RETURN --QUIT if reducing numnber of records
--END 


DECLARE @max INT, @rc INT;
SET @max = @Records
SET @rc = 1;

INSERT INTO dbo.tblNumbers ([dbo].[tblNumbers].[n])
VALUES(1);

WHILE @rc * 2 <= @max
	BEGIN
		INSERT INTO dbo.tblNumbers([dbo].[tblNumbers].[n])
		SELECT [dbo].[tblNumbers].[n] + @rc 
		FROM dbo.tblNumbers WITH(NOLOCK)

		SET @rc = @rc * 2 
	END

INSERT INTO dbo.tblNumbers
SELECT [dbo].[tblNumbers].[n] + @rc
FROM dbo.tblNumbers WITH(NOLOCK)
WHERE [dbo].[tblNumbers].[n] + @rc <= @max
