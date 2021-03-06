/*
using System.Data.SqlTypes;


public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString SplitX(string StringToSplit, char Delimiter, int Position)
    {
        // Put your code here
        try
        {
            string[] values;

            values = StringToSplit.Split(Delimiter);

            int i = values.GetUpperBound(0);

            if (Position > i)
            {
                return null;
            }
            else
            {
                return values[Position];
            }

        }
        catch
        {
            return null;
        }




    }
}

*/

DECLARE @Levels TABLE(LevelNo INT
						,LevelName VARCHAR(30)
					)

INSERT @Levels(LevelNo, LevelName)
VALUES
(1, 'Region')
,(2,'Area')
,(3,'Team')
,(4,'Account Director')
,(5,'Sales Person')

DECLARE @BI TABLE ( Name        nvarchar(250)
,                   Code        nvarchar(250)
,                   Parent_Code nvarchar(250)
,                   Parent_Name nvarchar(250)
,                   NamedLevel  nvarchar(200) )

INSERT @BI
VALUES ( N'Remo',     N'1',  NULL, NULL,      N'Region'    )
,      ( N'Vaida',    N'2',  N'1', N'Remo',   N'Principal' )
,      ( N'Tomas',    N'3',  N'1', N'Remo',   N'Team'      )
,      ( N'Kevin',    N'4',  N'3', N'Tomas',  N'Sales'     )
,      ( N'Faisal',   N'5',  N'3', N'Tomas',  N'Test'      )
,      ( N'Vytautas', N'6',  N'3', N'Tomas',  N'Sales'     )
,      ( N'Steve',    N'7',  N'3', N'Tomas',  N'Sales'     )
,      ( N'Claire',   N'8',  N'1', N'Remo',   N'Team'      )
,      ( N'Agne',     N'9',  N'8', N'Claire', N'Sales'     )
,      ( N'Ieva',     N'10', N'8', N'Claire', N'Sales'     )
,      ( N'Marius',   N'11', N'8', N'Claire', N'Sales'     )
,      ( N'Andrejus', N'12', N'1', N'Remo',   N'Principal' )




;WITH BI_Structure AS (
						SELECT 
							  [Name]
							  ,[Code]
							  ,Parent_Code
							  ,CAST(1 AS INT) AS Lvl
							  ,Parent_Name AS ManagerName
							  ,NamedLevel
							  ,CAST(Parent_Name AS NVARCHAR(4000)) + '|' AS ManagerPath
						  FROM @BI
						  WHERE Parent_Code IS NULL
						  UNION ALL
						  SELECT bi2.[Name]
							  ,bi2.[Code]
							  ,bi2.[Parent_Code]
							  ,bi.Lvl + 1
							  ,bi2.[Parent_Name] AS ManagerName
							  ,bi2.NamedLevel
							  ,CONCAT(bi.ManagerPath, bi2.Parent_Name, '|')
						  FROM @BI bi2
						  JOIN BI_Structure bi ON bi2.Parent_Code = bi.Code
						  )
,Hierarchy AS (
			  SELECT Name
					,Code
					,Parent_Code
					,Lvl
					,ManagerName
					,NamedLevel
					,LEFT(ManagerPath, LEN(ManagerPath) - 1) AS ManagerPath
				FROM BI_Structure
				)
SELECT  b.Code AS nk_Id
			,b.Lvl AS LevelInHierarchy
			,l.LevelName
			, b.Name AS NameOfPerson
			,b.ManagerPath
			--USE ISNULL to cascade current level downwards
			,ISNULL(clr.dbo.SplitX(b.ManagerPath, '|', 0), b.Name) AS Level1 --Or name these as Region etc.
			,ISNULL(clr.dbo.SplitX(b.ManagerPath, '|', 1), b.Name) AS Level2
			,ISNULL(clr.dbo.SplitX(b.ManagerPath, '|', 2), b.Name) AS Level3
			,ISNULL(clr.dbo.SplitX(b.ManagerPath, '|', 3), b.Name) AS Level4
FROM Hierarchy b
JOIN @Levels l ON b.Lvl = l.LevelNo
OPTION (MAXRECURSION 0);

--Perfrom re-org in MDS:

DELETE FROM @BI

INSERT @BI
VALUES ( N'Remo',     N'1',  NULL, NULL,      N'Region'    )
,      ( N'Vaida',    N'2',  N'1', N'Remo',   N'Principal' )
,      ( N'Tomas',    N'3',  N'1', N'Remo',   N'Team'      )
,      ( N'Kevin',    N'4',  N'3', N'Tomas',  N'Sales'     )
,      ( N'Faisal',   N'5',  N'3', N'Tomas',  N'Test'      )
,      ( N'Vytautas', N'6',  N'3', N'Tomas',  N'Sales'     )
,      ( N'Steve',    N'7',  N'3', N'Tomas',  N'Sales'     )
,      ( N'Claire',   N'8',  N'1', N'Remo',   N'Team'      )
,      ( N'Agne',     N'9',  N'8', N'Claire', N'Sales'     )
,      ( N'Ieva',     N'10', N'8', N'Claire', N'Sales'     )
,      ( N'Marius',   N'11', N'8', N'Claire', N'Sales'     )
,      ( N'Andrejus', N'12', N'1', N'Remo',   N'Principal' )
,      ( N'NewUser1', N'16', N'4', N'Kevin',  NULL         )
,      ( N'NewUser2', N'17', N'1', N'Remo',   NULL         )




;WITH BI_Structure AS (
						SELECT 
							  [Name]
							  ,[Code]
							  ,Parent_Code
							  ,CAST(1 AS INT) AS Lvl
							  ,Parent_Name AS ManagerName
							  ,NamedLevel
							  ,CAST(Parent_Name AS NVARCHAR(4000)) + '|' AS ManagerPath
						  FROM @BI
						  WHERE Parent_Code IS NULL
						  UNION ALL
						  SELECT bi2.[Name]
							  ,bi2.[Code]
							  ,bi2.[Parent_Code]
							  ,bi.Lvl + 1
							  ,bi2.[Parent_Name] AS ManagerName
							  ,bi2.NamedLevel
							  ,CONCAT(bi.ManagerPath, bi2.Parent_Name, '|')
						  FROM @BI bi2
						  JOIN BI_Structure bi ON bi2.Parent_Code = bi.Code
						  )
,Hierarchy AS (
			  SELECT Name
					,Code
					,Parent_Code
					,Lvl
					,ManagerName
					,NamedLevel
					,LEFT(ManagerPath, LEN(ManagerPath) - 1) AS ManagerPath
				FROM BI_Structure
				)
SELECT  b.Code AS nk_Id
			,b.Lvl AS LevelInHierarchy
			,l.LevelName
			, b.Name AS NameOfPerson
			,b.ManagerPath
			,ISNULL(clr.dbo.SplitX(b.ManagerPath, '|', 0), b.Name) AS Level1 --Or name these as Region etc.
			,ISNULL(clr.dbo.SplitX(b.ManagerPath, '|', 1), b.Name) AS Level2
			,ISNULL(clr.dbo.SplitX(b.ManagerPath, '|', 2), b.Name) AS Level3
			,ISNULL(clr.dbo.SplitX(b.ManagerPath, '|', 3), b.Name) AS Level4
FROM Hierarchy b
JOIN @Levels l ON b.Lvl = l.LevelNo
OPTION (MAXRECURSION 0);


