BEGIN TRAN


--Unit Test to test population of dw.Dim_People using Stored Procedure
--1) Truncate any tables used for test
TRUNCATE TABLE dw.Dim_People
TRUNCATE TABLE src.People




--2) The object I want to test the population of is Dim_People so use it as the basis of a temp test table
IF OBJECT_ID('tempdb..#ExpectedResults', 'U') IS NOT NULL DROP TABLE #ExpectedResults

SELECT nk_PersonId
	,FirstName
	,Surname
	,FirstInitial
	,FirstInitialSurname
INTO #ExpectedResults
FROM dw.Dim_People
--Ensure no rows are inserted into temp table
WHERE 1 = 2

--3) Create exact copy of temp table so that column constraints (except FK constraints are consistent)
IF OBJECT_ID('tempdb..#ReturnedResults', 'U') IS NOT NULL DROP TABLE #ReturnedResults

SELECT *
INTO #ReturnedResults
FROM #ExpectedResults
WHERE 1 = 2

--4) I know from the above what my requirements are so I can insert test data.
INSERT INTO #ExpectedResults --copy and paste column names as above
		(nk_PersonId
	,FirstName
	,Surname
	,FirstInitial
	,FirstInitialSurname
	)
VALUES
(1, 'Kevin', 'Williams', 'K', 'K, Williams')
--This will error 
,(2, 'John', NULL, 'J', 'J, Smith')
---- This will not
--,(2, 'John', 'Smith', 'J', 'J, Smith')



--5) Data required from Source System.
INSERT INTO src.People(Id, [Name])
VALUES
(1, 'Kevin Williams')
,(2, 'John Smith')


--6) Execute Stored Proc to populate dimension
EXEC dw.up_UpsertDimPeople


--7) Select from outputted results (using exact same columns) into #ReturnedResults
INSERT INTO #ReturnedResults(nk_PersonId
	,FirstName
	,Surname
	,FirstInitial
	,FirstInitialSurname)
SELECT nk_PersonId
	,FirstName
	,Surname
	,FirstInitial
	,FirstInitialSurname
FROM dw.Dim_People

--8) Assert Compare results from both tables; Result should be no rows returned

SELECT * FROM (
SELECT * FROM #ExpectedResults
EXCEPT
SELECT * FROM #ReturnedResults
) A
UNION ALL
SELECT * FROM (
SELECT * FROM #ReturnedResults
EXCEPT
SELECT * FROM #ExpectedResults
) B


ROLLBACK TRAN
