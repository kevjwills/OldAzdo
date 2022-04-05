--Correlated subqueries

declare @Table TABLE (Person VARCHAR(10)
						,ActivityDate DATE)

;with DatesLoop as (SELECT CAST('20000101' AS DATE) AS MyDate
						UNION ALL
					SELECT DATEADD(d, 1, MyDate) 
					from DatesLoop
					WHERE DATEADD(d, 1, MyDate) < GETDATE())
INSERT @Table(Person, ActivityDate)

Select 'Pascal', MyDate FROM DatesLoop
option (maxrecursion 0)

--insert some random dates from Michelle

insert @Table(Person, ActivityDate)
SELECT TOP 100 'Michelle', ActivityDate
from @Table
order by newid()



select *
	,(SELECT MAX(t2.ActivityDate) FROM @Table t2 WHERE t1.Person = t2.Person and t2.ActivityDate < t1.ActivityDate)		 AS PreviousActivity
FROm @Table t1
WHERE t1.Person = 'Michelle'
ORDER BY t1.ActivityDate