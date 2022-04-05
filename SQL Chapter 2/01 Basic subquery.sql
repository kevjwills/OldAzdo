--Basic subquery aka Derived table

--Set up some data

declare @FactTable TABLE (ActivityId INT PRIMARY KEY
							,DateOfActivity DATETIME DEFAULT GETDATE()
					
							)

;with Numbers AS (Select 1 as n
					union all
					select n + 1
					from Numbers
					where n+1 < = 1000)
INSERT @FactTable(ActivityId)
select n
FROM Numbers
option(maxrecursion 0)

--Select * from (

	select *
	from @FactTable
	Order by ActivityId
--) as DerivedTable--(SK, Date)
