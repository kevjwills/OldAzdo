--Sub queries

--WHERE IN

declare @FactTable TABLE (ActivityId INT NOT NULL
							,DateOfActivity DATETIME DEFAULT GETDATE()
							,IdNumberRef UNIQUEIDENTIFIER DEFAULT NEWSEQUENTIALID()
							)

;with Numbers AS (Select 1 as n
					union all
					select n + 1
					from Numbers
					where n+1 < = 100000)
INSERT @FactTable(ActivityId)
select n % 6
	 
FROM Numbers
option(maxrecursion 0)

declare @ActivityLookup TABLE(Id INT,  ActivityCategory VARCHAR(50))
								
insert @ActivityLookup(Id, ActivityCategory)
values
(1, 'Emails')
,(2, 'Logins')
,(3, 'Emails')

select * FROM @FactTable
where ActivityId In (SELECT Id from @ActivityLookup where ActivityCategory = 'Emails')