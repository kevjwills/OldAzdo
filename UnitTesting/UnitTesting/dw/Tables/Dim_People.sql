CREATE TABLE [dw].[Dim_People]
(
	[sk_PeopleId] INT IDENTITY(1, 1) NOT NULL CONSTRAINT PK_People PRIMARY KEY
	,nk_PersonId INT NOT NULL
	,FirstName VARCHAR(30) NOT NULL
	,Surname VARCHAR(30) NOT NULL
	,FirstInitial CHAR(1) NOT NULL
	,FirstInitialSurname VARCHAR(32) NOT NULL
);
GO
