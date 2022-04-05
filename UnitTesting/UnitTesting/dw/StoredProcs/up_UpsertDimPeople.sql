CREATE PROCEDURE [dw].[up_UpsertDimPeople]
	
AS
BEGIN
BEGIN TRY

	SELECT 'This is not do anything' AS Caption;

	--;WITH src AS (SELECT Id
	--				,LEFT([Name], CHARINDEX(' ', [Name]) - 1) AS Forename
	--				,SUBSTRING([Name], CHARINDEX(' ', [Name]) + 1, 100) AS Surname
	--				,'' AS FirstInitial
	--				,CONCAT(LEFT([Name], 1), ', ', SUBSTRING([Name], CHARINDEX(' ', [Name]) + 1, 100))   AS FirstInitialSurname
	--			FROM src.People
	--			)

	--MERGE dw.Dim_People AS tgt
	--USING src ON tgt.nk_PersonId = src.Id
	--WHEN NOT MATCHED THEN
	--INSERT (nk_PersonId
	--,FirstName
	--,Surname
	--,FirstInitial
	--,FirstInitialSurname
	--)
	--VALUES
	--(src.Id, src.Forename, src.Surname, src.FirstInitial, src.FirstInitialSurname);

END TRY
BEGIN CATCH
	THROW
END CATCH
END